import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rns_task/modals/brewery_modal.dart';


class HttpService{
 static  Uri _baseUrl =  Uri.parse("https://api.openbrewerydb.org/breweries");




static Future<List<BreweryModal>> getBreweryList() async {
try{
  http.Response response = await http.get(_baseUrl);
if(response.statusCode==200)
  {
    List rawList = jsonDecode(response.body);
    return rawList.map((json) =>BreweryModal.fromJson(json) ).toList();
  }
else
  {
    print("response unsuccessful on ${response.statusCode}");
    return [];
  }
}
catch(e){


  return [];
}

}


}