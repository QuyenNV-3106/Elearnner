import 'package:elearnner_v1/home_screen.dart';
import 'package:elearnner_v1/screens/classrooms_screen.dart';
import 'package:elearnner_v1/screens/settings_screen.dart';
import 'package:elearnner_v1/screens/vocabularies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.orange.shade400);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List page = const [
    HomeScreen(),
    VocabulariseScreen(),
    ClassroomsScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_selectedIndex],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            tooltip: "Chủ đề hôm nay", icon: Icon(Icons.mic), label: 'Chủ đề'),
        BottomNavigationBarItem(
            tooltip: "Từ vựng bạn đã lưu",
            icon: Icon(Icons.bookmark),
            label: 'Từ mới'),
        BottomNavigationBarItem(
            tooltip: "Vào phòng học",
            icon: Icon(
              Icons.play_arrow_sharp,
              size: 28,
            ),
            label: 'Phòng học'),
        BottomNavigationBarItem(
            tooltip: "Cài đặt", icon: Icon(Icons.settings), label: 'Cài đặt')
      ],
      currentIndex: _selectedIndex,
      unselectedFontSize: 15,
      selectedFontSize: 15,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.amber[800],
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        _onItemTapped(index);
      },
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
    );
  }
}
