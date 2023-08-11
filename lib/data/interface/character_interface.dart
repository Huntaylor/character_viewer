import 'package:simpson_viewer/domain/model/character_details_model.dart';

// ignore: one_member_abstracts
abstract class ICharacterSource {
  Future<List<CharacterDetails>> getAll(String uri);
}
