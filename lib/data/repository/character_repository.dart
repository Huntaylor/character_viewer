import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:simpson_viewer/domain/model/character_details_model.dart';
import 'package:simpson_viewer/data/interface/character_interface.dart';

class CharacterRepository extends ICharacterSource {
  @override
  Future<List<CharacterDetails>> getAll(String uri) async {
    final List<CharacterDetails> characterJson;

    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map;
      final data = jsonData['RelatedTopics'] as List;
      characterJson = data
          .map((e) => CharacterDetails.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }

    return characterJson;
  }
}
