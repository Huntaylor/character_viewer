import 'package:simpson_viewer/data/model/character_details_model.dart';

// ignore: one_member_abstracts
abstract class ICharacterSource {
  Future<List<CharacterDetails>> getAll(String uri);
}
