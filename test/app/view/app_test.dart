import 'package:flutter_test/flutter_test.dart';
import 'package:simpson_viewer/app/app.dart';
import 'package:simpson_viewer/presentation/pages/home/home.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
