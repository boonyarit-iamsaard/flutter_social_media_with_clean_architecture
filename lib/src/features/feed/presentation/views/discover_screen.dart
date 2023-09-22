import 'package:flutter/material.dart';
import 'package:flutter_social_media_with_clean_architecture/src/shared/presentation/widgets/widgets.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Discover'),
      body: Center(
        child: Text('Discover Screen'),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
