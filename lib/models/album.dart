class Album {
  final String _id;
  String _name;
  List<String> _artist;
  List<String> _songId;
  final String _creatorId;
  DateTime _createdAt;

  //Constructor
  Album({
    required String id,
    required String name,
    required List<String> artist,
    List<String>? songId,
    required String creatorId,
    DateTime? createdAt, //Només admin pot escriure aqui
  }) : _id = id,
       _creatorId = creatorId,
       _name = name,
       _artist = artist,
       _songId = [],
       _createdAt = createdAt ?? DateTime.now(); //Guarda data de pujada.

  //Llista de getters
  String get id => _id;
  String get creatorId => _creatorId;
  String get name => _name;
  List<String> get artist => _artist;
  List<String> get songId => _songId;
  DateTime get createdAt => _createdAt;

  //Llista de Setters
  set name(String name) => _name = name;
  set artist(List<String> artist) => _artist = artist;
  set songId(List<String> songId) => _songId = songId;
  set createdAt(DateTime createdAt) => _createdAt = createdAt; //Només admin
}
