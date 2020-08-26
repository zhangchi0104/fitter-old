import 'package:fitter/providers/workout_state.dart';
import 'package:fitter/widgets/common/tile.dart';
import 'package:fitter/widgets/screens/datepicker_button/datepicker_button.dart';
import 'package:fitter/widgets/screens/exercises/components/add_new_exercise_button.dart';
import 'package:fitter/widgets/screens/exercises/exercises_screen.dart';
import 'package:fitter/widgets/screens/screen.dart';
import 'package:fitter/widgets/screens/workout/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class FitterApp extends StatefulWidget {
  FitterApp({Key key}) : super(key: key);

  @override
  _FitterAppState createState() => _FitterAppState();
}

class _FitterAppState extends State<FitterApp> {
  PageController controller;
  var pages = <ViewMap>[];
  @override
  void initState() {
    //super.initState();
    controller = PageController();
    pages = <ViewMap>[
      ViewMap(
        title: "Workouts",
        builder: () => WorkoutScreen(),
        icon: Icons.calendar_today,
        actionButton: DatePickerButton(),
        color: Colors.orange,
      ),
      ViewMap(
        title: "Exercises",
        builder: () => ExercisesScreen(),
        icon: Icons.dehaze,
        actionButton: AddNewExerciseButton(),
        color: Colors.blue,
      ),
    ];
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: _buildFitterApp(context),
    );
  }

  Widget _buildFitterApp(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(pages[selectedIndex].title),
      //   actions: [pages[selectedIndex].actionButton ?? Container()],
      //   backgroundColor: Colors.white,
      // ),
      body: PageView.builder(
        itemBuilder: (_, i) => pages[i].builder(),
        itemCount: pages.length,
        controller: controller,
        onPageChanged: (i) => setState(
          () {
            this.selectedIndex = i;
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      // floatingActionButton: pages[selectedIndex].actionButton,
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Tile(
      // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: null,
      borderRadius: 0,
      child: GNav(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
        tabs: pages
            .map(
              (e) => GButton(
                icon: e.icon,
                text: e.title,
                iconActiveColor: e.color,
                textColor: e.color,
                backgroundColor: e.color[100],
              ),
            )
            .toList(),
        gap: 10,
        iconSize: 24,
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 900),
        selectedIndex: this.selectedIndex,
        onTabChange: (value) => controller.animateToPage(
          value,
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        ),
      ),
    );
  }
}
