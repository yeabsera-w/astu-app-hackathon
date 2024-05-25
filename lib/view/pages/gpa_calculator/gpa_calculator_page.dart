import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';

class GPACalculator extends StatefulWidget {
  const GPACalculator({super.key});

  @override
  State<GPACalculator> createState() => _GPACalculatorState();
}

class _GPACalculatorState extends State<GPACalculator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset("floating_animation.json"),
        GlassmorphicContainer(
            width: MediaQuery.sizeOf(context).height * 0.7,
            height: MediaQuery.sizeOf(context).width * 0.8,
            borderRadius: 20,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF2B8DA3),
                  const Color(0xFF2B8DA3).withOpacity(0.43),
                ]),
            border: 2,
            blur: 20,
            borderGradient: LinearGradient(colors: [
              const Color(0xFF2B8DA3).withOpacity(0.8),
              const Color(0xFF2B8DA3).withOpacity(0.33),
            ]))
      ],
    );
  }
}
