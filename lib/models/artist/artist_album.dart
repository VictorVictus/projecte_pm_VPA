class ArtistAlbum {
  final String _id;
  final String _albumId;
  final DateTime _addedAt;

  //Constructor
  ArtistAlbum({
    required String id,
    required String albumId,
    required String addedBy,
  }) : _id = id,
       _albumId = albumId,
       _addedAt = DateTime.now();

  //Llista de getters
  String get id => _id;
  String get albumId => _albumId;
  DateTime get addedAt => _addedAt;
}
