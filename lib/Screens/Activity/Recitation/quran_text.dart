import 'package:flutter/material.dart';

class QuranTextEdition extends StatefulWidget {
  const QuranTextEdition({super.key});

  @override
  State<QuranTextEdition> createState() => _QuranTextEditionState();
}

class _QuranTextEditionState extends State<QuranTextEdition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Text('data')],
        ),
      ),
    );
  }
}
