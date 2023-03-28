import 'package:flutter/material.dart';

class ExaminerScreen extends StatefulWidget {
  static const String routeName = "/examinerScreen";
  const ExaminerScreen({super.key});

  @override
  State<ExaminerScreen> createState() => _ExaminerScreenState();
}

class _ExaminerScreenState extends State<ExaminerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 66),
        child: Column(
          children: [Text("data")],
        ),
      ),
    );
  }
}
