import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.myArg});
  final String myArg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myArg),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key, required this.myArg});
  final String myArg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myArg),
      ),
    );
  }
}

