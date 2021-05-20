
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
            Text(Utilities.formatMoney(itemShop.pirce, suffix: 'đ'),
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
  Shop("assets/images/sofa2.jpg", "SOFA ĐƠN AKIO S7", 1700000,
      intro:
          "SOFA ĐƠN AKIO S7Color: \nTự nhiên , nâu đậm , nệm xám . \n ( Khách yêu cầu màu liên hệ trực tiếp )\nMô tả\nGhế sofa đơn Akio là sản phẩm lọt top bán chạy nhất trong dòng sofa đơn trong năm vừa qua.\n Thông Số› Kích Thước: H : 42/84cm"),
  Shop("assets/images/sofa4.jpg", "Ghế sofa đơn bọc nỉ -tp 25", 1900000,
      intro:
          "Mô tả :\nKích thước: Dài: 80x Sâu:70cm\nChất liệu: Gỗ tự nhiên, bọc vải nỉ Malaysi\nBảo hành : 12 tháng \nChú ý: \nNhận đặt hàng kích thước và màu sắc theo yêu cầu"),
  Shop("assets/images/sofa3.jpg", "Sofa văng màu xanh nhạt 1m6-tp 17", 2900000,
      intro:
          "Mô tả : \n Kích thước: Dài: 1m6x Sâu:70cm \n Chất liệu: Gỗ tự nhiên, bọc vải nỉ Malaysia\nMiễn phí:Tư vấn thiết kế và lắp đặt\nBảo hành: 12 tháng\nChú ý: \n   Nhận đặt hàng kích thước và màu sắc theo yêu cầu"),
  Shop("assets/images/sofa5.jpg", "Sofa văng nỉ cao cấp SFV002", 1600000,
      intro:
          "Chất liệu : Vải nỉ, khung gỗ thịt cao cấp \n Kích thước: 800 x 750mm\nMàu sắc: vàng, kem, đỏ, mận, đen…. rất nhiều màu.\n Độ mới 100%."),
  Shop("assets/images/sofa6.jpg", "Sofa văng nỉ cao cấp SFV01", 2590000,
      intro:
          "Chất liệu : Vải nỉ, khung gỗ thịt cao cấp\nKích thước: 1600 x 750mm\nMàu sắc: vàng, kem, đỏ, mận, đen…. rất nhiều màu.\nĐộ mới 100%."),
];
