import 'package:cloud_firestore/cloud_firestore.dart';

class PlaylistSong {
  String _songId;
  int _trackNumber;
  String _addedBy;
  final DateTime _addedAt;

  //Constructor
  PlaylistSong({
    required String songId,
    required int trackNumber,
    required String addedBy,
    DateTime? addedAt,
  }) : _songId = songId,
       _trackNumber = trackNumber,
       _addedBy = addedBy,
       _addedAt = addedAt ?? DateTime.now();

  //Llista de getters
  String get songId => _songId;
  int get trackNumber => _trackNumber;
  String get addedBy => _addedBy;
  DateTime get addedAt => _addedAt;

  //Llista de setters
  set trackNumber(int trackNumber) => _trackNumber = trackNumber;

  factory PlaylistSong.fromMap(Map<String, dynamic> data) {
    return PlaylistSong(
      songId: data['songId'] as String,
      trackNumber: data['trackNumber'] as int,
      addedBy: data['addedBy'] as String,
      addedAt: (data['addedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'songId': _songId,
      'trackNumber': _trackNumber,
      'addedBy': _addedBy,
      'addedAt': Timestamp.fromDate(_addedAt),
    };
  }
}
