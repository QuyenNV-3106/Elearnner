import 'dart:ui';

import 'package:flutter/material.dart';

class InputVocabulary extends StatefulWidget {
  final String title;
  final String english;
  final String vietnamese;
  const InputVocabulary(BuildContext context,
      {Key? key,
      required this.title,
      required this.english,
      required this.vietnamese})
      : super(key: key);

  @override
  State<InputVocabulary> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<InputVocabulary> {
  TextEditingController engController = TextEditingController();
  TextEditingController vieController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.orange,
                  elevation: 0,
                  title: Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
              ],
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              TextField(
                controller: engController,
                onTap: () => {engController.text = widget.english},
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "English",
                      style: TextStyle(fontSize: 18),
                    )),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 30)),
              TextField(
                controller: vieController,
                onTap: () => {vieController.text = widget.vietnamese},
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Vietnamese",
                      style: TextStyle(fontSize: 18),
                    )),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.all(13)),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )
            ],
          )),
    );
  }
}
