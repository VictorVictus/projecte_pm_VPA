class ArtistSong {
  final String _id;
  final String _songId;
  final DateTime _addedAt;

  //Constructor
  ArtistSong({required String id, required String songId})
    : _id = id,
      _songId = songId,
      _addedAt = DateTime.now();

  //Llista de getters
  String get id => _id;
  String get songId => _songId;
  DateTime get addedAt => _addedAt;
}
