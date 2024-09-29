import 'package:flutter/material.dart';

class FruitDetailPage extends StatelessWidget {
  const FruitDetailPage({super.key,});

  @override
  Widget build(BuildContext context) {
    print("FruitDetailPage build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("FruitDetail"),
      ),
      body: const Center(
        child: Text("FruitDetail"),
      ),
    );
  }
}
