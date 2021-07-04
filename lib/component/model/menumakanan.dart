class Menumakanan {
  String _id="";
  String _nama="";
  String _harga="";

  String get id => _id;
  String get nama => _nama;
  String get harga => _harga;


  Menumakanan(this._id, this._nama, this._harga);

  Menumakanan.fromJson(dynamic json) {
    _id = json["id"];
    _nama = json["nama"];
    _harga = json["harga"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["nama"] = _nama;
    map["harga"] = _harga;
    return map;
  }

}