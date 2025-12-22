import 'package:cloud_firestore/cloud_firestore.dart';

class UserPlayHistory {
  final String _songId;
  double _playDuration;
  bool _completed;
  final DateTime _playedAt;

  //Constructor
  UserPlayHistory({
    required String songId,
    double? playDuration,
    bool? completed,
    DateTime? playedAt,
  }) : _songId = songId,
       _playDuration = playDuration ?? 0,
       _completed = completed ?? false,
       _playedAt = playedAt ?? DateTime.now();

  //Llista de getters
  String get songId => _songId;
  double get playDuration => _playDuration;
  bool get completed => _completed;
  DateTime get playedAt => _playedAt;

  //Canço completada
  void songCompleted() => _completed = true;

  factory UserPlayHistory.fromMap(Map<String, dynamic> data) {
    return UserPlayHistory(
      songId: data['songId'] as String,
      playDuration: data['playDuration'] as double,
      completed: data['completed'] as bool,
      playedAt: (data['playedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'songId': _songId,
      'playDuration': _playDuration,
      'completed': _completed,
      'playedAt': Timestamp.fromDate(_playedAt),
    };
  }
}
