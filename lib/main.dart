import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/presentation/dashboard/widgets/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: Colors.red,
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme:
              const TextTheme(bodyLarge: TextStyle(color: Colors.white))),
      darkTheme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: Colors.black,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      themeMode: ThemeMode.dark,
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
