import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mononews_app/presentation/widgets/widgets.dart';

void main() {
  final String name = 'name';
  final String image = 'assets/science.png';

  group('Top Headline Article card Widget Test', () {
    Widget _makeTestableWidget() {
      return MaterialApp(home: Scaffold(body: CategoryCard(name, image)));
    }

    testWidgets('Testing if title Article shows', (WidgetTester tester) async {
      await tester.pumpWidget(_makeTestableWidget());
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });
  });
}
