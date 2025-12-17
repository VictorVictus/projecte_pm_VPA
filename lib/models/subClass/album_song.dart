import 'package:cloud_firestore/cloud_firestore.dart';

class AlbumSong {
  String _songId;
  int _trackNumber;
  final Timestamp _addedAt;

  //Constructor
  AlbumSong({
    required String songId,
    required int trackNumber,
    Timestamp? addedAt,
  }) : _songId = songId,
       _trackNumber = trackNumber,
       _addedAt = addedAt ?? Timestamp.now();

  //Llista de getters
  String get songId => _songId;
  int get trackNumber => _trackNumber;
  Timestamp get addedAt => _addedAt;

  //Llista de setters
  set songId(String songId) => _songId = songId;
  set trackNumber(int trackNumber) => _trackNumber = trackNumber;

  factory AlbumSong.fromMap(Map<String, dynamic> data) {
    return AlbumSong(
      songId: data['songId'] as String,
      trackNumber: data['trackNumber'] as int,
      addedAt: data['addedAt'] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'songId': _songId,
      'trackNumber': _trackNumber,
      'addedAt': _addedAt,
    };
  }
}
