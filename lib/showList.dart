import 'package:flutter/material.dart';
import 'package:flutter_testt/detals_list_produc.dart';
import 'package:flutter_testt/list_product.dart';

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  // List<Product> listProductShow = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produc"),
      ),
      body: ListView.builder(
          itemCount: listProduct.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetalsListProduc(product: listProduct[index],)));
              },
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(border: Border.all(width: 1)),
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset(listProduct[index].imgUrl, width: 100,height: 100,),
                    Text(listProduct[index].title),
                    Text("${listProduct[index].price}")
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget itemProduct(Product product) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetalsListProduc()));
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(border: Border.all(width: 1)),
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(product.imgUrl),
            Text(product.title),
            Text("${product.price}")
          ],
        ),
      ),
    );
  }
}
