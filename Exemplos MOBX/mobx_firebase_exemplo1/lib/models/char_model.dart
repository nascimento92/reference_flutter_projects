import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String title;

  Chat({required this.title});

  static fromJson(Map<String, dynamic> json) => Chat(title: json['title']);

  factory Chat.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Chat(title: snapshot['title']);
  }

  Map<String, dynamic> toJson() => {'title': title};
}
