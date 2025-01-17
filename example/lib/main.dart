import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekday_selector/flutter_weekday_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Week Day Selector',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> daysSelected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Week Day Selector"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Select Week Days - Example shape circle"),
            ),
            WeekDaySelector(
              width: 300,
              height: 50,
              shape: BoxShape.circle,
              weekDayStart: WeekDayName.monday,
              onSubmitted: (day) {
                if (kDebugMode) {
                  print(
                      "${day.name} is ${day.isSelected ? 'selected' : 'unselected'}");
                }
                setState(() {
                  if (day.isSelected) {
                    daysSelected.add(day.name);
                  } else {
                    daysSelected.remove(day.name);
                  }
                });
              },
            ),
            Text("selected days: ${daysSelected.join(", ")}"),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 500,
                child: Divider(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Select Week Days - Example shape rectangle & start on sunday"),
            ),
            WeekDaySelector(
              width: 300,
              height: 100,
              shape: BoxShape.rectangle,
              weekDayStart: WeekDayName.sunday,
              onSubmitted: (day) {
                if (kDebugMode) {
                  print(
                      "${day.name} is ${day.isSelected ? 'selected' : 'unselected'}");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
