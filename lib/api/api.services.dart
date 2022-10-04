import 'dart:io';
import 'package:elearnner_v1/models/topic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class APIServices {
  static String topicURL = 'https://elearnerapi.azurewebsites.net/api/Topics';

  static Future<List<Topic>> fectTopic() async {
    try {
      final response = await http.get(Uri.parse(topicURL));
      print(convert.jsonDecode(response.body));
      if (response.statusCode == 200) {
        final parsed = convert.jsonDecode(response.body);

        return (parsed as List).map((e) => Topic.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception('error $e');
    }
  }
}
