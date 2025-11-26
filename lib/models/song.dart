class Song {
  final String _id; //No modificable
  String _name;
  List<String> _artist; //Pot tenir mes d'un artista
  List<String> _albumId; //Pot estar en mes d'un album
  double _duration; //Durada de la cançó
  final String _creatorId; //No modificable
  DateTime _createdAt; //No modificable

  //Constructor
  Song({
    required String id,
    required String name,
    required List<String> artist,
    List<String>? albumId,
    required double duration,
    required String creatorId,
    DateTime? createdAt, //Només admin.
  }) : _id = id,
       _name = name,
       _artist = artist,
       _albumId = albumId ?? [], //Si albumId == null, es substitueix per empty.
       _duration = duration,
       _creatorId = creatorId,
       _createdAt = createdAt ?? DateTime.now(); //Guarda data de pujada.

  //Llista de getters
  String get id => _id;
  String get name => _name;
  List<String> get artist => _artist;
  List<String> get albumId => _albumId;
  double get duration => _duration;
  String get creatorId => _creatorId;
  DateTime get createdAt => _createdAt;

  //Llista de Setters
  set name(String name) => _name = name;
  set artist(List<String> artist) => _artist = artist;
  set albumId(List<String> albumId) => _albumId = albumId;
  set duration(double duration) => _duration = duration;
  set createdAt(DateTime createdAt) => _createdAt = createdAt; //admin
}
