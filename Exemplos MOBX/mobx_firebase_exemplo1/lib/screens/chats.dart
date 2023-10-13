import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx_firebase_exemplo1/models/char_model.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chats').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Login"),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data?.size == 0) {
              return const Center(child: Text('Sem registros'));
            }
            return CustomScrollView(
              slivers: [
                const CupertinoSliverNavigationBar(
                  largeTitle: Text("Chats"),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Chat chat =
                        Chat.fromJson(document.data() as Map<String, dynamic>);
                    return CupertinoListTile(
                      title: Text(chat.title),
                    );
                  }).toList()),
                )
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
