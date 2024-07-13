import 'package:flutter/material.dart';

class PercentIndicator extends StatelessWidget {
  final double percent;
  final double lineWidth;
  final double radius;
  final Color backgroundColor;
  final Color progressColor;
  final Widget child;

  const PercentIndicator({
    super.key,
    required this.percent,
    required this.lineWidth,
    required this.radius,
    required this.backgroundColor,
    required this.progressColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 1,
      height: radius * 1,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(radius * 2, radius * 2),
            painter: _CirclePainter(
              lineWidth: lineWidth,
              backgroundColor: backgroundColor,
              progressColor: progressColor,
              percent: percent,
            ),
          ),
          Center(child: child),
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double lineWidth;
  final double percent;
  final Color backgroundColor;
  final Color progressColor;

  _CirclePainter({
    required this.lineWidth,
    required this.percent,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - lineWidth) / 2;

    canvas.drawCircle(center, radius, backgroundPaint);

    final double sweepAngle = 2 * 3.141592653589793238 * percent;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793238 / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}