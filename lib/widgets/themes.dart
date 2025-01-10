import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext content) =>ThemeData(
      // secondaryHeaderColor:  Color.fromARGB(255, 246, 246, 242),
      primarySwatch: Colors.lightBlue,
      indicatorColor: Color.fromARGB(255, 15, 8, 33),
      fontFamily: GoogleFonts.poppins().fontFamily,
      primaryColor: Color.fromARGB(255, 15, 8, 33),
      cardColor: Colors.white,
      canvasColor: darkBluishColor,
      hintColor: darkBluishColor,

      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
      backgroundColor: darkBluishColor, 
    ),
  ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        // textTheme: Theme.of(context).textTheme,
      )
      );

      static ThemeData darkTheme(BuildContext content) =>ThemeData(
        // secondaryHeaderColor: Color.fromARGB(255, 2, 7, 47),
        secondaryHeaderColor: Color.fromARGB(255, 27, 27, 28),
        hintColor: const Color.fromARGB(255, 107, 55, 248),
        indicatorColor: Color.fromARGB(255, 15, 8, 33),
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor:   Color.fromARGB(255, 2, 0, 7),
        canvasColor:  Color.fromARGB(255, 22, 19, 228),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          backgroundColor: lightBluishColor, 
          ),
        ),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        // textTheme: Theme.of(context).textTheme,
        
      )
      );

      //colors
      static Color creamColor = Color(0xfff5f5f5);
      static Color darkCreamColor = Color(0xff0b0b0b);
      static Color darkBluishColor = Color(0xff403b58);
      static Color lightBluishColor = Color.fromARGB(255, 25, 88, 225);
}