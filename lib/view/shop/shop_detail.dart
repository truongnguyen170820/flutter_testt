import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testt/list_product.dart';
import 'package:flutter_testt/utils/color_utils.dart';
import 'package:flutter_testt/utils/custom_appbar.dart';
import 'package:flutter_testt/utils/global.dart';
import 'package:flutter_testt/utils/showMessage.dart';
import 'package:flutter_testt/utils/utilities.dart';
import 'package:flutter_testt/view/shop/list_product.dart';
import 'package:flutter_testt/view/shop/shop_page.dart';

class ShopDetail extends StatefulWidget {

  final Shop shopProduct;

  const ShopDetail({Key key, this.shopProduct}) : super(key: key);
  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, "Produc"),
      body: Container(
        color: ColorUtils.gray7,
        padding: EdgeInsets.all(10),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Image.asset(widget.shopProduct.urlImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.fill,
              ),
             Container(
               padding: EdgeInsets.all(10),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Container(
                     width: setWidth(200),
                     child: Text(widget.shopProduct.nameProduct, style: TextStyle(fontWeight: FontWeight.w600,
                         color: ColorUtils.gray2),),
                   ),

                   Spacer(),
                   Container(
                     padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                     decoration: BoxDecoration(
                       color: ColorUtils.gray6,
                       borderRadius: BorderRadius.circular(10)
                     ),
                     child: Text(Utilities.formatMoney(widget.shopProduct.pirce, suffix: 'đ'),
                         textAlign: TextAlign.center,
                         style: TextStyle(
                             fontSize: setSp(18),
                             fontWeight: FontWeight.bold,
                             color: ColorUtils.gray2)),
                   ),
                 ],
               ),
             ),
              Text(widget.shopProduct.intro??"", textAlign: TextAlign.justify,textScaleFactor: 1.15, ),
              SizedBox(height: setHeight(30)),
              GestureDetector(
                onTap: (){
                  if(listViewShop.length  > 0){
                    if(widget.shopProduct != null){
                      int indexe = -1;
                      for(int i = 0; i< listViewShop.length; i ++){
                        if(widget.shopProduct == listViewShop[i]){
                          indexe = i;
                        }
                      }
                      if(indexe == 0){
                        listViewShop[0].number++;
                      }else if(indexe > 0 ){
                        listViewShop[indexe].number++;
                      }else{
                        listViewShop.add(widget.shopProduct);
                      }
                    }
                  }
                  else{
                    listViewShop.add(widget.shopProduct);
                  }
                  showMessage(context, "Bạn đã thêm vào giỏ hàng");
                  // Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ShopPage())).then((value) {
                    setState(() {

                    });
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorUtils.gray2,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: ColorUtils.WHITE_TEXT, size: 40,),
                      Text("+ Add to Cart", style: TextStyle(color: ColorUtils.WHITE_TEXT, fontSize: setSp(15), fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
