import 'package:flutter/material.dart';

class FreindsPage extends StatefulWidget {
  const FreindsPage({super.key});

  @override
  State<FreindsPage> createState() => _FreindsPageState();
}

class _FreindsPageState extends State<FreindsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Freinds Page'),
        ),
      ),
    );
  }
}