import 'package:flutter/material.dart';
import 'screens/categories_sreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meals App",
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          background: const Color(0xFFFAF8F1),
        ),
        scaffoldBackgroundColor: Color(0xFFFDFDFD),
        fontFamily: 'Poppins',
        cardTheme: const CardThemeData(
          color: Colors.white,
          elevation: 4,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          margin: EdgeInsets.all(12),
        ),
      ),


      home: const CategoriesScreen(),
    );
  }
}

