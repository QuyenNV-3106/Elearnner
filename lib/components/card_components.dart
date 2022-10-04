import 'package:elearnner_v1/screens/input_vocabulary.dart';
import 'package:flutter/material.dart';

class CardComponent {
  Card gennerateCardTopic(img, title, subtitle) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
        left: Radius.circular(20),
        right: Radius.circular(20),
      )),
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.network('$img'),
          ),
          ListTile(
            title: Text(
              '$title',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '$subtitle',
              style: const TextStyle(fontSize: 17),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 2.0, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: const Text(
                  "Vào ngay",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  Card generrateCardVoca(context) {
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
}
