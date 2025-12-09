class AlbumSong {
  final String _id;
  String _songId;
  int _trackNumber;
  final DateTime _addedAt;

  //Constructor
  AlbumSong({
    required String id,
    required String songId,
    required int trackNumber,
  }) : _id = id,
       _songId = songId,
       _trackNumber = trackNumber,
       _addedAt = DateTime.now();

  //Llista de getters
  String get id => _id;
  String get songId => _songId;
  int get trackNumber => _trackNumber;
  DateTime get addedAt => _addedAt;

  //Llista de setters
  set songId(String songId) => _songId = songId;
  set trackNumber(int trackNumber) => _trackNumber = trackNumber;
}
