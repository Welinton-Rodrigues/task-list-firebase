import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todolist/create.dart';
import 'package:todolist/lista.dart';
import 'package:todolist/login.dart';
import 'package:todolist/registro.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyA5AVMyw_O0sC2fEsyvgZqSCmUxtEDgBuU",
  authDomain: "prova-f559e.firebaseapp.com",
  projectId: "prova-f559e",
  storageBucket: "prova-f559e.firebasestorage.app",
  messagingSenderId: "640591489218",
  appId: "1:640591489218:web:1ae3e81be6673081daf35b",
  measurementId: "G-E9RJ9JJT1J"
);


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(TodoListApp());
}

class TodoListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      routes: {
        "/lista":(context) => ListaPage(),
        "/create":(context) => CreatePage(),
        "/login":(context) => LoginPage(),
        "/registro":(context) => RegistroPage(),
      },
      initialRoute: "/login",
    );
  }
}