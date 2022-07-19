/// name : ""

class Name {
  Name({
      String? name,}){
    _name = name;
}

  Name.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
Name copyWith({  String? name,
}) => Name(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}