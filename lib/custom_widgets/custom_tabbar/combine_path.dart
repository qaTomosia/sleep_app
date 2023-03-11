part of '../widgets.dart';

class CombineContainer extends StatelessWidget {
  final Color selectedColor;
  final Color clippedColor;
  final Widget child;
  const CombineContainer(
      {super.key,
      required this.selectedColor,
      required this.clippedColor,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          SelectedTab(color: selectedColor, child: child),
          ClippedPartColor(color: clippedColor)
        ],
      ),
    );
  }
}
