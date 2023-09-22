import 'package:flutter/material.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/presentation/widgets/widgets.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Feed'),
      body: Center(
        child: Text('Feed Screen'),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
