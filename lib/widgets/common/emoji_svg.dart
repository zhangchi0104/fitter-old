import 'package:flutter_svg/flutter_svg.dart';

class EmojiSvgs {
  static const _svgDir = 'assets/emojis/svg';
  static SvgPicture getSvgByName(String name, {double size = 20}) {
    final path = '$_svgDir/$name.svg';
    return SvgPicture.asset(path, width: size, height: size);
  }
}
