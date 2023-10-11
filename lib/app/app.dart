import 'package:first_p/app/view/home_view.dart';
import 'package:flutter/material.dart';

class Myapp extends StatelessWidget {
  const Myapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Learn flutter",
      home: Homeview(),
    );
  }
}
