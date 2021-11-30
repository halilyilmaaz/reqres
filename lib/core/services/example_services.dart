import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:reqres/core/model/model.dart';

class ApiService{

  //final String url = "https://jsonplaceholder.typicode.com/posts";
  final url = dotenv.env['URL'];
  
  Future<List<User>> getPosts() async {
    Response res = await get(Uri.parse(url!));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> user = body.map((dynamic item) => User.fromJson(item)).toList();
      
      return user;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  


}