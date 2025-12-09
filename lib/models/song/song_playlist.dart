class SongPlaylist {
  final String _id;
  final String _playlistId;
  final DateTime _addedAt;

  //Constructor
  SongPlaylist({required String id, required String playlistId})
    : _id = id,
      _playlistId = playlistId,
      _addedAt = DateTime.now();

  //Llista de getters
  String get id => _id;
  String get playlistId => _playlistId;
  DateTime get addedAt => _addedAt;
}
