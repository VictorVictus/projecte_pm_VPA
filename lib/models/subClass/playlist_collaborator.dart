import 'package:cloud_firestore/cloud_firestore.dart';

class PlaylistCollaborator {
  final String _userId;
  bool _canEdit;
  final DateTime _addedAt;

  //Constructor
  PlaylistCollaborator({
    required String userId,
    bool? canEdit,
    DateTime? addedAt,
  }) : _userId = userId,
       _canEdit = canEdit ?? false,
       _addedAt = addedAt ?? DateTime.now();

  //Llista de getters
  String get userId => _userId;
  bool get canEdit => _canEdit;
  DateTime get addedAt => _addedAt;

  //Llista de setters
  set canEdit(bool canEdit) => _canEdit = canEdit;

  //Metode per cambiar el rol del colaborador
  void changeCanEdit() => _canEdit = !_canEdit;

  factory PlaylistCollaborator.fromMap(Map<String, dynamic> data) {
    return PlaylistCollaborator(
      userId: data['userId'] as String,
      canEdit: data['canEdit'] as bool,
      addedAt: (data['addedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': _userId,
      'canEdit': _canEdit,
      'addedAt': Timestamp.fromDate(_addedAt),
    };
  }
}
