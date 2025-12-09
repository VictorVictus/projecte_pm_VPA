class SongShare {
  final String _id;
  final String _userId;
  final DateTime _sharedAt;

  //Constructor
  SongShare({required String id, required String userId})
    : _id = id,
      _userId = userId,
      _sharedAt = DateTime.now();

  //Llista de getters
  String get id => _id;
  String get userId => _userId;
  DateTime get sharedAt => _sharedAt;
}
