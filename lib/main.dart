import 'package:flutter/material.dart';
import 'package:flutter_social_media_with_clean_architecture/src/config/app_router.dart';
import 'package:flutter_social_media_with_clean_architecture/src/config/app_theme.dart';

void main() {
  runApp(const SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Social Media App with Clean Architecture',
      theme: SocialMediaAppTheme().theme(),
      routerConfig: AppRouter().router,
    );
  }
}
