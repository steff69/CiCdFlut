import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fudly/hooks/CategoryHooks.dart';

class Tesssssy extends HookWidget {
  const Tesssssy({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    return Scaffold(
      appBar: AppBar(
        title: Text('rrerere'),
      ),
      body: Center(child: Text('${hookResult.data![1].title}')),
    );
  }
}
