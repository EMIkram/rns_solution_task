import 'package:flutter/material.dart';
import 'package:rns_task/modals/brewery_modal.dart';
import 'package:rns_task/services/http_service.dart';
import 'package:rns_task/views/brewery_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<BreweryModal> modalList = [];
  @override
  void initState() {
    loadModal();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: modalList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                BreweryModal modal = modalList[index];
                return SafeArea(
                  child: ListTile(
                    onTap: () {
                      onItemTap(modal);
                    },
                    title: Text(modal.name ?? ""),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal.city ?? ""),
                        Text(modal.breweryType ?? "")
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  onItemTap(BreweryModal modal){
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>  BreweryDetailScreen(modal),
      ),
    );
  }


  loadModal() async {
    modalList = await HttpService.getBreweryList();
    setState(() {
      isLoading = false;
    });
    print(modalList);
  }
}
