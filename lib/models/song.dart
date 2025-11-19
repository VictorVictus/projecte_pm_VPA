class Song {
  final String _id; //No modificable
  String _nom;
  List<String> _artista; //Pot tenir mes d'un artista
  List<String> _albumId; //Pot estar en mes d'un album
  double _durada; //Durada de la cançó
  final DateTime _dataPujada; //No modificable
  final String _uploaderId; //No modificable

  //Constructor
  Song({
    required String id,
    required String nom,
    required List<String> artista,
    List<String>? albumId,
    required double durada,
    required String uploaderId,
  }) : _id = id,
       _nom = nom,
       _artista = artista,
       _albumId = albumId ?? [], //Si albumId == null, es substitueix per empty.
       _durada = durada,
       _dataPujada = DateTime.now(), //Guarda data de pujada.
       _uploaderId = uploaderId;

  //Llista de getters
  String get id => _id;
  String get nom => _nom;
  List<String> get artista => _artista;
  List<String> get albumId => _albumId;
  double get durada => _durada;
  DateTime get dataPujada => _dataPujada;
  String get uploaderId => _uploaderId;

  //Llista de Setters
  set nom(String nom) => _nom = nom;
  set artista(List<String> artista) => _artista = artista;
  set albumId(List<String> albumId) => _albumId = albumId;
  set durada(double durada) => _durada = durada;
}
