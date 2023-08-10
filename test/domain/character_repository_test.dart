import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:simpson_viewer/data/model/character_details_model.dart';
import 'package:simpson_viewer/domain/repository/character_repository.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('CharacterRepository', () {
    late CharacterRepository characterRepository;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      characterRepository = CharacterRepository();
    });

    test('getAll returns a list of CharacterDetails on success', () async {
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

      when(mockHttpClient.get(Uri.parse('mock_uri'))).thenAnswer(
        (_) async => http.Response(jsonEncode(mockResponseData), 200),
      );

      final result = await characterRepository.getAll('mock_uri');

      expect(result, isA<List<CharacterDetails>>());
      expect(result.length, 2);
      expect(result[0].title, 'Character 1');
      expect(result[1].description, 'Description 2');
    });

    test('getAll throws an exception on failure', () async {
      // Stub response
      when(mockHttpClient.get(Uri.parse('mock_uri')))
          .thenAnswer((_) async => http.Response('Error', 400));

      expect(
        () async => characterRepository.getAll('mock_uri'),
        throwsException,
      );
    });
  });
}
