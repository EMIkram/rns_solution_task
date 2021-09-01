// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:rns_task/modals/brewery_modal.dart';
import 'package:rns_task/services/http_service.dart';

void main() {
  test('testing some runtime types of data coming from API ',() async {
    List<BreweryModal> modalList = await HttpService.getBreweryList();
    modalList.forEach((element) {
      expect(element.name.runtimeType,String);
    });
  });
  test('any',() async {
    List<BreweryModal> modalList = await HttpService.getBreweryList();
    modalList.forEach((element) {
      expect(element.id.runtimeType,int);
    });
  });
  test('any',() async {
    List<BreweryModal> modalList = await HttpService.getBreweryList();
    modalList.forEach((element) {
      expect(element.phone!.length<=12,true);
    });
  });



}
