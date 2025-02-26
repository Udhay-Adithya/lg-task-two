import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Liquid Galaxy",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
