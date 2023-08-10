import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simpson_viewer/presentation/cubit/home/home_cubit.dart';
import 'package:simpson_viewer/utils/app_library.dart';

import '../../assets/json_reader.dart';
import '../../domain/repo_mocks.mocks.dart';

void main() {
  group('HomeCubit', () {
    late HomeCubit homeCubit;
    late MockCharacterRepository mockCharacterRepository;

    setUp(() {
      mockCharacterRepository = MockCharacterRepository();
      homeCubit = HomeCubit(mockCharacterRepository);
    });

    test('emits Ready state after initialization', () async {
      // Mock character data
      final mockCharacterData = json.decode(readJson('mock_simpson_data.json'))
          as Map<String, dynamic>;
      final data = mockCharacterData['RelatedTopics'] as List;
      final characters = data
          .map((e) => CharacterDetails.fromJson(e as Map<String, dynamic>))
          .toList();

      // Update the mock repository response without any argument
      when(
        mockCharacterRepository.getAll(
          'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
        ),
      ).thenAnswer((_) async => characters);

      await homeCubit.init();

      // Verify that the cubit emits the correct state
      expect(homeCubit.state, isA<HomeState>());
      expect(homeCubit.state, isA<Ready>());
      expect((homeCubit.state as Ready).searchCharacters, equals(characters));
      expect((homeCubit.state as Ready).characters, equals(characters));
    });
  });
}
