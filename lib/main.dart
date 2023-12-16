import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'contact_us_page.dart';
import 'doctors_list_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( HospitalApp());
}

class HospitalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Management App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/rendezvous': (context) => Placeholder(), // Create separate pages for each route
        '/listemedecins': (context) => DoctorListPage(),
        '/listerdv': (context) => Placeholder(),
        '/documents': (context) => Placeholder(),
        '/urgence': (context) => Placeholder(),
        '/contact': (context) => ContactUsPage(),
      },
    );
  }
}