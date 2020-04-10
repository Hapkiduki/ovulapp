import 'dart:math';

import 'package:ovulapp/src/theme/theme.dart';
import 'package:flutter/material.dart';

class Spin extends StatelessWidget {
  final int day, lastDay;

  Spin({
    @required this.day,
    this.lastDay = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child: _CustomSpin(this.day, this.lastDay),
    );
  }
}

class _CustomSpin extends StatefulWidget {
  final int day, lastDay;

  _CustomSpin(this.day, this.lastDay);

  @override
  _SpinState createState() => _SpinState();
}

class _SpinState extends State<_CustomSpin>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> effect;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    effect = Tween(begin: 0.0, end: pi / 60)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticIn));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final int porcentejeAnterior = widget.lastDay;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        double porcentajeFinal =
            (widget.day - porcentejeAnterior) * effect.value;
        final double valorAnterior = (pi / 60) * porcentejeAnterior;
        double point = (120 / 28);
        double angle = (valorAnterior + porcentajeFinal) * point;

        return Transform.rotate(
          angle: angle,
          child: CustomPaint(
            painter: _SpinPainter(),
          ),
        );
      },
    );
  }
}

class _SpinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width * .5, size.height * .5);

    final rect = Offset.zero & size;

    final paint = Paint()
      ..shader = gradiente1.createShader(rect)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    // Spin
    final path = Path();
    path.arcTo(Rect.fromCircle(center: center, radius: 90), -pi / 2.17,
        2 * pi * (96 / 100), false);
    path.quadraticBezierTo(120, 37, 125, 10);
    path.quadraticBezierTo(130, 37, 137, 35);
    canvas.drawPath(path, paint);
    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
