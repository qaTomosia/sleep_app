part of 'widgets.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.15,
      child: Stack(
        children: [
          Positioned(
              left: size.width * 0.5 - 30,
              top: size.height * 0.03,
              child: CircleAvatar(
                backgroundImage: const AssetImage(Images.buttonBackground),
                radius: 30,
                child: Image.asset(
                  Images.moonStars,
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipPath(
              clipper: _TabBarClipper(),
              child: Container(
                color: AppColors.cardColor,
                height: size.height * 0.09,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(28, 0, 52, 0),
                      child: Icon(Icons.house),
                    ),
                    Icon(Icons.video_call),
                    Spacer(),
                    Icon(Icons.notes),
                    Padding(
                      padding: EdgeInsets.fromLTRB(52, 0, 28, 0),
                      child: Icon(Icons.chat),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(
        size.width * 0.375, 0, size.width * 0.4, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.45, size.height * 0.45,
    //     size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width * 0.6, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.625, 0, size.width * 0.65, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return this != oldClipper;
  }
}
