import 'package:autoequal/autoequal.dart';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:simpson_viewer/domain/repository/character_repository.dart';
import 'package:simpson_viewer/utils/app_library.dart';

part 'home_state.dart';
part 'home_cubit.g.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._characters) : super(const Loading()) {
    init();
  }
  final CharacterRepository _characters;

  Future<void> init() async {
    final characters = await _characters.getAll(
      FlavorConfig.instance.variables['base_url'].toString(),
    );

    await Future<void>.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    emit(
      Ready(
        searchCharacters: characters,
        characters: characters,
      ),
    );
  }
}
