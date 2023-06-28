import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import '../widgets/item_widgets.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    
  }
  loadData() async {
    await Future.delayed(Duration(seconds:2));
   final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
        print(catalogJson);
    final decodedData = jsonDecode(catalogJson);

    var productsData = decodedData["products"];
    
    CatalogModel.items = List.from(productsData)
    .map<Item>((item) =>Item.fromMap(item))
    .toList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App" ,style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items!=null&&CatalogModel.items.isNotEmpty)?  ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
        ):Center(
          child:CircularProgressIndicator(),),
      ),
      drawer: MyDrawer(),
    );
  }
}
