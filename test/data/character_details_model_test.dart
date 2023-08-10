import 'package:flutter_test/flutter_test.dart';
import 'package:simpson_viewer/data/model/character_details_model.dart';

void main() {
  group('CharacterDetails', () {
    test('fromJson creates a CharacterDetails instance correctly', () {
      // Mock JSON map
      final mockJson = {
        'Text': 'Character Title - Character Description',
        'Icon': {
          'URL': 'mock_icon_url',
        },
      };

      final characterDetails = CharacterDetails.fromJson(mockJson);

      // Verify that the created instance has the correct properties
      expect(characterDetails, isA<CharacterDetails>());
      expect(characterDetails.title, 'Character Title');
      expect(characterDetails.description, 'Character Description');
      expect(characterDetails.icon, 'https://duckduckgo.commock_icon_url');
    });

    test('fromJson handles missing icon URL', () {
      // Mock JSON map without icon URL
      final mockJson = {
        'Text': 'Character Title - Character Description',
        'Icon': {'Height': '', 'URL': '', 'Width': ''},
      };

      final characterDetails = CharacterDetails.fromJson(mockJson);

      // Verify that the created instance has the correct properties
      expect(characterDetails, isA<CharacterDetails>());
      expect(characterDetails.title, 'Character Title');
      expect(characterDetails.description, 'Character Description');
      expect(
        characterDetails.icon,
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.explicit.bing.net%2Fth%3Fid%3DOIP.s73cfpnZGPXUseiwwVW60QHaH1%26pid%3DApi&f=1&ipt=bf50637e1cd6632109515e521fa4052435fb499f9f7defee4c6bc546fb216458&ipo=images',
      );
    });

    test('toJson converts a CharacterDetails instance to a JSON map', () {
      // Create a CharacterDetails instance
      const characterDetails = CharacterDetails(
        title: 'Test Title',
        description: 'Test Description',
        icon: 'test_icon_url',
      );

      final jsonMap = characterDetails.toJson();

      // Verify that the JSON map is correctly created
      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap['title'], 'Test Title');
      expect(jsonMap['description'], 'Test Description');
      expect(jsonMap['icon'], 'test_icon_url');
    });
  });
}
