part of 'configs.dart';

class Application {
  // Singleton factory
  static final Application _instance = Application._internal();
  factory Application() => _instance;
  Application._internal();

  static SharedPreferences? preferences;
  static AudioService? audioService;

  Future<void> setPreferences() async {
    preferences = await SharedPreferences.getInstance();
  //   audioService = await AudioService.init(
  //   builder: () => MyAudioHandler(),
  //   config: const AudioServiceConfig(
  //     androidNotificationChannelId: '',
  //     androidNotificationChannelName: 'Music playback',
  //   ),
  // );
  }


  Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }
}