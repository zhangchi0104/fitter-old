import 'package:fitter/models/table.dart';
import 'package:fitter/widgets/screens/workout/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
        create: (_) {
          final db = AppDatabase();
          db.resetDB();
          return db;
        },
        child: MyApp(),
        dispose: (ctx, db) async {
          ;
          db.close();
          print("DB closed");
        }),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamProvider(
        create: (_) => db.watchAllEntries(),
        initialData: <ExerciseRecord>[],
        child: WorkoutScreen(),
      ),
    );
  }
}
