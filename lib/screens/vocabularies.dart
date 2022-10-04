import 'package:elearnner_v1/screens/input_vocabulary.dart';
import 'package:flutter/material.dart';

class VocabulariseScreen extends StatefulWidget {
  const VocabulariseScreen({super.key});

  @override
  State<VocabulariseScreen> createState() => _VocabulariseScreenState();
}

class _VocabulariseScreenState extends State<VocabulariseScreen> {
  Card generrateCard(context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text(
                          'English',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      Text(
                        'Vietnam',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InputVocabulary(
                                context,
                                title: 'Chỉnh sửa',
                                english: 'English',
                                vietnamese: 'Vietnamese',
                              )));
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
                tooltip: 'Chỉnh sửa',
              ),
              IconButton(
                onPressed: () {
                  Widget okButton = TextButton(
                    child: const Text("Có"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                  Widget noButton = TextButton(
                    child: const Text("Không"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                  AlertDialog alert = AlertDialog(
                    icon: const Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "WARNING",
                      textAlign: TextAlign.start,
                    ),
                    content: const Text(
                        "Bạn có muốn xóa từ này khỏi danh sách không"),
                    actions: [okButton, noButton],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                tooltip: 'Xóa',
              ),
            ],
          ),
        ],
      ),
    );
  }

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
                  title: const Text(
                    "Từ vựng của bạn",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InputVocabulary(
                                      context,
                                      title: 'Thêm mới',
                                      english: '',
                                      vietnamese: '',
                                    )));
                      },
                      icon: const Icon(Icons.add),
                      iconSize: 30,
                    )
                  ],
                )
              ],
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              generrateCard(context),
              generrateCard(context),
              generrateCard(context),
              generrateCard(context),
              generrateCard(context),
              generrateCard(context),
            ],
          )),
    );
  }
}
