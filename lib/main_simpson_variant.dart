import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:simpson_viewer/app/app.dart';
import 'package:simpson_viewer/bootstrap.dart';

void main() {
  FlavorConfig(
    name: 'com.sample.simpsonsviewer',
    variables: {
      'base_url':
          'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
      'title': 'The Simpsons',
      'theme': 0
    },
  );

  bootstrap(() => const App());
}
