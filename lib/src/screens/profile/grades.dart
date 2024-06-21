import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late double containerWidth;
  Map<String, bool> expandedYears = {};
  double mediaNotas = 0.0;

  @override
  void initState() {
    super.initState();
    fetchNotasData();
  }

  void fetchNotasData() async {
    QuerySnapshot snapshot = await firestore.collection('materii').get();

    // Organize data by year and semester
    Map<String, Map<String, List<Map<String, dynamic>>>> notasMap = {};

    for (DocumentSnapshot document in snapshot.docs) {
      String an = document['An'];
      String semestru = document['Semestru'];
      String nume = document['Nume'];
      int nota = document['Nota'];

      if (!notasMap.containsKey(an)) {
        notasMap[an] = {};
      }

      if (!notasMap[an]!.containsKey(semestru)) {
        notasMap[an]![semestru] = [];
      }

      notasMap[an]![semestru]!.add({
        'nume': nume,
        'nota': nota,
      });
    }

    // Calculate the average of the grades
    double totalNote = 0.0;
    int disciplineCount = 0;

    for (var entry in notasMap.entries) {
      for (var semester in entry.value.values) {
        for (var disciplina in semester) {
          totalNote += disciplina['nota'];
          disciplineCount++;
        }
      }
    }

    setState(() {
      mediaNotas = disciplineCount > 0 ? (totalNote / disciplineCount) : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    containerWidth = 0.9 * MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Unilink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottomOpacity: 0.6,
          elevation: 0.6,
          leading: Container(
            margin: const EdgeInsets.only(left: 20.0),
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
        body: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const Text(
                    "Notele mele",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Media Finală: ${mediaNotas.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 30),
                    width: containerWidth,
                    constraints: BoxConstraints(
                      minWidth: containerWidth,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(255, 193, 146, 227),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 9; i <= 12; i++)
                          FutureBuilder<QuerySnapshot>(
                            future: firestore.collection('materii').get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              if (snapshot.hasData) {
                                // Organize data by year and semester
                                Map<String,
                                        Map<String, List<Map<String, dynamic>>>>
                                    notasMap = {};

                                for (DocumentSnapshot document
                                    in snapshot.data!.docs) {
                                  String an = document['An'];
                                  String semestru = document['Semestru'];
                                  String nume = document['Nume'];
                                  int nota = document['Nota'];

                                  if (!notasMap.containsKey(an)) {
                                    notasMap[an] = {};
                                  }

                                  if (!notasMap[an]!.containsKey(semestru)) {
                                    notasMap[an]![semestru] = [];
                                  }

                                  notasMap[an]![semestru]!.add({
                                    'nume': nume,
                                    'nota': nota,
                                  });
                                }

                                // Calculate the average of the grades
                                double totalNote = 0.0;
                                int disciplineCount = 0;

                                for (var entry in notasMap.entries) {
                                  for (var semester in entry.value.values) {
                                    for (var disciplina in semester) {
                                      totalNote += disciplina['nota'];
                                      disciplineCount++;
                                    }
                                  }
                                }

                                // ignore: unused_local_variable
                                double mediaNote = disciplineCount > 0
                                    ? (totalNote / disciplineCount)
                                    : 0.0;

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          expandedYears['$i'] =
                                              !expandedYears.containsKey('$i')
                                                  ? true
                                                  : !expandedYears['$i']!;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text(
                                          'Clasa $i ',
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (expandedYears.containsKey('$i') &&
                                        expandedYears['$i']!)
                                      for (var entry in notasMap['$i']!.entries)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                // Handle Semester clicked
                                                // You can fetch the corresponding data from the database or perform any action here
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 8.0,
                                                  horizontal: 16.0,
                                                ),
                                                child: Text(
                                                  'Semestru ${entry.key} ',
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            for (var disciplina in entry.value)
                                              InkWell(
                                                onTap: () {
                                                  // Handle Discipline clicked
                                                  // You can fetch the corresponding data from the database or perform any action here
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 16.0,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        disciplina['nume'],
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        'Nota: ${disciplina['nota']}',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                  ],
                                );
                              }

                              return const SizedBox.shrink();
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const NotePage());
}
