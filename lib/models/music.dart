/// _id : "604afd5d8c99721cd85bf0cc"
/// song : "Hasi"
/// musicdirector : "Mohit Suri"
/// singers : "Ami Mishra"
/// yearofrelease : 2015

class Music {
  String id;
  String song;
  String musicdirector;
  String singers;
  String yearofrelease;


  Music({this.id,this.song, this.musicdirector, this.singers, this.yearofrelease});

  Music.fromJson(dynamic json) {
    id = json["_id"];
    song = json["song"];
    musicdirector = json["musicdirector"];
    singers = json["singers"];
    yearofrelease = json["yearofrelease"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["song"] = song;
    map["musicdirector"] = musicdirector;
    map["singers"] = singers;
    map["yearofrelease"] = yearofrelease;
    return map;
  }

}