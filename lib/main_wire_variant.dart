import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:simpson_viewer/app/app.dart';
import 'package:simpson_viewer/bootstrap.dart';

void main() {
  FlavorConfig(
    name: 'com.sample.wireviewer',
    variables: {
      'base_url':
          'http://api.duckduckgo.com/?q=the+wire+characters&format=json',
      'title': 'The Wire',
      'theme': 1
    },
  );
  bootstrap(
    () => const App(),
  );
}
