import 'package:flutter/material.dart';
import 'package:flutter_testt/list_product.dart';

class DetalsListProduc extends StatefulWidget {

  final Product product;

  const DetalsListProduc({Key key, this.product}) : super(key: key);

  @override
  _DetalsListProducState createState() => _DetalsListProducState();
}

class _DetalsListProducState extends State<DetalsListProduc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin"),
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(widget.product.imgUrl, width: 100,height: 100,),
          Text(widget.product.title, style: TextStyle(color: Colors.pink),),
          Text("${widget.product.price}")
        ],
      ),
    );
  }
}
