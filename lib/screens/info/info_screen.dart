part of '../screens.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
      backgroundColor: AppColors.loginScaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Thông tin hữu ích",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: FontFamilies.josefinSans,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                child: InfoCard(
                  size: size,
                  imageLink:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png',
                  durationText: '',
                  titleText: '',
                ),
              );
            }),
      ),
    );
  }
}
