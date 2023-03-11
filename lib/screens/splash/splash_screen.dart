part of '../screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState(){
    super.initState();
  Future.delayed(const Duration(seconds: 2), () {
                NavigationService()
                    .navigateFinishToWithContext(context, Routes.loginRoute);
              });

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          switch (state.status) {
            case LoginStatus.init:
              Future.delayed(const Duration(seconds: 2), () {
                NavigationService()
                    .navigateFinishToWithContext(context, Routes.loginRoute);
              });
              break;
            case LoginStatus.success:
              Future.delayed(const Duration(seconds: 2), () {
                NavigationService()
                    .navigateFinishToWithContext(context, Routes.home);
              });
              break;
            case LoginStatus.fail:
              break;
          }
        },
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Images.introImage)),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset(Images.moon),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset(Images.lunne),
                ),
                const Text(
                  "Ngủ ngon giảm căng thẳng",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
