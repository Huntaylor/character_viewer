import 'dart:io';

String readJson(String fixturePath) =>
    File('test/assets/$fixturePath').readAsStringSync();
