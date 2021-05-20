import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/color_utils.dart';
import 'package:flutter_testt/utils/custom_appbar.dart';
import 'package:flutter_testt/utils/global.dart';
import 'package:flutter_testt/utils/showMessage.dart';
import 'package:flutter_testt/utils/utilities.dart';
import 'package:flutter_testt/view/shop/payment_page.dart';
import 'package:flutter_testt/view/shop/shop_detail.dart';
import 'package:flutter_testt/view/shop/shop_page.dart';

class ListProduct extends StatefulWidget {
  final Shop shop;

  const ListProduct({Key key, this.shop}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if(listViewShop.length  > 0){
    //   if(widget.shop != null){
    //     int indexe = -1;
    //     for(int i = 0; i< listViewShop.length; i ++){
    //       if(widget.shop == listViewShop[i]){
    //         indexe = i;
    //       }
    //     }
    //     if(indexe == 0){
    //       listViewShop[0].number++;
    //     }else if(indexe > 0 ){
    //       listViewShop[indexe].number++;
    //     }else{
    //       listViewShop.add(widget.shop);
    //     }
    //   }
    // }
    // else{
    //   listViewShop.add(widget.shop);
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, "Cart",),
      body:
      Column(
        children: [
          _buildCart(listViewShop),
          total()
        ],
      ),
    );
  }

  Widget _buildCart(List<Shop> listShop) {
    return Expanded(
      child:
      ListView.builder(
          itemCount: listViewShop.length,
          itemBuilder: (context, index) {
        return itemProducCart(listViewShop[index], index);
      }),
    );
  }

  Widget itemProducCart(Shop shop, int index) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopDetail(shopProduct: shop)));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 14, 0, 14),
        width: setWidth(375),
        height: setHeight(136),
        decoration: BoxDecoration(
          color: ColorUtils.WHITE_TEXT,
          border: Border.all(color: ColorUtils.gray7, width: setWidth(1)),
        ),
        child: Row(
          children: [
            Image.asset(
              shop.urlImage ?? "",
              height: setHeight(100),
              width: setWidth(100),
            ),
            SizedBox(width: setWidth(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shop.nameProduct ?? ""),
                SizedBox(height:setHeight(4)),
                Text(Utilities.formatMoney(shop.pirce, suffix: 'đ')),
                // SizedBox(height:setHeight(4)),
               Row(
                 children: [
                   Text("Số lượng"),
                   SizedBox(width: setWidth(10)),
                   quantityChange(shop),
                   SizedBox(width: setWidth(30)),
                   IconButton(icon: Icon(Icons.delete_outline), onPressed: (){
                   setState(() {
                     listViewShop.removeAt(index);
                     listShop.forEach((element) {
                       if(element == shop){
                         element.number=1;
                         // element.pirce = 0;
                       }
                     });
                   });
                   })
                 ],
               ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget quantityChange(Shop shop) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              shop.number == 1 ? 1 : shop.number--;
              // product.number--;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: setHeight(22),
            width: setWidth(22),
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.gray7, width: setWidth(1)),
            ),
            child: Text('-',
                style: TextStyle(color: ColorUtils.TEXT_LIGHT)),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: setHeight(22),
          width: setWidth(58),
          decoration: BoxDecoration(
            border: Border.all(color: ColorUtils.gray7, width: setWidth(1)),
          ),
          child: Text("${shop.number ?? "0"}",
              style: TextStyle(fontSize: setSp(13))),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              shop.number == 10 ? 10 : shop.number++;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: setHeight(22),
            width: setWidth(22),
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.gray7, width: setWidth(1)),
            ),
            child: Text('+',
                style: TextStyle(color: ColorUtils.TEXT_LIGHT)),
          ),
        ),
      ],
    );
  }
  Widget total(){
    return Container(
      // color: ColorUtils.bgGreen,
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: ColorUtils.gray4,
        border: Border.all(color: ColorUtils.gray6, width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text("Tổng tiền tạm tính là:"),
              Spacer(),
              Text(Utilities.formatMoney(sum(), suffix: 'đ'))
            ],
          ),
          SizedBox(height: setHeight(10)),
          RaisedButton(
            child: Text("Tiến hành mua hàng",style: TextStyle(color: ColorUtils.TEXT_BOLD)),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
            }, color: ColorUtils.gray6,)
        ],
      ),
    );
  }

}
sum(){
double sum = 0;
listViewShop.forEach((element) {
  sum += element.pirce * element.number;
});
return sum;
}
