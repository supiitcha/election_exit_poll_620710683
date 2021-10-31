import 'package:election_exit_poll_620710683/pages/name_list_page.dart';
import 'package:election_exit_poll_620710683/pages/show_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.prompt().fontFamily,
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/home',
      routes: {
        NamelistPages.routeName : (context) => NamelistPages(),
        ShowScore.routeName : (context) => ShowScore(),
      },
    );
  }
}