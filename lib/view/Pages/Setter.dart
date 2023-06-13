import 'package:flutter/material.dart';
import 'package:mytasks/Helper/Consts.dart';

class Setter extends StatelessWidget {
  const Setter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.backgroundColor,
      appBar: AppBar(
        backgroundColor: Consts.backgroundColor,
        title: Text(
          "Task",
          style: Consts.purpulTitle,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(),
      ),
    );
  }
}
