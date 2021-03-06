
import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/color_utils.dart';
import 'package:flutter_testt/utils/custom_appbar.dart';
import 'package:flutter_testt/utils/global.dart';
import 'package:flutter_testt/utils/utilites.dart';
import 'package:flutter_testt/utils/utilities.dart';
import 'package:flutter_testt/view/shop/list_product.dart';
import 'package:flutter_testt/view/shop/shop_detail.dart';

List<Shop> listViewShop = [];

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, "Armchairs", actions: [
        Stack(
          children: [
            IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorUtils.WHITE_TEXT,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListProduct())).then((value){
                        setState(() {
                        });
                  });
                }),
            Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: ColorUtils.WHITE_TEXT,
                  child: Text(listViewShop.length.toString(),
                      style: TextStyle(
                          color: ColorUtils.RED_TEXT,
                          fontWeight: FontWeight.bold,
                          fontSize: setSp(12)))
                )
            )
          ],
        )
      ]),
      body: Container(
        padding: EdgeInsets.all(4),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: setHeight(4),
                crossAxisSpacing: setWidth(4),
                crossAxisCount: 2,
                childAspectRatio: 60 / 90),
            itemCount: listShop.length,
            itemBuilder: (context, index) {
              return ItemList(listShop[index]);
            }),
      ),
    );
  }

  Widget ItemList(Shop itemShop) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShopDetail(shopProduct: itemShop)));
      },
      child: Container(
        height: 260,
        decoration: BoxDecoration(
            color: ColorUtils.gray7, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: setHeight(8)),
            Image.asset(
              itemShop.urlImage ?? "",
              height: 150,
              width: 160,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            SizedBox(height: setHeight(10)),
            Text(itemShop.nameProduct,
                style: TextStyle(
                    fontSize: setSp(16),
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.gray3)),
            SizedBox(height: setHeight(4)),
            Text(Utilities.formatMoney(itemShop.pirce, suffix: '??'),
                style: TextStyle(
                    fontSize: setSp(14),
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.gray2))
          ],
        ),
      ),
    );
  }
}

class Shop {
  String urlImage;
  String nameProduct;
  double pirce;
  String intro;
  int number;
  String status;

  Shop(this.urlImage, this.nameProduct, this.pirce,
      {this.intro, this.number = 1, this.status});
}

List<Shop> listShop = [
  Shop("assets/images/sofa2.jpg", "SOFA ????N AKIO S7", 1700000,
      intro:
          "SOFA ????N AKIO S7Color: \nT??? nhi??n , n??u ?????m , n???m x??m . \n ( Kh??ch y??u c???u m??u li??n h??? tr???c ti???p )\nM?? t???\nGh??? sofa ????n Akio l?? s???n ph???m l???t top b??n ch???y nh???t trong d??ng sofa ????n trong n??m v???a qua.\n Th??ng S?????? K??ch Th?????c: H : 42/84cm"),
  Shop("assets/images/sofa4.jpg", "Gh??? sofa ????n b???c n??? -tp 25", 1900000,
      intro:
          "M?? t??? :\nK??ch th?????c: D??i: 80x S??u:70cm\nCh???t li???u: G??? t??? nhi??n, b???c v???i n??? Malaysi\nB???o h??nh : 12 th??ng \nCh?? ??: \nNh???n ?????t h??ng k??ch th?????c v?? m??u s???c theo y??u c???u"),
  Shop("assets/images/sofa3.jpg", "Sofa v??ng m??u xanh nh???t 1m6-tp 17", 2900000,
      intro:
          "M?? t??? : \n K??ch th?????c: D??i: 1m6x S??u:70cm \n Ch???t li???u: G??? t??? nhi??n, b???c v???i n??? Malaysia\nMi???n ph??:T?? v???n thi???t k??? v?? l???p ?????t\nB???o h??nh: 12 th??ng\nCh?? ??: \n   Nh???n ?????t h??ng k??ch th?????c v?? m??u s???c theo y??u c???u"),
  Shop("assets/images/sofa5.jpg", "Sofa v??ng n??? cao c????p SFV002", 1600000,
      intro:
          "Ch???t li???u : V???i n???, khung g??? th???t cao c???p \n K??ch th?????c: 800 x 750mm\nM??u s???c: v??ng, kem, ?????, m???n, ??en???. r???t nhi???u m??u.\n ????? m???i 100%."),
  Shop("assets/images/sofa6.jpg", "Sofa v??ng n??? cao c????p SFV01", 2590000,
      intro:
          "Ch???t li???u : V???i n???, khung g??? th???t cao c???p\nK??ch th?????c: 1600 x 750mm\nM??u s???c: v??ng, kem, ?????, m???n, ??en???. r???t nhi???u m??u.\n????? m???i 100%."),
];
