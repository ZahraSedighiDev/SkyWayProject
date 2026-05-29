import 'dart:math';
import 'package:flutter/material.dart';

class AirplaneWaveProLoader extends StatefulWidget {
  final Color color;

  const AirplaneWaveProLoader({super.key, this.color = Colors.white});

  @override
  State<AirplaneWaveProLoader> createState() => _AirplaneWaveProLoaderState();
}
class _AirplaneWaveProLoaderState extends State<AirplaneWaveProLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final double amplitude = 12;
  final double wavelength = 180;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double wave(double x, double phase) {
    return amplitude * sin((x / wavelength * 2 * pi) + phase * 2 * pi);
  }

  double slope(double x, double phase) {
    return amplitude *
        (2 * pi / wavelength) *
        cos((x / wavelength * 2 * pi) + phase * 2 * pi);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 80,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          double progress = controller.value;

          double x = progress * 220;
          double y = wave(x, progress) + 40;

          double angle = atan(slope(x, progress));

          return Stack(
            children: [
              CustomPaint(
                size: const Size(220, 80),
                painter: _WavePainter(progress, widget.color.withOpacity(.5)),
              ),
              CustomPaint(
                size: const Size(220, 80),
                painter: _TrailPainter(
                  airplaneX: x,
                  airplaneY: y,
                  color: widget.color.withOpacity(.6),
                ),
              ),
              Positioned(
                left: x - 14,
                top: y - 14,
                child: Transform.rotate(
                  angle: angle,
                  child: Icon(
                    Icons.flight,
                    color: widget.color,
                    size: 28,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
class _WavePainter extends CustomPainter {
  final double progress;
  final Color color;

  _WavePainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (double x = 0; x < size.width; x++) {
      double y =
          12 * sin((x / size.width * 2 * pi) + progress * 2 * pi) + 40;

      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
class _TrailPainter extends CustomPainter {
  final double airplaneX;
  final double airplaneY;
  final Color color;

  _TrailPainter({
    required this.airplaneX,
    required this.airplaneY,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    double startX = airplaneX - 60;
    double midX = airplaneX - 30;

    path.moveTo(startX, airplaneY);

    path.quadraticBezierTo(
      midX,
      airplaneY + 10,
      airplaneX - 10,
      airplaneY,
    );

    canvas.drawPath(path, paint);

    // fade circles for jet smoke
    final smokePaint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 6; i++) {
      smokePaint.color = color.withOpacity(0.4 - (i * 0.05));

      canvas.drawCircle(
        Offset(airplaneX - 15 - (i * 10), airplaneY + (i * 1.5)),
        3 + i.toDouble(),
        smokePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _TrailPainter oldDelegate) {
    return true;
  }
}
