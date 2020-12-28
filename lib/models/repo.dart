import 'package:block_test_sp/models/post.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class Reposetorey {

  Future <List<post>> fetchData() async {
    List <post> posts = [];
    final response = await http.get(
        'https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((postt) => posts.add(post.fromJson(postt))).toList();
      return
        posts;
    }
  }
}
