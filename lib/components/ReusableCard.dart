import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.cardChild});
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: const Color(0xFF1D1F33),
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
