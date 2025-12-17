import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projecte_pm/models/subClass/save_id.dart';
import 'package:projecte_pm/models/user.dart';
import 'dart:developer';

class UserService {
  final FirebaseFirestore _firestore;
  final DocumentReference? _currentUserRef;
  User _user;

  UserService._({
    required FirebaseFirestore firestore,
    required DocumentReference currentUserRef,
    required User user,
  }) : _firestore = firestore,
       _currentUserRef = currentUserRef,
       _user = user;

  static Future<UserService> create({required String userId}) async {
    final firestore = FirebaseFirestore.instance;
    final ref = firestore.collection('users').doc(userId);

    final snap = await ref.get();
    if (!snap.exists) {
      throw Exception('Usuari no trobat');
    }

    final user = User.fromMap(snap.data() as Map<String, dynamic>);

    return UserService._(firestore: firestore, currentUserRef: ref, user: user);
  }

  String? get currentUserId => _user.id;
  DocumentReference? get currentUserRef => _currentUserRef;

  // Getters de user
  User get user => _user;

  // Metòdes CRUD
  Future<User?> getCurrentUser() async {
    if (_currentUserRef == null) return null;
    final snap = await _currentUserRef!.get();
    if (!snap.exists) return null;
    log('Dades usuari rebudes: ${snap.data()}', name: 'FIREBASE_LOG');
    return User.fromMap(snap.data() as Map<String, dynamic>);
  }

  Future<void> refreshUser() async {
    final snap = await _currentUserRef!.get();
    _user = User.fromMap(snap.data() as Map<String, dynamic>);
  }

  Future<void> updateUser(User user) async {
    if (_currentUserRef == null) return;
    try {
      // Actualitzem només els camps necessaris (excepte ID i email que solen ser fixos)
      await _currentUserRef!.update(user.toMap());
    } catch (e) {
      print("Error actualitzant usuari: $e");
      rethrow; // Llancem l'error perquè la UI sàpiga que ha fallat
    }
  }

  // Altres Mètodes
  Future<void> followUser(String targetUserId) async {
    if (_currentUserRef == targetUserId) return;

    final batch = _firestore.batch();

    final myFollowingRef = _currentUserRef!
        .collection('following')
        .doc(targetUserId);

    final targetUserRef = _firestore
        .collection('users')
        .doc(targetUserId)
        .collection('followers')
        .doc(_user.id);

    final relation = SaveId(id: targetUserId);

    batch.set(myFollowingRef, relation.toMap());
    batch.set(targetUserRef, relation.toMap());

    await batch.commit();
  }

  Future<void> unfollowUser(String targetUserId) async {
    if (_currentUserRef == targetUserId || _currentUserRef == null) return;

    final batch = _firestore.batch();

    batch.delete(_currentUserRef!.collection('following').doc(targetUserId));
    batch.delete(
      _firestore
          .collection('users')
          .doc(targetUserId)
          .collection('followers')
          .doc(_user.id),
    );

    await batch.commit();
  }

