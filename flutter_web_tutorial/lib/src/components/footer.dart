import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(7),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.grey.shade300,
      ),
      child: Text(
        "Copyright 2021 워니 All Rights Reserved.",
        style: TextStyle(fontSize: 11),
        textAlign: TextAlign.center,
      ),
    );
  }
}
