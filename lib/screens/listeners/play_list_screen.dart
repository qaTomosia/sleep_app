part of '../screens.dart';

class PlayListScreen extends StatelessWidget {
  final ValueNotifier<int> _notifier = ValueNotifier<int>(0);
  PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.loginScaffoldColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: Stack(children: [
                  AspectRatio(
                    aspectRatio: 1200 / 871,
                    child: ConcaveImage(
                      height: 0,
                      imageLink: Images.bichPhuong,
                      width: size.width,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 40,
                      child: CircleAvatar(
                        radius: size.width * 0.1,
                        backgroundColor: AppColors.authButtonColor,
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ValueListenableBuilder<int>(
                          valueListenable: _notifier,
                          builder:
                              (BuildContext context, int value, Widget? child) {
                            return GestureDetector(
                              onTap: () {
                                _notifier.value = index;
                              },
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (child, animation) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                                child: SongWidget(
                                  key: _notifier.value == index
                                      ? const ValueKey(1)
                                      : const ValueKey(0),
                                  song: const Song(
                                    audioLink: "",
                                    author: 'Bich Phuong',
                                    imageLink: Images.bichPhuong,
                                    songName: 'nam', duration: 0, title: 'Bich Phuong',

                                  ),
                                  color: _notifier.value == index
                                      ? AppColors.cardColor
                                      : Colors.transparent,
                                  width: size.width,
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
