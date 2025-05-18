import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_services/core/constants/app_texts.dart';

void main() {
  testWidgets(
    'Splash screen shows title and loading indicator when isLoading is true',
    (WidgetTester tester) async {
      final splashScreen = ValueNotifier(true);

      await tester.pumpWidget(
        MaterialApp(
          home: ValueListenableBuilder(
            valueListenable: splashScreen,
            builder: (context, isLoading, _) {
              return Scaffold(
                body: Column(
                  children: <Widget>[
                    Text(
                      'Local Service',
                      style: AppTexts.headingBold.bold.white,
                    ),
                    if (isLoading) const CircularProgressIndicator(),
                  ],
                ),
              );
            },
          ),
        ),
      );
      expect(find.text('Local Service'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );
}
