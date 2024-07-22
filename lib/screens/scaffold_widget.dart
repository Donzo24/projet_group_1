import 'package:flutter/material.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({super.key});

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
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
          padding: EdgeInsets.only(
            top: 50
          ),
          child: Column(
            children: [
               
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
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
              ),
              ListTile(
                title: Text("Profil"),
                leading: Icon(Icons.person),
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
        title: Text("Foot224"),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 10
            ),
            child: Icon(Icons.notifications_outlined),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 10
            ),
            child: Icon(Icons.person_outline),
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

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: "Feed"
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        backgroundColor: Colors.orange,
        onPressed: () {

        }
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          createFirstPage(),
          Container(
            height: 200,
            child: Text("Page 2"),
          ),
        ],
      ),
    );
  }

  Widget createFirstPage() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Titre"),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
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
                                        "https://static.vecteezy.com/system/resources/previews/021/286/390/original/aeroplane-airplane-icon-on-transparent-background-free-png.png"
                                      )
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                                Text("Texte")
                              ],
                            ),
                          ),
                        ),
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
}