import 'package:cloud_firestore/cloud_firestore.dart';

class SaveId {
  final String _id;
  final DateTime _savedAt;

  //Constructor
  SaveId({required String id, DateTime? savedAt})
    : _id = id,
      _savedAt = savedAt ?? DateTime.now();

  //Llista de getters
  String get id => _id;
  DateTime get savedAt => _savedAt;

  factory SaveId.fromMap(Map<String, dynamic> data) {
    return SaveId(
      id: data['id'] as String,
      savedAt: (data['savedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': _id, 'savedAt': Timestamp.fromDate(_savedAt)};
  }
}
