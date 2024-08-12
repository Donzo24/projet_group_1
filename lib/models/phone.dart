class Phone {
  int id;
  String name;
  Map<dynamic, dynamic>? data;

  Phone({required this.data, required this.id, required this.name});

  factory Phone.fromJson(json) {
    return Phone(
      data: json['data'], 
      id: int.parse(json['id']), 
      name: json['name']
    );
  }
}