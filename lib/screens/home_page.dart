import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://i.f1g.fr/media/eidos/1300x701_crop/2023/06/05/XVM94b16250-0148-11ee-b331-ce262bc4a6ce.jpg",
                        )
                      )
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.8),
                    )
                  ),

                  Text(
                    "Journal"
                  )

                ],
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.all(10),
            //   child: Container(
            //     height: 200,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       image: DecorationImage(
            //         fit: BoxFit.cover,
            //         image: NetworkImage(
            //           "https://www.slcpitance.com/wp-content/uploads/2021/04/20601-ext1-cam05-v2-scaled.jpg"
            //         )
            //       )
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(
                "https://i.f1g.fr/media/eidos/1300x701_crop/2023/06/05/XVM94b16250-0148-11ee-b331-ce262bc4a6ce.jpg",
                height: 300,
              ),
            ),
            Image.asset(
              "assets/images/dice-1.png",
              height: 100,
            )
          ],
        ),
      )
    );
  }
}