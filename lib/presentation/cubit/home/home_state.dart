part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  bool get isLoading => this is Loading;
  bool get isReady => this is Ready;

  Loading get asLoading => this as Loading;
  Ready get asReady => this as Ready;

  @override
  List<Object?> get props => [];
}

class Loading extends HomeState {
  const Loading();
}

@CopyWith()
@autoequal
class Ready extends HomeState {
  const Ready({
    required this.characters,
    required this.searchCharacters,
  });
  final List<CharacterDetails> characters;
  final List<CharacterDetails> searchCharacters;

  @override
  List<Object?> get props => _$props;
}
