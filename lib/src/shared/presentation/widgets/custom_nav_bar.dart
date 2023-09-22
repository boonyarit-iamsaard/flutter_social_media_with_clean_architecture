import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black87,
      notchMargin: 8,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.goNamed('feed');
              },
              iconSize: 32,
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                context.goNamed('discover');
              },
              iconSize: 32,
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 32,
              icon: const Icon(Icons.add_circle),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 32,
              icon: const Icon(Icons.message),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 32,
              icon: const Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
