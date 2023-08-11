import 'dart:io';

import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:simpson_viewer/data/repository/character_repository.dart';

@GenerateMocks([CharacterRepository, HttpClient, Response])
void main() {}
