import 'package:flutter/material.dart';
import 'package:flutter_social_media_with_clean_architecture/src/config/app_theme.dart';

void main() {
  runApp(const SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media App',
      theme: SocialMediaAppTheme().theme(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media App'),
      ),
      body: const Center(
        child: Text('Social Media App'),
      ),
    );
  }
}
