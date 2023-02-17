class Cons{
  int id;
  String header;
  String description;
  String signs;
  String species;
  Cons({
    required this.id,
    required this.header,
    required this.description,
    required this.signs,
    required this.species,
  });
  factory Cons.fromJson(Map<String, dynamic> json) {

    return Cons(
      id:json["id"],
      header: json["header"],
      description: json["description"],
      species:json["species"],
      signs: json["signs"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id":id,
        "header": header,
        "description":description,
        "species":species,
        "signs":signs,
  };
}

