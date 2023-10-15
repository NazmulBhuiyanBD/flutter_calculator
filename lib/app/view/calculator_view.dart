import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculatorview extends StatefulWidget {
  const Calculatorview({super.key});

  @override
  State<Calculatorview> createState() => _CalculatorviewState();
}

class AppLifecycleListener {}

class _CalculatorviewState extends State<Calculatorview> {
  int x = 0;
  int y = 0;
  num z = 0;
  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener();
  }

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    //_listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          //calculator display
          Calculatordisplay(
              hint: "Enter first numer", controller: displayOneController),
          const SizedBox(
            height: 30,
          ),
          Calculatordisplay(
              hint: "Enter second numer", controller: displayTwoController),
          const SizedBox(
            height: 30,
          ),
          Text(
            key: const Key("Result"),
            z.toString(),
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      z = num.tryParse(displayOneController.text)! +
                          num.tryParse(displayTwoController.text)!;
                    },
                  );
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      z = num.tryParse(displayOneController.text)! -
                          num.tryParse(displayTwoController.text)!;
                    },
                  );
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      z = num.tryParse(displayOneController.text)! *
                          num.tryParse(displayTwoController.text)!;
                    },
                  );
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      z = num.tryParse(displayOneController.text)! /
                          num.tryParse(displayTwoController.text)!;
                    },
                  );
                },
                child: const Icon(CupertinoIcons.divide),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              x = 0;
              y = 0;
              z = 0;
              displayOneController.clear();
              displayTwoController.clear();
            },
            label: const Text("Clear"),
          ),
        ],
      ),
    );
  }
}

class Calculatordisplay extends StatelessWidget {
  const Calculatordisplay({
    super.key,
    this.hint = "Enter a number",
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black)),
    );
  }
}
