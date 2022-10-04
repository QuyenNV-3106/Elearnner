import 'dart:convert';

import 'package:elearnner_v1/components/card_components.dart';
import 'package:elearnner_v1/models/topic.dart';
import 'package:flutter/material.dart';
import 'api/api.services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen> {
  late Future<List<Topic>> futureTopic;

  @override
  void initState() {
    super.initState();
    futureTopic = APIServices.fectTopic();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              floating: true,
              backgroundColor: Colors.orange,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Chủ đề hôm nay",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              bottom: TabBar(tabs: [
                Text(
                  "1-1",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "1-2",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ]),
            ),
          ],

          body: TabBarView(children: [
            FutureBuilder<List<Topic>>(
              future: futureTopic,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardComponent().gennerateCardTopic(
                            snapshot.data![index].imgUrl,
                            snapshot.data![index].title,
                            snapshot.data![index].subTile),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            FutureBuilder<List<Topic>>(
              future: futureTopic,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int c = 0;
                  if (snapshot.data![c].kind == '1-2') {
                    c++;
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardComponent().gennerateCardTopic(
                              snapshot.data![index].imgUrl,
                              snapshot.data![index].title,
                              snapshot.data![index].subTile),
                          const SizedBox(height: 10),
                        ],
                      ),
                      // ),
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
                throw Exception('Empty');
              },
            ),
          ]),
          // body: FutureBuilder<List<Topic>>(
          //   future: futureTopic,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return ListView.builder(
          //         itemCount: snapshot.data!.length,
          //         itemBuilder: (context, index) => Container(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               CardComponent().gennerateCardTopic(
          //                   snapshot.data![index].imgUrl,
          //                   snapshot.data![index].title,
          //                   snapshot.data![index].subTile),
          //               const SizedBox(height: 10),
          //             ],
          //           ),
          //         ),
          //       );
          //     } else {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
        )));
  }
}
