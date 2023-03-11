part of 'widgets.dart';

class ClipPathContainer extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  const ClipPathContainer(
      {super.key,
      required this.text,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.blue,
      child: ClipPath(
        clipper: _CustomTabBarClipper(),
        child: Container(
            color: Colors.black,
            height: height,
            width: width,
            child: Center(child: Text(text))),
      ),
    );
  }
}

class _CustomTabBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.quadraticBezierTo(
        width * 0.05, height * 0.05, width * 0.075, height * 0.1);
    path.quadraticBezierTo(width * 0.12, height * 0.15, width * 0.15, height);
    path.lineTo(width * 0.85, height);
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
