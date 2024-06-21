/*import 'package:flutter/material.dart';
import '../../../data/dataset.dart';
import 'package:unilink/src/models/info_pdf_screen.dart';

class Calendars extends StatelessWidget {
  const Calendars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: ListView(children: [
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
                      'Calendare',
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ]))),
              const Divider(
                color: Colors.grey,
                height: 1,
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                  children: calendars
                      .map((doc) => ListTile(
                          contentPadding: const EdgeInsets.only(
                              right: 50, bottom: 20, top: 20, left: 35),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        ReaderScreen(doc),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          title: Text(
                            doc.title!,
                            style: const TextStyle(
                                fontFamily: 'Poppins', fontSize: 20),
                          ),
                          trailing: Text(
                            '${doc.detail}',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontSize: 20),
                          ),
                          leading: const Icon(Icons.picture_as_pdf_outlined,
                              color: Colors.red, size: 50)))
                      .toList()),
              const SizedBox(
                height: 25,
              ),
            ])));
  }
}*/

import 'package:flutter/material.dart';
import '../../../data/dataset.dart';
import 'package:unilink/src/models/info_pdf_screen.dart';
//import 'package:unilink/src/models/pdf_document_model.dart';

class Calendars extends StatelessWidget {
  const Calendars({super.key});

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
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Inapoi',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Color(
                              int.parse("#8c52ff".substring(1, 7), radix: 16) +
                                  0xFF000000),
                        ),
                      ),
                    ),
                    const Text(
                      'Calendar',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Anul școlar 2023—2024 este structurat astfel:',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Zilele libere și intervalele de vacanță:',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '- de luni, 11 septembrie 2023, până vineri, 27 octombrie 2023;\n'
                    '— de sâmbătă, 28 octombrie 2023, până duminică, 5 noiembrie 2023;'
                    ' -de luni, 6 noiembrie 2023, până vineri, 22 decembrie 2023;\n'
                    ' — de sâmbătă, 23 decembrie 2023, până duminică, 7 ianuarie 2024; vacanța de Crăciun\n'
                    '- 24 ianuarie: Ziua Unirii Principatelor Române\n'
                    '— o săptămână, în perioada 12 februarie - 3 martie 2024;'
                    '- 1 mai: Ziua Muncii\n'
                    '-de sâmbătă, 27 aprilie 2024, până marți, 7 mai 2024, vacanta de Paste;'
                    '- 1 iunie: Ziua Copilului\n'
                    '- 23 iunie (duminică) - Rusalii, 24 iunie (luni) — A doua zi de Rusalii\n'
                    '— de sâmbătă, 22 iunie 2024, până duminică, 8 septembrie 2024.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Column(
              children: calendars
                  .map((doc) => ListTile(
                        contentPadding: const EdgeInsets.only(
                            right: 50, bottom: 20, top: 20, left: 35),
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ReaderScreen(doc),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        title: Text(
                          doc.title!,
                          style: const TextStyle(
                              fontFamily: 'Poppins', fontSize: 20),
                        ),
                        trailing: Text(
                          '${doc.detail}',
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                              fontSize: 20),
                        ),
                        leading: const Icon(Icons.picture_as_pdf_outlined,
                            color: Colors.red, size: 50),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
