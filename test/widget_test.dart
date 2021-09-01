
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rns_task/main.dart';
import 'package:rns_task/modals/brewery_modal.dart';
import 'package:rns_task/services/http_service.dart';
import 'package:rns_task/views/brewery_detail_screen.dart';
import 'package:rns_task/views/home_screen.dart';

void main() {
  testWidgets('Navigator test', (WidgetTester tester) async {
    List<BreweryModal> modalList = await HttpService.getBreweryList();
    await tester.pumpWidget(HomeScreen());

    expect(find.byType(ListTile().runtimeType), findsNWidgets(modalList.length));


    await tester.tap(find.byType(ListTile().runtimeType));
    await tester.pump();

    // Verify that our counter has incremented.
    expect( find.byType(BreweryDetailScreen),BreweryDetailScreen);

  });
}
