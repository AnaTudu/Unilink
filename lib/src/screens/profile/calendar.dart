import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/date_symbol_data_local.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final DateTime now = DateTime.now();
  final DateTime firstDay = DateTime.now().subtract(const Duration(days: 365));
  final DateTime lastDay = DateTime.now().add(const Duration(days: 365));

  late ValueNotifier<DateTime?> selectedDay;
  late ValueNotifier<DateTime?> focusedDay;
  late String selectedWeekday;

  @override
  void initState() {
    super.initState();
    selectedDay = ValueNotifier(now);
    focusedDay = ValueNotifier(now);
    selectedWeekday = _getWeekday(now.weekday);

    initializeDateFormatting('ro', null);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    // ignore: unused_local_variable
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final userRef = FirebaseFirestore.instance
        .collection('orar')
        .doc('2D1rZjezHPVrgaftdTVT');
    final userData = await userRef.get();
    return userData;
  }

  String _getWeekday(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Luni';
      case DateTime.tuesday:
        return 'Marti';
      case DateTime.wednesday:
        return 'Miercuri';
      case DateTime.thursday:
        return 'Joi';
      case DateTime.friday:
        return 'Vineri';
      case DateTime.saturday:
        return 'Sâmbătă';
      case DateTime.sunday:
        return 'Duminică';
      default:
        return '';
    }
  }

  List<String> convertStringToList(String data) {
    return data.split(',').map((item) => item.trim()).toList();
  }

  void handleDaySelected(DateTime? selectedDay, DateTime? focusedDay) {
    setState(() {
      selectedWeekday = _getWeekday(selectedDay!.weekday);
      this.selectedDay.value = selectedDay;
      this.focusedDay.value = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unilink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottomOpacity: 0.6,
          elevation: 0.6,
          leading: Container(
            margin: const EdgeInsets.only(
              left: 20.0,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              iconSize: 25,
              color: Color(
                  int.parse("#8c52ff".substring(1, 7), radix: 16) + 0xFF000000),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          toolbarHeight: 90,
          title: const Text(
            'Unilink',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Eroare la obtinera datelor'));
            } else {
              final userData = snapshot.data!;
              final luni = convertStringToList(userData.get('Luni'));
              final marti = convertStringToList(userData.get('Marti'));
              final miercuri = convertStringToList(userData.get('Miercuri'));
              final joi = convertStringToList(userData.get('Joi'));
              final vineri = convertStringToList(userData.get('Vineri'));

              Map<String, List<String>> scheduleData = {
                'Luni': luni,
                'Marti': marti,
                'Miercuri': miercuri,
                'Joi': joi,
                'Vineri': vineri,
              };

              List<String> selectedDaySchedule =
                  scheduleData[selectedWeekday] ?? [];

              return Column(
                children: [
                  TableCalendar(
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDay.value!, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) =>
                        handleDaySelected(selectedDay, focusedDay),
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                    ),
                    firstDay: firstDay,
                    lastDay: lastDay,
                    focusedDay: focusedDay.value!,
                    locale: 'ro',
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, day) {
                        return Center(
                          child: Text(
                            _getWeekday(day.weekday).capitalize(),
                            style: const TextStyle(
                              color: Color.fromRGBO(183, 124, 234, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 62),
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.327,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Color.fromRGBO(170, 113, 235, 1),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                selectedWeekday.capitalize(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0),
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        for (String schedule
                                            in selectedDaySchedule)
                                          Text(
                                            schedule,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
