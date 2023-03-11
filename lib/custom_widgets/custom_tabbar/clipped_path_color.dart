part of '../widgets.dart';

class ClippedPartColor extends StatelessWidget {
  final Color color;
  const ClippedPartColor({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: _PartClipper(),
      child: Container(
        color: color,
        width: size.width * 0.25,
        height: size.height * 0.05,
      ),
    );
  }
}

class _PartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path();
    path.cubicTo(width * 0.25, 0, 0, height, width * 0.25, height);
    path.lineTo(width * 0.75, height);
    path.cubicTo(width, height, width * 0.75, 0, width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
