import 'dart:convert';

class User {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  User({ this.userId,  this.id,  this.title,  this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId : json['userId'] as int,
      id : json['id'] as int,
      title : json['title'] as String,
      body : json['body'] as String,
    );
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}