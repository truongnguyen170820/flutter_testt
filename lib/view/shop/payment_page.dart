import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/color_utils.dart';
import 'package:flutter_testt/utils/custom_appbar.dart';
import 'package:flutter_testt/utils/global.dart';
import 'package:flutter_testt/utils/utilities.dart';
import 'package:flutter_testt/view/shop/list_product.dart';
import 'package:flutter_testt/view/shop/shop_page.dart';
import 'package:flutter_testt/view/shop/transport_page.dart';

class PaymentPage extends StatefulWidget {

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, "Thanh Toán"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              address(),
              _listProductPay(),
              // transportfree(),
              // methodPay(),
              total(),
              RaisedButton(
                onPressed: () {
                },
                child: Text("Đặt hàng"),
                color: ColorUtils.gray7,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget address() {
    return Container(
      padding: EdgeInsets.all(10),
      color: ColorUtils.WHITE_TEXT,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Địa chỉ nhận hàng"),
              Spacer(),
              GestureDetector(
                child: Text("Thay đổi"),
              )
            ],
          ),
          Row(
            children: [Text("Nguyễn Đức Trưởng - "), Text("0346526900")],
          ),
          Text("Số nhà 76, Lê Đức Thọ, Nam Từ Liêm, Hà Nội")
        ],
      ),
    );
  }

  Widget transportfree() {
    return Container(
      padding: EdgeInsets.all(10),
      color: ColorUtils.GREEN_TEXT,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Phí vận chuyển"),
          SizedBox(height: setHeight(4)),
          Row(
            children: [
              Text("Giao hàng tiết kiệm"),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Transport()));
                },
                child: Text(
                  Utilities.formatMoney(32000, suffix: ""),
                  style: TextStyle(
                      color: ColorUtils.RED_TEXT,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: setHeight(4)),
          Text("Nhận hàng vào ngày 14 Th4 - 18 Th4")
        ],
      ),
    );
  }

  Widget methodPay() {
    return Container(
      color: ColorUtils.WHITE_TEXT,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text("Phương thức thanh toán"),
          Spacer(),
          Container(
            width: setWidth(100),
            child: InkWell(
              onTap: () {},
              child: Text("Thanh toán khi nhận hàng",
                  style: TextStyle(color: ColorUtils.gray3),
                  textAlign: TextAlign.end),
            ),
          ),
          Icon(Icons.arrow_forward_ios_outlined,
              color: ColorUtils.gray3, size: 18)
        ],
      ),
    );
  }

  Widget total() {
    return Container(
      color: ColorUtils.WHITE_TEXT,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Text("Tổng thanh toán"),
          Spacer(),
          Text(
            Utilities.formatMoney(sum()),
            style: TextStyle(color: ColorUtils.RED_TEXT),
          )
        ],
      ),
    );
  }

  Widget _listProductPay() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listViewShop.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.gray6, width: setHeight(1))
            ),
            child: Row(
              children: [
                Image.asset(listViewShop[index].urlImage??"",
                    height: setHeight(70), width: setWidth(70)),
                SizedBox(width: setWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(listViewShop[index].nameProduct??"",style: TextStyle(fontSize: setSp(14)),),
                  SizedBox(height: setHeight(5)),
                 Row(
                   children: [
                     Text("${listViewShop[index].pirce??""}",style: TextStyle(fontSize: setSp(16), color: ColorUtils.RED_TEXT)),
                     SizedBox(width: setWidth(170)),
                     Text("x${listViewShop[index].number}")
                   ],
                 )
                  ],
                )
              ],
            ),
          );
        });
  }
}

