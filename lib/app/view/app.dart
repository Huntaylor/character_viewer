import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:simpson_viewer/domain/repository/character_repository.dart';
import 'package:simpson_viewer/presentation/pages/home/home.dart';
import 'package:simpson_viewer/utils/app_library.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const usedScheme = [FlexScheme.gold, FlexScheme.tealM3];
    final index = context.flavorConfig.variables['theme'] as int;
    final characterUseCase = CharacterRepository();
    return BlocProvider(
      create: (context) => HomeCubit(characterUseCase),
      child: MaterialApp.router(
        theme: FlexThemeData.light(
          scheme: usedScheme[index],
          appBarElevation: 0.5,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: usedScheme[index],
          appBarElevation: 2,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: goRoutes,
      ),
    );
  }
}
