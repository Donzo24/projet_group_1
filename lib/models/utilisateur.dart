import 'dart:convert';

import 'package:get/get.dart';

class Utilisateur {

  int id;
  String nom;
  String prenom;
  String email;
  int age;

  Utilisateur(this.id, this.age, this.prenom, this.email, this.nom);

  factory Utilisateur.fromJson(json) {
    return Utilisateur(
      json['id'], 
      json['age'], 
      json['prenom'], 
      json['email'], 
      json['nom']
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