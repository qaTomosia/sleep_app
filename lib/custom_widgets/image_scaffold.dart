part of 'widgets.dart';

class ImageScaffold extends StatelessWidget {
  final String assetName;
  final Widget child;
  final String title;
  final bool isRound;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final BottomAppBar? bottomAppBar;
  const ImageScaffold({
    Key? key,
    this.isRound = true,
    this.bottomAppBar,
    required this.assetName,
    required this.child,
    required this.title,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: bottomAppBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        backgroundColor: AppColors.loginScaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  isRound
                      ? RoundEdgeContainer(
                          isConvex: true,
                          child: SizedBox(
                            height: size.height * 0.3,
                            width: size.width,
                            child: Image.asset(
                              assetName,
                              fit: BoxFit.cover,
                            ),
                          ))
                      : SizedBox(
                          height: size.height * 0.3,
                          width: size.width,
                          child: Image.asset(
                            assetName,
                            fit: BoxFit.cover,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 72, 0, 0),
                    child: SizedBox(
                      height: size.height * 0.2,
                      width: size.width * 0.44,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: AppColors.textTitleColor, fontSize: 32),
                      ),
                    ),
                  ),
                ],
              ),
              child,
            ],
          ),
        ));
  }
}
