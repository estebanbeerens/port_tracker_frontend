class Load {
  int id;
  double startLat;
  double startLng;
  double destLat;
  double destLng;
  bool finished;
  String name;
  String description;
  String from;
  String to;
  String firm;
  Load(this.startLat, this.startLng, this.destLat, this.destLng, this.finished, this.name, this.description, this.from, this.to, this.firm);
}