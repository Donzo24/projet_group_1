
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
    const ButtonWidget({super.key});

    @override
    State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
    late AnimationController _controller;

    var nombre = 12.0;//La taille de l'ecriture

    List<dynamic> items = [];
    

    @override
    void initState() {
      super.initState();
      _controller = AnimationController(vsync: this);

      items = [1, 2, 5, 6, 0.5, "gshhsk"];
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Column(
              children: items.map((item) {
                return Text(item.toString());
              }).toList(),
            ),

            Column(
              children: List.generate(items.length, (index) {
                return Text(items[index].toString());
              })
            ),
            
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Bonjour",
                style: TextStyle(
                  fontSize: nombre
                ),
              ),
            ),
            TextButton(
              child: Text("Incrementer"),
              onPressed: () {

                nombre = nombre+1;

                setState(() {});

              } ,
            ),
            OutlinedButton(
              child: Text("Decrementer"),
              onPressed: () {
                nombre = nombre-1;
                setState(() {});
                
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                
              ),
              child: Icon(Icons.read_more),
              onPressed: () {
                print("Lire plus");
              },
            ),
            createButton(
              child: Text("Buton personalise"), 
              onPress: () {
                print("OK");
              }
            )
          ],
        ),
      );
    }

    void register() {
      print("Enregistrer");
    }

    Widget createButton({required Widget child, required Function() onPress}) {

      return GestureDetector(
        onTap: onPress,
        child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red
        ),
        child: Center(
          child: child,
        ),
      ),
      );
    }
    
}