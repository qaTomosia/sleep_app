part of 'widgets.dart';

class ConcaveImage extends StatelessWidget {
  final double height;
  final double width;
  final String imageLink;
  const ConcaveImage(
      {super.key,
      required this.height,
      required this.width,
      required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ImageClipper(),
      child: Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageLink), fit: BoxFit.fill)),
      ),
    );
  }
}

class _ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double width = size.width;
    Path path = Path();
    Path clipPath = Path();
    path.lineTo(0, height);
    path.lineTo(width * 0.65, height);
    path.quadraticBezierTo(
        width * 0.675, height, width * 0.7, height - width * 0.05);
    // path.cubicTo(width * 0.75, height - width * 0.3, width * 0.85,
    //     height - width * 0.3, width * 0.95, height);
    clipPath.addOval(Rect.fromCircle(
        center: Offset(width * 0.8, height), radius: width * 0.12));
    path.lineTo(width * 0.9, height - width * 0.05);
    path.quadraticBezierTo(width * 0.925, height, width * 0.95, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    return Path.combine(
      PathOperation.reverseDifference,
      clipPath,
      path,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
