part of 'configs.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class AppColors {
  // Background Color
  static Color loginScaffoldColor = HexColor.fromHex("#0E031D");
  static Color textTitleColor = HexColor.fromHex("#FEFEFE");
  static Color textHintColor = HexColor.fromHex("#534C5D");
  static Color authButtonColor = HexColor.fromHex("#F88C69");
  static Color dashLineColor = HexColor.fromHex("#534C5D");
  static Color cardColor = HexColor.fromHex("#221934");
  static Color playButtonColor = HexColor.fromHex("FBC5B4");
}
