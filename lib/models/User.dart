class User {
  final String _id; //No modificable
  final bool _role; //true = admin, false = user. Editar en base de dades
  String _name;
  String _email;
  String _password;
  List<String> _playlistId; //Pot tenir mes d'una playlist
  List<String> _albumId; //Pot estar en mes d'un album
  DateTime _createdAt; //No modificable

  //Constructor
  User({
    required String id,
    required String name,
    required String email,
    required String password,
    DateTime? createdAt, //Només admin.
  }) : _id = id,
       _role = false,
       _name = name,
       _email = email,
       _password = password,
       _playlistId = [],
       _albumId = [],
       _createdAt = createdAt ?? DateTime.now(); //Guarda data de pujada.

  //Llista de getters
  String get id => _id;
  bool get role => _role;
  String get name => _name;
  String get email => _email;
  String get password => _password;
  List<String> get playlistId => _playlistId;
  List<String> get albumId => _albumId;
  DateTime get createdAt => _createdAt;

  //Llista de Setters
  set name(String name) => _name = name;
  set email(String email) => _email = email;
  set password(String password) => _password = password;
  set playlistId(List<String> playlistId) => _playlistId = playlistId;
  set albumId(List<String> albumId) => _albumId = albumId;
  set createdAt(DateTime createdAt) => _createdAt = createdAt; //admin
}
