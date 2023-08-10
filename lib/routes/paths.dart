import 'package:go_router_paths/go_router_paths.dart';

class Paths {
  const Paths._();

  static Path get initial => Path('');
  static AppLaunchPath get appLaunch => AppLaunchPath();
}

class AppLaunchPath extends Path {
  AppLaunchPath() : super('app_launch');

  HomePath get home => HomePath(parent: this);
}

class HomePath extends Path {
  HomePath({required super.parent}) : super('home');

  Path get details => Path('details', parent: this);
}
