import 'package:fitter/widgets/fitter_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/table.dart';

void main() {
  runApp(
    Provider(
        create: (_) {
          final db = AppDatabase();
          // db.exerciseRecordsDao.resetDB();
          return db;
        },
        child: MyApp(),
        dispose: (ctx, db) async {
          await db.close();
          print("DB closed");
        }),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: Theme.of(context).scaffoldBackgroundColor,
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black, fontSize: 20),
          ),
          iconTheme: IconTheme.of(context).copyWith(
            color: Colors.black,
          ),
        ),
      ),
      home: FitterApp(),
    );
  }
}
