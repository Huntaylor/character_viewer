import 'package:searchable_listview/searchable_listview.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:simpson_viewer/presentation/pages/home/home.dart';
import 'package:simpson_viewer/utils/app_library.dart';
import 'package:simpson_viewer/utils/widgets/character_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (_, state) {
        return state.isReady;
      },
      builder: (context, state) {
        return HomeView(state: state);
      },
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({required this.state, super.key});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n.appTitle(
            context.flavorConfig.variables['title'].toString(),
          ),
        ),
      ),
      body: SafeArea(
        child: (state.isLoading)
            ? ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.transparent,
                      context.colorScheme.primaryContainer,
                    ],
                  ).createShader(bounds);
                },
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Shimmer(
                      direction: const ShimmerDirection.fromLBRT(),
                      color: context.colorScheme.primaryContainer,
                      child: Card(
                        elevation: 2,
                        child: Container(
                          height: 50,
                        ),
                      ),
                    );
                  },
                ),
              )
            : SearchableList<CharacterDetails>(
                filter: (value) => state.asReady.searchCharacters
                    .where(
                      (element) =>
                          element.title
                              .toLowerCase()
                              .contains(value.toLowerCase()) ||
                          element.description.toLowerCase().contains(
                                value.toLowerCase(),
                              ),
                    )
                    .toList(),
                initialList: state.asReady.searchCharacters,
                builder: (detail) => CharacterCard(
                  details: detail,
                ),
                autoFocusOnSearch: false,
                searchFieldEnabled: state.isReady,
                inputDecoration: InputDecoration(
                  hintText: l10n.searchText,
                  fillColor: context.colorScheme.surfaceVariant,
                ),
              ),
      ),
    );
  }
}
