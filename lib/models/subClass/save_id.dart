import 'package:cloud_firestore/cloud_firestore.dart';

class SaveId {
  final String _id;
  final Timestamp _savedAt;

  //Constructor
  SaveId({required String id, Timestamp? savedAt})
    : _id = id,
      _savedAt = savedAt ?? Timestamp.now();

  //Llista de getters
  String get id => _id;
  Timestamp get savedAt => _savedAt;

  factory SaveId.fromMap(Map<String, dynamic> data) {
    return SaveId(
      id: data['id'] as String,
      savedAt: data['savedAt'] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': _id, 'savedAt': _savedAt};
  }
}
