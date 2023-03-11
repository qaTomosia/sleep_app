part of 'configs.dart';

class Routes {
  static const splashRoute = "/";
  static const loginRoute = "login";
  static const signUpRoute = "sign_up";
  static const info = "info";
  static const demo = "demo";
  static const playList = "playList";
  static const signup = "signUp";
  static const  home = "home";
  static const listen = "listen";
  static CupertinoPageRoute generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "signUp":
       return CupertinoPageRoute(builder: (_) => SignUpScreen());
      case "info":
    
        return CupertinoPageRoute(builder: (_) => const InfoScreen());
      case "/":
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case loginRoute:
        return CupertinoPageRoute(builder: (_) =>  LoginScreen());
      case demo:
        return CupertinoPageRoute(builder: (_) => const DemoScreen());
      case playList:
        return CupertinoPageRoute(builder: (_) => PlayListScreen());
        case home:
        return CupertinoPageRoute(builder: (_)=> const HomeScreen());
        case listen:
        return CupertinoPageRoute(builder: (_)=> const MyApp());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(title: const Text("no route exist")),
                ));
    }
  }
}
