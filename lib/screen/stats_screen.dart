import 'package:flutter/material.dart';

class stateScreen extends StatefulWidget {
  const stateScreen({Key? key}) : super(key: key);

  @override
  State<stateScreen> createState() {
    return _stateScreenState();
  }
}

class _stateScreenState extends State<stateScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
