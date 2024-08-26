import 'dart:convert';

import 'package:get/get.dart';

class Utilisateur {

  int id;
  String nom;
  String prenom;
  String? email;
  String? avatar;

  Utilisateur(this.id, this.nom, this.prenom, this.email, {this.avatar});

  factory Utilisateur.fromJson(json) {

    if(json['id'] is String) {
      json['id'] = int.parse(json['id']);
    }
    return Utilisateur(
      json['id'], 
      json['last_name'],
      json['first_name'], 
      json['email'], 
      avatar: json['avatar']
    );
  }

}

List<Utilisateur> getUsers(json) {

  List<dynamic> users = jsonDecode(json);

  return users.map((user) {
    return Utilisateur.fromJson(user);
  }).toList();

}

// Utilisateur getUserbyId(String id) {

// }