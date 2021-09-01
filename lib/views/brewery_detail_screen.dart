import 'package:flutter/material.dart';
import 'package:rns_task/modals/brewery_modal.dart';

class BreweryDetailScreen extends StatelessWidget {
  BreweryModal modal;
BreweryDetailScreen(this.modal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Brewery Detail"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TitleAndValue(title: "Name",value: modal.name),

              TitleAndValue(title: "ID",value: modal.id.toString(),),

              TitleAndValue(title: "OBDB ID",value: modal.obdbId,),

              TitleAndValue(title: "Type",value: modal.breweryType,),

              TitleAndValue(title: "Street",value: modal.street,),

              TitleAndValue(title: "Address2",value: modal.address2,),

              TitleAndValue(title: "Address3",value: modal.address3,),


              TitleAndValue(title: "State",value: modal.state,),

              TitleAndValue(title: "Country Province",value: modal.countyProvince,),

              TitleAndValue(title: "Postal Code",value: modal.postalCode,),

              TitleAndValue(title: "Country",value: modal.country,),

              TitleAndValue(title: "Lat",value: modal.latitude,),

              TitleAndValue(title: "Lng",value: modal.longitude,),

              TitleAndValue(title: "Phone",value: modal.phone,),

              TitleAndValue(title: "Website",value: modal.websiteUrl,),

            ],
          ),
        ),
      ),
    );
  }
}

class TitleAndValue extends StatelessWidget {
  String? title;
  String? value;
   TitleAndValue({this.title,this.value});

  @override
  Widget build(BuildContext context) {
    return
      value==null?Container():
    Column(

      children: [
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            Text(value??"",style: TextStyle(fontSize: 16,),)
          ],
        ),
        Divider()
      ],
    );
  }
}



