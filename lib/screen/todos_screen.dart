import 'package:flutter/material.dart';

class todoScreen extends StatefulWidget {
  const todoScreen({Key? key}) : super(key: key);

  @override
  State<todoScreen> createState() {
    return _todoScreenState();
  }
}

class _todoScreenState extends State<todoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
