import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Import com o caminho da pasta screens

void main() {
  runApp(const ModelaIFApp());
}

class ModelaIFApp extends StatelessWidget {
  const ModelaIFApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      title: 'ModelaIF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: theme.primaryColor
        ),
      ),
      home: const HomeScreen(),
    );
  }
}