import 'package:first_p/app/view/calculator_view.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(child: Calculatorview()),
    );
  }
}
