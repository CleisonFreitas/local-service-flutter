import 'package:flutter/material.dart';

class CardWorker extends StatelessWidget {
  final String image;
  const CardWorker({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover, // this fills the circle
        ),
      ),
    );
  }
}
