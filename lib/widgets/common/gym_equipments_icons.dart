import 'package:flutter_svg/flutter_svg.dart';

class GymEquipmentsIcons {
  static const svgDir = 'assets/gym-equipments/svg';
  static final barbell = _getSvg('$svgDir/barbell.svg');
  static final kettlebell = _getSvg('$svgDir/kettlebell.svg');
  static final dumbell = _getSvg('$svgDir/dumbell.svg');
  static final machine = _getSvg('$svgDir/machine.svg');
  static final bodyWeight = _getSvg('$svgDir/bodyweight.svg');

  static SvgPicture _getSvg(String path) {
    return SvgPicture.asset(path, width: 50, height: 50);
  }

  static SvgPicture getSvgByName(String name) {
    final svgName = name.replaceAll(" ", "").toLowerCase();
    return _getSvg('$svgDir/$svgName.svg');
  }
}
