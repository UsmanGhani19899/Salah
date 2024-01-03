import 'package:flutter/material.dart';

class CustomRoundedBtn extends StatelessWidget {
  final IconData icon;
  final onTap;
  const CustomRoundedBtn({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
