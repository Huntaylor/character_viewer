// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';

part 'character_details_model.g.dart';

@autoequal
class CharacterDetails extends Equatable {
  const CharacterDetails({
    required this.title,
    required this.description,
    this.icon,
  });

  final String? icon;
  final String title;
  final String description;

  @override
  List<Object?> get props => _$props;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'icon': icon,
    };
  }

  factory CharacterDetails.fromJson(Map<String, dynamic> map) {
    final fullText = map['Text'] as String;
    final characterInfo = fullText.split(' - ');

    final iconMap = map['Icon'] as Map;
    final icon = iconMap['URL'] as String;

    return CharacterDetails(
      icon: (icon.isNotEmpty)
          ? 'https://duckduckgo.com$icon'
          : 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.explicit.bing.net%2Fth%3Fid%3DOIP.s73cfpnZGPXUseiwwVW60QHaH1%26pid%3DApi&f=1&ipt=bf50637e1cd6632109515e521fa4052435fb499f9f7defee4c6bc546fb216458&ipo=images',
      title: characterInfo[0],
      description:
          characterInfo.length > 1 ? characterInfo[1] : characterInfo[0],
    );
  }
}
