import 'package:fitter/widgets/screens/exercises/components/add_new_exercise_button.dart';
import 'package:fitter/widgets/screens/exercises/exercises_screen.dart';
import 'package:fitter/widgets/screens/screen.dart';
import 'package:fitter/widgets/screens/workout/workout_screen.dart';
import 'package:flutter/material.dart';

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
        icon: Icons.add,
      ),
      ViewMap(
        title: "Exercises",
        builder: () => ExercisesScreen(),
        icon: Icons.calendar_today,
        actionButton: AddNewExerciseButton(),
      ),
    ];
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(pages[selectedIndex].actionButton);
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedIndex].title),
        actions: [pages[selectedIndex].actionButton ?? Container()],
      ),
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
    return BottomNavigationBar(
      items: pages
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              title: Text(e.title),
            ),
          )
          .toList(),
      currentIndex: this.selectedIndex,
      onTap: (value) => controller.animateToPage(
        value,
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      ),
    );
  }

  Widget _buildAddExerciseButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {},
    );
  }
}
