class SongAlbum {
  final String _id;
  final String _albumId;
  final DateTime _addedAt;

  //Constructor
  SongAlbum({required String id, required String albumId})
    : _id = id,
      _albumId = albumId,
      _addedAt = DateTime.now();

  //Llista de getters
  String get id => _id;
  String get albumId => _albumId;
  DateTime get addedAt => _addedAt;
}
