part of '../widgets.dart';

class SelectedTab extends StatelessWidget {
  final Color color;
  final Widget child;
  const SelectedTab({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: _SelectedTabClipper(),
      child: Container(
        width: size.width * 0.25,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          color: color,
        ),
        child: child,
      ),
    );
  }
}

class _SelectedTabClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path();
    path.cubicTo(width * 0.25, 0, 0, height, width * 0.25, height);
    path.lineTo(width * 0.75, height);
    path.cubicTo(width, height, width * 0.75, 0, width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
