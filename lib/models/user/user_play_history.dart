class UserPlayHistory {
  final String _id;
  final String _songId;
  double _playDuration;
  bool _completed;
  final DateTime _playedAt;

  //Constructor
  UserPlayHistory({
    required String id,
    required String songId,
    required double playDuration,
  }) : _id = id,
       _songId = songId,
       _playDuration = playDuration,
       _completed = false,
       _playedAt = DateTime.now();

  //Llista de getters
  String get id => _id;
  String get songId => _songId;
  double get playDuration => _playDuration;
  bool get completed => _completed;
  DateTime get playedAt => _playedAt;

  //Llista de setters
  set playDuration(double playDuration) => _playDuration = playDuration;
  set completed(bool completed) => _completed = completed;
}
