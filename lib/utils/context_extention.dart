import 'package:simpson_viewer/utils/app_library.dart';

extension BuildContextUtils on BuildContext {
  FlavorConfig get flavorConfig => FlavorConfig.instance;
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => themeData.textTheme;
  ColorScheme get colorScheme => themeData.colorScheme;
  NavigatorState get navigator => Navigator.of(this);
}
