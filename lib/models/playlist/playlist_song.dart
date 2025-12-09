class PlaylistSong {
  final String _id;
  String _songId;
  int _trackNumber;
  String _addedBy;
  final DateTime _addedAt;

  //Constructor
  PlaylistSong({
    required String id,
    required String songId,
    required int trackNumber,
    required String addedBy,
  }) : _id = id,
       _songId = songId,
       _trackNumber = trackNumber,
       _addedBy = addedBy,
       _addedAt = DateTime.now();

  //Llista de getters
  String get id => _id;
  String get songId => _songId;
  int get trackNumber => _trackNumber;
  String get addedBy => _addedBy;
  DateTime get addedAt => _addedAt;

  //Llista de setters
  set trackNumber(int trackNumber) => _trackNumber = trackNumber;
}