  // Rebre novetats
  Future<List<Map<String, dynamic>>> getGlobalNewReleases() async {

    try {
      // 1. SONGS
     // log('2. Llançant consulta Songs...', name: 'DEBUG_FIREBASE');
      final songsQuery = _firestore
          .collection('songs')
          .orderBy('createdAt', descending: true)
          .limit(5)
          .get();

      // 2. ALBUMS
     // log('3. Llançant consulta Albums...', name: 'DEBUG_FIREBASE');
      final albumsQuery = _firestore
          .collection('albums')
          .orderBy('createdAt', descending: true)
          .limit(5)
          .get();

      // 3. PLAYLISTS (Aquesta sol fallar per l'índex)
      /*log('4. Llançant consulta Playlists...', name: 'DEBUG_FIREBASE');
      final playlistsQuery = _firestore
          .collection('playlists')
          .where('isPublic', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .limit(5)
          .get();*/

      // Esperem totes
      final results = await Future.wait([
        songsQuery,
        albumsQuery,
        //playlistsQuery,
      ]);

     /* log(
        '5. Resultats rebuts. Songs: ${results[0].size}, Albums: ${results[1].size}, Playlists: {results[2].size}',
        name: 'DEBUG_FIREBASE',
      );*/

      List<Map<String, dynamic>> mixedList = [];

      // Funció auxiliar per llegir dates de forma segura
      DateTime getDate(DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>?;
        if (data != null &&
            data['createdAt'] != null &&
            data['createdAt'] is Timestamp) {
          return (data['createdAt'] as Timestamp).toDate();
        }
        return DateTime.now(); // Data per defecte si falla
      }

      // Processar Cançons
      for (var doc in results[0].docs) {
        final data = doc.data() as Map<String, dynamic>; // Casteig segur a Map
        mixedList.add({
          'id': doc.id,
          'type': 'song',
          'title': data['name'] ?? 'Sense títol',
          'subtitle': 'Song',
          'imageUrl': data['coverURL'] ?? '',
          'createdAt': getDate(doc),
        });
      }

      // Processar Àlbums
      for (var doc in results[1].docs) {
        final data = doc.data() as Map<String, dynamic>;
        mixedList.add({
          'id': doc.id,
          'type': 'album',
          'title': data['name'] ?? 'Sense títol',
          'subtitle': 'Àlbum',
          'imageUrl': data['coverURL'] ?? '',
          'createdAt': getDate(doc),
        });
      }
      /*
      // Processar Playlists
      for (var doc in results[2].docs) {
        final data = doc.data() as Map<String, dynamic>;
        mixedList.add({
          'id': doc.id,
          'type': 'playlist',
          'title': data['name'] ?? 'Sense nom',
          'subtitle': 'Playlist',
          'imageUrl': data['coverURL'] ?? '',
          'createdAt': getDate(doc),
        });
      }*/

      mixedList.sort((a, b) => b['createdAt'].compareTo(a['createdAt']));

      /*log(
        '6. Finalitzat amb ${mixedList.length} elements.',
        name: 'DEBUG_FIREBASE',
      );*/
      return mixedList.take(10).toList();
    } catch (e, stackTrace) {
      // Això és vital per veure l'error real
      log('ERROR CRÍTIC: $e', name: 'DEBUG_ERROR');
      log('STACK TRACE: $stackTrace', name: 'DEBUG_ERROR');
      return [];
    }
  }

  // Novetats artistes que segueixo
  Future<List<Map<String, dynamic>>> getFollowedArtistsReleases() async {
    try {
      // Pas 1: Obtenir la llista d'artistes que l'usuari segueix
      final followingSnapshot = await _firestore
          .collection('users')
          .doc(currentUserId)
          .collection('following')
          .get();

      if (followingSnapshot.docs.isEmpty) return [];

      // Obtenir la llista d'IDs
      List<String> followedArtistIds = followingSnapshot.docs
          .map((doc) => doc.id)
          .toList();

      List<String> targetIds = followedArtistIds.take(10).toList();

      // Pas 2: Buscar cançons d'aquests artistes
      List<DocumentReference> artistRefs = targetIds
          .map((id) => _firestore.collection('artists').doc(id))
          .toList();

      final songsSnapshot = await _firestore
          .collection('songs')
          .where('artistId', whereIn: artistRefs)
          .orderBy('createdAt', descending: true)
          .limit(10)
          .get();

      List<Map<String, dynamic>> releases = [];

      for (var doc in songsSnapshot.docs) {
        releases.add({
          'id': doc.id,
          'type': 'song',
          'title': doc['title'],
          'subtitle': doc['artistName'],
          'imageUrl': doc['coverURL'],
        });
      }

      return releases;
    } catch (e) {
      print("Error fetching followed artists releases: $e");
      return [];
    }
  }
}
