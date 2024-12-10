import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (controller) {
          return Stack(
            children: [
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: controller.animationController!,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: CirclePainter(
                        progress: controller.animationController!.value,
                        listRadius: controller.listRadius,
                      ),
                    );
                  },
                ),
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'FEASTIFY',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          );
        },
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double progress;
  final List<int> listRadius;

  CirclePainter({required this.progress, required this.listRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 200.0;

    // Draw circles with different radii.
    for (final radius in listRadius) {
      final animatedRadius = radius + (radius * progress);
      canvas.drawCircle(size.center(Offset.zero), animatedRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
