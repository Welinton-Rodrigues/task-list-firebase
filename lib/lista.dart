// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tasks"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, "/login"),
            icon: Icon(Icons.logout)
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
          .collection("tasks")
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        
          // .orderBy('title')
          .snapshots(),
        builder: (context, snapshot) {

          if(!snapshot.hasData)
            return Text("Carregando...");

          return ListView(
            children: snapshot.data!.docs
              .map((doc) => 
                Dismissible(
                  background: Container(color: Colors.red),
                  key: Key(doc.id),
                  onDismissed: (_) => doc.reference.delete(),
                  child: CheckboxListTile(
                    value: doc['completed'],
                    onChanged: (value) => doc.reference.update({"completed": value, "updateDate": DateTime.now()}),
                    title: Text(doc['title']),
                    subtitle: Text(doc['subtitle']),
                  ),
                )
              ).toList(),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, "/create"),
      ),
    );
  }
}