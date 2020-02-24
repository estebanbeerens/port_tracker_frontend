import 'dart:convert';

class Load {
  String id;
  String startLat;
  String startLng;
  String destLat;
  String destLng;
  bool finished;
  String name;
  String description;
  String from;
  String to;
  String firm;
  Load(this.id, this.startLat, this.startLng, this.destLat, this.destLng, this.finished, this.name, this.description, this.from, this.to, this.firm);

  Load.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        startLat = json['startlat'],
        startLng = json['startlong'],
        destLat = json['destlat'],
        destLng = json['destlong'],
        finished = json['finished'],
        name = json['name'],
        description = json['description'],
        from = json['from'],
        to = json['to'],
        firm = json['firm'];
}

Load jsonToLoad(String jsonString) {
  Map loadMap = jsonDecode(jsonString);
  print(loadMap);
  return Load.fromJson(loadMap);
}