// ignore_for_file: prefer_const_constructors
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import "dart:async";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TimeDateApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimeDateApp extends StatefulWidget {
  const TimeDateApp({super.key});

  @override
  State<TimeDateApp> createState() => _TimeDateAppState();
}

class _TimeDateAppState extends State<TimeDateApp> {
  String weekDay = "";
  String date = "";
  String timeNow = "";
  String monthNum = "";
  changeEverySecond() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        weekDay = DateFormat.EEEE().format(DateTime.now());
        monthNum = DateFormat.MMMM().format(DateTime.now());
        date = DateFormat.yMd().format(DateTime.now());
        timeNow = DateFormat("hh : mm : ss a").format(DateTime.now());
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySecond();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Time & Date App",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 57, 73, 80),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              monthNum,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Today's Date Is : $weekDay",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              date,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              timeNow,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
