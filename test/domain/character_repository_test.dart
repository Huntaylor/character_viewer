import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:simpson_viewer/data/model/character_details_model.dart';
import 'package:simpson_viewer/domain/repository/character_repository.dart';

void main() {
  group('CharacterRepository', () {
    late CharacterRepository characterRepository;
    // ignore: unused_local_variable
    late http.Client testClient;

    setUp(() {
      testClient = MockClient((request) async {
        if (request.url.toString() ==
            'http://api.duckduckgo.com/?q=simpsons+characters&format=json') {
          final mockResponseData = {
            'RelatedTopics': [
              {
                'Text': 'Character 1 - Description 1',
                'Icon': {'URL': 'icon_url_1'}
              },
              {
                'Text': 'Character 2 - Description 2',
                'Icon': {'URL': 'icon_url_2'}
              }
            ]
          };
          return http.Response(jsonEncode(mockResponseData), 200);
        } else {
          throw Exception('Unexpected URI');
        }
      });

      characterRepository = CharacterRepository();
    });

    test('getAll returns a list of CharacterDetails on success', () async {
      final result = await characterRepository.getAll(
          'http://api.duckduckgo.com/?q=simpsons+characters&format=json');

      expect(result, isA<List<CharacterDetails>>());
      expect(result.length, 63);
      expect(result[0].title, anything);
      expect(result[1].description, anything);
    });

    test('getAll throws an exception on failure', () async {
      testClient = MockClient((request) async {
        throw Exception('Mocked error');
      });

      characterRepository = CharacterRepository();

      expect(
          () async => await characterRepository.getAll(
              'http://api.duckduckgo.com/?q=simpsons+characters&format=jso'),
          throwsException);
    });
  });
}
