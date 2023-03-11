part of 'widgets.dart';

class ImageWithButton extends StatelessWidget {
  final String imageLink;
  const ImageWithButton({super.key, required this.imageLink});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: size.width,
      color: Colors.transparent,
      child: Stack(children: [
        ConcaveImage(
            height: size.height * 0.4, width: size.width, imageLink: imageLink),
      ]),
    );
  }
}
