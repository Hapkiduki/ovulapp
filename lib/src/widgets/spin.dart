import 'dart:math';

import 'package:ovulapp/src/theme/theme.dart';
import 'package:flutter/material.dart';

class Spin extends StatefulWidget {
  final double percentage;

  Spin({@required this.percentage});

  @override
  _SpinState createState() => _SpinState();
}

class _SpinState extends State<Spin>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double lastPercentage;
  Animation<double> effect;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    lastPercentage = 20;
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

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        
        double porcentaje = 8.0;
        final double porcentejeAnterior = 6.0;
        double porcentajeFinal =
            (porcentaje - porcentejeAnterior) * effect.value;
        print('Calculo: ${porcentaje - porcentejeAnterior}');
        final double valorAnterior = (pi / 60) * porcentejeAnterior;
        print('Valor ${pi / 60}');
        print('Valor Anterior $valorAnterior');
        double point = (120 / 25);
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
