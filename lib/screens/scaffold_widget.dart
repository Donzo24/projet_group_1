import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:projet_module_2_2/models/phone.dart';
import 'package:projet_module_2_2/models/post.dart';
import 'package:projet_module_2_2/models/utilisateur.dart';
import 'package:projet_module_2_2/screens/profil.dart';
import 'package:http/http.dart' as http;

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({super.key});

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int currentIndex = 0;

  List<Utilisateur> utilisateurs = [];
  List<Post> post = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    readFile();

  }

  Future<void> readFile() async {
    String json = await rootBundle.loadString("assets/post.json");

    // utilisateurs = getUsers(json);

    post = getPosts(jsonDecode(json));

    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50
          ),
          child: Column(
            children: [
               
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1706430263184-c1f9ac844a54?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                      )
                    )
                  ),
                ),
              ),

              ListTile(
                title: Text("Profil"),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.chevron_right),
                onTap: () {


                  // Get.to(() {
                  //   return ProfilPage();
                  // });

                  //Get.to(() => ProfilPage(prenom: "Mohamed", nom: "Marah",), transition: Transition.upToDown);

                  // Get.off(() => ProfilPage());

                  // Get.offAll(() => ProfilPage());

                },
              ),
              const ListTile(
                title: Text("Parametres"),
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.chevron_right),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        // leading: Icon(Icons.sort),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text("Foot224"),
        actions: [
          const Padding(
            padding: EdgeInsets.only(
              right: 10
            ),
            child: Icon(Icons.notifications_outlined),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 10
            ),
            child: IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {
                //Premiere navigation: Aller-retour
                // Get.to(() {
                //   return ProfilPage();
                // });

                Get.to(() => ProfilPage(prenom: "Sira", nom: "Donzo"), transition: Transition.leftToRight);

                // Get.off(() => ProfilPage());

                // Get.offAll(() => ProfilPage());
              }
            ),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amberAccent,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.red,
        items: [

          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home"
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: "Feed"
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        backgroundColor: Colors.orange,
        onPressed: () {

        }
      ),
      body: FutureBuilder(
        future: http.get(Uri.parse("https://api.restful-api.dev/objects")),
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {
              if(snapshot.data!.statusCode == 200) {
                var data = snapshot.data!.body;
                List<dynamic> items = jsonDecode(data);

                List<Phone> phones = [];

                items.forEach((item) {
                  phones.add(Phone.fromJson(item));
                });

                return ListView(
                  children: List.generate(items.length, (index) {
                    Phone phone = phones[index];
                    return Card(
                      child: ListTile(
                        title: Text(phone.name),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            editPhone(phone: phone);
                          },
                        ),
                      ),
                    );
                  }),
                );


              }
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasError) {
            return Center(
              child: ElevatedButton(
                child: Text("Ressayer"),
                onPressed: () {
                  
                },
              ),
            );
          }
          
          // print(snapshot.error);
          return SizedBox();

        },
      )
    );
  }

  Widget createFirstPage() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Titre",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "Le Lorem ",
                    children: [
                      TextSpan(
                        text: "Ipsum ",
                        style: TextStyle(
                          color: Colors.orange
                        )
                      ),
                      TextSpan(
                        text: "est simplement du faux texte employé dans la composition et la mise"
                      )
                    ]
                  )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Titre"),
                  Row(
                    children: [
                        createBox(
                          image: "https://static.vecteezy.com/system/resources/previews/021/286/390/original/aeroplane-airplane-icon-on-transparent-background-free-png.png", 
                          text: "texte"
                        ),
                        createBox(
                          image: "https://static.vecteezy.com/system/resources/previews/021/286/390/original/aeroplane-airplane-icon-on-transparent-background-free-png.png", 
                          text: "texte"
                        )
                    ],
                  ),

                  Column(
                    children: [
                      Text("HSHS"),
                      Wrap(
                        children: [
                          createBox(
                            image: "https://static.vecteezy.com/system/resources/previews/021/286/390/original/aeroplane-airplane-icon-on-transparent-background-free-png.png", 
                            text: "texte 1"
                          ),
                          createBox(
                            image: "https://static.vecteezy.com/system/resources/previews/021/286/390/original/aeroplane-airplane-icon-on-transparent-background-free-png.png", 
                            text: "texte 2"
                          ),
                          createBox(
                            image: "https://static.vecteezy.com/system/resources/previews/021/286/390/original/aeroplane-airplane-icon-on-transparent-background-free-png.png", 
                            text: "texte 3"
                          ),
                          createBox(
                            image: "https://static.vecteezy.com/system/resources/previews/021/286/390/original/aeroplane-airplane-icon-on-transparent-background-free-png.png", 
                            text: "texte 4"
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createBox({required String image, required String text}) {
    return GestureDetector(
      onTap: () {
        
      },
      onLongPress: () {
        openBottomSheet(image: image, text: text);
      },
      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        image
                                      )
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                                Text(text)
                              ],
                            ),
                          ),
                        ),
                      ),
    );
  }

  void openBottomSheet({required String image, required String text}) {

    // Get.back() Fermer un bottomsheet

    Get.bottomSheet(

      Stack(
        children: [
          Container(
            height: 400,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Text(text),
                  // Image.network(image)
                ],
              ),
            ),
          ),
          Container(
            height: 120,
            margin: EdgeInsets.all(10),
            width: 120,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                // Text(text),
                Image.network(image)
              ],
            ),
          )
        ],
      )
      
    );
  }
  
  void editPhone({required Phone phone}) {
    print(phone.name);
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: FormBuilderTextField(
                name: "name",
                initialValue: phone.name,
              ),
            )
          ],
        ),
      )
    );
  }
}