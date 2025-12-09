class PlaylistCollaborator {
  final String _id;
  final String _userId;
  bool _canEdit;
  final DateTime _addedAt;

  //Constructor
  PlaylistCollaborator({
    required String id,
    required String userId,
    bool? canEdit,
  }) : _id = id,
       _userId = userId,
       _canEdit = canEdit ?? false,
       _addedAt = DateTime.now();

  //Llista de getters
  String get id => _id;
  String get userId => _userId;
  bool get canEdit => _canEdit;
  DateTime get addedAt => _addedAt;

  //Llista de setters
  set canEdit(bool canEdit) => _canEdit = canEdit;
}
