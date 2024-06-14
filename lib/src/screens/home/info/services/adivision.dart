import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ADivision extends StatelessWidget {
  const ADivision({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 60),
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Inapoi',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ))),
        Container(
            margin: const EdgeInsets.only(top: 50, bottom: 10),
            child: const Text(
              'Secretariat',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 40),
            )),
        Container(
            margin:
                const EdgeInsets.only(top: 50, bottom: 10, left: 40, right: 40),
            child: const Text(
              'În cadrul Secretariatului elevii efectuează toate actele legate de înscrierea, gestionarea și rezolvarea nevoilor lor în școlile Institutului. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 15),
            )),
        Container(
            margin:
                const EdgeInsets.only(top: 50, bottom: 10, left: 40, right: 40),
            child: const Text(
              ' Liceu',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            )),
        Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
            child: const Text(
              'Luni: 9:30-11:30 și 14:00-16:00\nMarți: 11:00-12:30 și 15:00-18:30\nMiercuri: închis\nJoi: 11:00-12:30 și 15:00-18:30\nVineri: 9: 30:00-11:30 și 14:00-16:00',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 15),
            )),
        Container(
            margin:
                const EdgeInsets.only(top: 50, bottom: 10, left: 40, right: 40),
            child: const Text(
              'Generala',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            )),
        Container(
            margin:
                const EdgeInsets.only(top: 10, bottom: 60, left: 40, right: 40),
            child: const Text(
              'Luni: 9:30-11:30 și 14:00-16:00\nMarți: 11:00-12:30 și 15:00-18:30\nMiercuri: închis\nJoi: 11:00-12:30 și 15:00-18:30\nVineri: 9: 30:00-11:30 și 14:00-16:00',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 15),
            )),
        GestureDetector(
            onTap: () {
              launchUrl(Uri.parse('https://ac.upt.ro/'));
            },
            child: const Text(
              'https://ac.upt.ro/',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 127, 72, 173),
                  fontFamily: 'Poppins',
                  fontSize: 15),
            )),
        Container(
            margin: const EdgeInsets.only(top: 50, bottom: 50),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage('assets/images/unilink1.png'),
                    width: 80,
                    height: 80),
                Image(
                    image: AssetImage('assets/images/Logoupt.png'),
                    width: 80,
                    height: 80)
              ],
            )),
      ],
    ));
  }
}
