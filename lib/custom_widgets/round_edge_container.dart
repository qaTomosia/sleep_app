part of 'widgets.dart';

class RoundEdgeContainer extends StatelessWidget {
  final bool isConvex;
  final Widget child;
  const RoundEdgeContainer({
    Key? key,
    this.isConvex = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ContainerClipper(isConvex: isConvex),
      child: child,
    );
  }
}

class _ContainerClipper extends CustomClipper<Path> {
  final bool isConvex;
  _ContainerClipper({
    required this.isConvex,
  });
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width / 2, size.height * (isConvex ? 1 : 0.4),
        size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
