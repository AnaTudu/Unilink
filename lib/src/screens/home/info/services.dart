import 'package:flutter/material.dart';
import 'package:unilink/src/screens/home/info/services/adivision.dart';
import 'package:unilink/src/screens/home/info/services/cabinet.dart';
import 'package:unilink/src/screens/home/info/services/teachers.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: ListView(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 30),
                    child: Center(
                        child: Column(children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Inapoi',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  color: Color(int.parse(
                                          "#8c52ff".substring(1, 7),
                                          radix: 16) +
                                      0xFF000000)))),
                      const Text(
                        'Servicii',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ]))),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const Scaffold(body: ADivision()),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }, // Image tapped
                        child: const Image(
                            image: AssetImage('assets/images/secretar.png')),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const Scaffold(body: Teachers()),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }, // Image tapped
                        child: const Image(
                            image: AssetImage('assets/images/prof.png')),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const Scaffold(body: ECabinet()),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }, // Image tapped
                        child: const Image(
                          image: AssetImage('assets/images/cabinetmed.png'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
