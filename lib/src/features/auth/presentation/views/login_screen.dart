import 'package:flutter/material.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}
