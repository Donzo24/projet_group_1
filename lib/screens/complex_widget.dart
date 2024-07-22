import 'package:flutter/material.dart';

class ComplexWidget extends StatefulWidget {
  const ComplexWidget({super.key});

  @override
  State<ComplexWidget> createState() => _ComplexWidgetState();
}

class _ComplexWidgetState extends State<ComplexWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
      body: SafeArea(
        child: Column(
          children: [

            Text("Wrap"),
            Wrap(
              children: [
                createBox(color: Colors.black),
                createBox(color: Colors.orange),
                createBox(color: Colors.blueGrey),
                createBox(color: Colors.blueGrey),
                createBox(color: Colors.blueGrey),
                createBox(color: Colors.blueGrey),
              ],
            ),

            Text("Row"),
            Row(
              children: [
                createBox(color: Colors.black),
                createBox(color: Colors.orange),
                createBox(color: Colors.blueGrey),
              ],
            ),

            Text("ListView"),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  createBox(color: Colors.black),
                  createBox(color: Colors.orange),
                  createBox(color: Colors.blueGrey),
                  createBox(color: Colors.blueGrey),
                  createBox(color: Colors.blueGrey),
                  createBox(color: Colors.blueGrey),
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  Widget createBox({required Color color}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 100,
        width: 100,
        color: color,
      ),
    );
  }
}