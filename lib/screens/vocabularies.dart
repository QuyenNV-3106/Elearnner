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
                                title: 'Ch???nh s???a',
                                english: 'English',
                                vietnamese: 'Vietnamese',
                              )));
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
                tooltip: 'Ch???nh s???a',
              ),
              IconButton(
                onPressed: () {
                  Widget okButton = TextButton(
                    child: const Text("C??"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                  Widget noButton = TextButton(
                    child: const Text("Kh??ng"),
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
                        "B???n c?? mu???n x??a t??? n??y kh???i danh s??ch kh??ng"),
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
                tooltip: 'X??a',
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
                    "T??? v???ng c???a b???n",
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
                                      title: 'Th??m m???i',
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
