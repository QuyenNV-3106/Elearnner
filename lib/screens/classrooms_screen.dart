import 'package:flutter/material.dart';

class ClassroomsScreen extends StatefulWidget {
  const ClassroomsScreen({super.key});

  @override
  State<ClassroomsScreen> createState() => ClassroomsScreenState();
}

class ClassroomsScreenState extends State<ClassroomsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("class"),
    );
  }
}
