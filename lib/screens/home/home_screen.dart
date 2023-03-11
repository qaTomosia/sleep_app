part of '../screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageScaffold(
      assetName: Images.loginBackGround,
      title: "",
      isRound: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(Images.moonStars),
        ), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomAppBar: BottomAppBar(
        color: AppColors.cardColor,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin: 8,
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: () {
                NavigationService()
                    .navigateFinishToWithContext(context, Routes.listen);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.note,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.chat_bubble_fill,
                color: Colors.white,
              ),
              onPressed: () {
                NavigationService().navigateToWithContext(context, Routes.demo);
              },
            ),
          ],
        ),
      ),
      child: Container(),
    );
  }
}
