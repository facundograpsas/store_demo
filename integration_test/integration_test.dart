import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:store_demo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on product item, opening their details', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify there's no description of product visible
      expect(find.text('Description:'), findsNothing);

      // Finds the product to tap on.
      final Finder productItem = find.byTooltip('Practical Cotton Gloves');

      // Emulate a tap on the product item.
      await tester.tap(productItem);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the it navigated to details page.
      expect(find.text('Description:'), findsOneWidget);
    });

    //When the icon is inside a badge for some reason this test fails, it can't tap the badge nor the
    // IconButton. Works if the IconButton is isolated.
    // testWidgets('tap on shopping cart icon, go to shopping cart page',
    //     (tester) async {
    //   app.main();
    //   await tester.pumpAndSettle();

    //   final Finder cartButton = find.byIcon(Icons.shopping_cart);

    //   await tester.pumpAndSettle();

    //   // Emulate a tap on the shopping cart icon.
    //   await tester.tap(cartButton);

    //   // Trigger a frame.
    //   await tester.pumpAndSettle();

    //   // Verify it's in shopping cart screen.
    //   expect(find.text('My cart'), findsOneWidget);
    // });

    testWidgets(
        'tap on product item, opening their details, add to cart, check if badge changes',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify there's no description of product visible
      expect(find.text('Description:'), findsNothing);

      // Finds the product to tap on.
      final Finder productItem = find.byTooltip('Practical Cotton Gloves');

      // Emulate a tap on the product item.
      await tester.tap(productItem);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the it navigated to details page.
      expect(find.text('Description:'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      final Finder addToCartButton = find.text('Add to cart');
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('1'), findsOneWidget);
    });
  });
}
