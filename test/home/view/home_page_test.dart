import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:simpson_viewer/presentation/pages/home/home.dart';
import 'package:simpson_viewer/utils/app_library.dart';
import 'package:simpson_viewer/utils/widgets/character_card.dart';

import '../home_mocks.mocks.dart';

void main() {
  group('HomePage Widget Test', () {
    testWidgets('Renders correctly when isLoading is false',
        (WidgetTester tester) async {
      final characters =
          <CharacterDetails>[]; // Provide sample character data here

      final homeCubit = MockHomeCubit();
      when(homeCubit.state).thenReturn(
        Ready(
          searchCharacters: characters,
          characters: characters,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: homeCubit,
            child: const HomePage(),
          ),
        ),
      );

      // Verify if the correct widgets are displayed
      expect(
        find.text(''),
        findsOneWidget,
      ); // Replace 'App Title' with your actual app title
      expect(find.byType(SearchableList), findsOneWidget);
      expect(find.byType(CharacterCard), findsWidgets);
    });
  });
}
