import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FruitsPage extends StatelessWidget {
  const FruitsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("FruitsPage build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruits"),
      ),
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              context.go("/fruits/detail");
            },
            child: const Text("detail")),
      ),
    );
  }
}
