import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/habits_page.dart';
import 'package:habit_tracker/pages/home_page.dart';
import 'package:habit_tracker/pages/profile_page.dart';
import 'package:habit_tracker/pages/progress_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NavigationScreen(currentIndex: 0,),
    );
  }
}
class NavigationScreen extends StatefulWidget {
  NavigationScreen({super.key, required this.currentIndex});
  int currentIndex;
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}
 const List<Widget> screens = [HomePage(), ProgressPage(), HabitsPage(), ProfilePage()];
class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: widget.currentIndex,
        onTap: (index)
        {
          setState(() {
            widget.currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today),label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.timeline),label: 'Habits'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],

      ),
    );
  }
}

