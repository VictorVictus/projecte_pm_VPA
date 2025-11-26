class Playlist {
  final String _id;
  String _name;
  String _description;
  bool _isPublic;
  List<String> _songId;
  final String _creatorId;
  DateTime _createdAt;

  //Constructor
  Playlist({
    required String id,
    required String name,
    String? description,
    bool? isPublic,
    List<String>? songId,
    required String creatorId,
    DateTime? createdAt, //Nomes admin
  }) : _id = id,
       _name = name,
       _description = description ?? '',
       _isPublic = isPublic ?? false,
       _songId = songId ?? [],
       _creatorId = creatorId,
       _createdAt = createdAt ?? DateTime.now(); //Guarda data de pujada.

  //Llista de getters
  String get id => _id;
  String get name => _name;
  String get description => _description;
  bool get isPublic => _isPublic;
  List<String> get songId => _songId;
  String get creatorId => _creatorId;
  DateTime get createdAt => _createdAt;

  //Llista de Setters

  set name(String name) => _name = name;
  set description(String description) => _description = description;
  set isPublic(bool isPublic) => _isPublic = isPublic;
  set songId(List<String> songId) => _songId = songId;
  set createdAt(DateTime createdAt) => _createdAt = createdAt; //Nomes admin
}
