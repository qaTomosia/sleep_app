part of 'widgets.dart';

class AnimatedIconButton extends StatefulWidget {
  final bool isChoose;
  final VoidCallback voidCallback;
  final IconData icon;

  const AnimatedIconButton(
      {super.key,
      required this.isChoose,
      required this.voidCallback,
      required this.icon});

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> {
  late bool isChoose;
  @override
  void initState() {
    super.initState();
    isChoose = widget.isChoose;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChoose = !isChoose;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        color: Colors.red,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Icon(
            widget.icon,
            key: isChoose ? const ValueKey(0) : const ValueKey(1),
          ),
        ),
      ),
    );
  }
}
