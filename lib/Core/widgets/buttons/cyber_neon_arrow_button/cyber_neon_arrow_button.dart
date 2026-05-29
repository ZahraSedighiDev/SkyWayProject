import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CyberNeonArrowButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CyberNeonArrowButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  State<CyberNeonArrowButton> createState() => _CyberNeonArrowButtonState();
}
class _CyberNeonArrowButtonState extends State<CyberNeonArrowButton> {
  double dx = 0;
  double dy = 0;
  double scale = 1;
  double rotate = 0;

  void _onHover(PointerHoverEvent e) {
    dx = (e.localPosition.dx - 32) * 0.08;
    dy = (e.localPosition.dy - 32) * 0.08;
    rotate = dx * 0.015;
    scale = 1.10;
    setState(() {});
  }

  void _onExit(PointerExitEvent e) {
    dx = 0;
    dy = 0;
    rotate = 0;
    scale = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..translate(dx, dy)
            ..scale(scale)
            ..rotateZ(rotate),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF4A64A8), // Navy 300
                  Color(0xFF1E3A8A), // Navy 500
                  Color(0xFF00C8FF), // Neon Blue Accent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1E3A8A).withOpacity(.6), // Navy 500 glow
                  blurRadius: 22,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: const Color(0xFF00C8FF).withOpacity(.4), // Neon edge
                  blurRadius: 28,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
