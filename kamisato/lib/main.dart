/***********************************************************
* This Flutter application runs a slam book application (based on Genshin Impact) 
* where users can add their friends by providing their name, nickname, and 
* other details. The user can then see the list of friends and view the 
* summary of the friend's details.
*
* @author bernardjezua
* @created_date 2023-07-05 16:45
* DO NOT COPY OR USE THE CODE FOR OTHER PURPOSES.
***********************************************************/

import 'package:flutter/material.dart';
import 'friends.dart';
import 'slambook.dart';
import 'package:google_fonts/google_fonts.dart' as gf;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List of friends to be shown in FriendsPage
  List<Map<String, List<String>>> friendsList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Light blue colored theme
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[50],
        textTheme: gf.GoogleFonts.lexendTextTheme(), // Imported font
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          titleTextStyle: gf.GoogleFonts.lexend(
            textStyle: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        // Changes the border themes of input fields
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
      // Home page and routing
      home: FriendsPage(friendsList),
      onGenerateRoute: (settings) {
        if (settings.name == FriendsPage.routename) {
          return MaterialPageRoute(builder: (context) => FriendsPage(friendsList));
        }
        if (settings.name == SlamBookForm.routename) {
          return MaterialPageRoute(builder: (context) => SlamBookForm(friendsList));
        }
        return null;
      }
    );
  }
}
