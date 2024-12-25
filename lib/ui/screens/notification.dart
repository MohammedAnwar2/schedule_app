import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/services/services.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Notification")
              .doc(SettingServices.instance.read(Keys.uid))
              .collection("user")
              .orderBy("currentTime", descending: true)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            try {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.amber,
                      child: ListTile(
                        title: Text(
                          "${snapshot.data.docs[index].data()["title"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          "${snapshot.data.docs[index].data()["body"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: Text(
                          "${snapshot.data.docs[index].data()["date"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  itemCount: snapshot.data.docs.length,
                );
              }
              if (snapshot.hasError) {
                return Text("error");
              }
              return Center(child: CircularProgressIndicator());
            } catch (e) {
              print("Error:  --->> ${e}");
            }
            return Container();
          },
        ));
  }
}
