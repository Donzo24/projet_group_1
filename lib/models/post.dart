import 'package:flutter/services.dart';

class Post {
  int id;
  String titre;
  String contenu;

  Post({required this.contenu, required this.id, required this.titre});

  factory Post.fromJson(json) {
    return Post(
      contenu: json['contenu'], 
      id: json['id'], 
      titre: json['titre']
    );
  }
}

List<Post> getPosts(List json) {

  return json.map((item) {
    return Post(
      contenu: item['contenu'], 
      id: item['id'], 
      titre: item['titre']
    );
  }).toList();
}