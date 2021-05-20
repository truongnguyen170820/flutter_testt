
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utilites {
  // static String formatNumber({dynamic number,String format = "#0.00"}){
  //   return new NumberFormat(format).format(number);
  // }
  //
  // static String formatMoney(dynamic number,{String suffix = "VNĐ"}){
  //   final oCcy = new NumberFormat("#,##0", "vi_VN");
  //   return oCcy.format(number) + ' ' + suffix;
  // }

  static showToast(BuildContext context,String mess,{Color textColor = Colors.white}){
    FlutterToast(context).showToast(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.black45,
          ),
          child: Text(mess,)
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 1),
    );
  }
  // static const DATE_FORMAT = 'yyyy/M/d';
  // static String formattedDate(DateTime dateTime) {
  //   print('dateTime ($dateTime)');
  //   return DateFormat(DATE_FORMAT).format(dateTime);
  // }

  // showToastLostInternet(BuildContext context){
  //   FlutterToast(context).showToast(child: Container(
  //     width: setWidth(188),
  //     height: setWidth(188),
  //     padding: EdgeInsets.fromLTRB(setWidth(30),setWidth(20),setWidth(30),setWidth(30)),
  //     decoration: BoxDecoration(
  //         borderRadius:BorderRadius.circular(setWidth(19)),
  //         color: ColorUtils.BLACK_BACKGROUND
  //     ) ,
  //     child: Column(
  //       children: <Widget>[
  //         CircleAvatar(
  //           radius: setWidth(40),
  //           backgroundColor: ColorUtils.RED_BACKGROUND,
  //           child: Icon(
  //             Icons.signal_wifi_off,
  //             color: Colors.white,
  //             size: setWidth(30),
  //           ),
  //         ),
  //         WidgetSpacer(height:setWidth(5)),
  //         Text("Không có kết nối internet",textAlign: TextAlign.center,
  //           style: FontUtils.NORMAL.copyWith(fontSize: setSp(16),color: Colors.white),)
  //       ],
  //     ),
  //   ),gravity: ToastGravity.CENTER);
  // }

  // showToastGetLocationFail(BuildContext context){
  //   FlutterToast(context).showToast(child: Container(
  //     width: setWidth(200),
  //     height: setWidth(200),
  //     padding: EdgeInsets.fromLTRB(setWidth(30),setWidth(20),setWidth(30),setWidth(30)),
  //     decoration: BoxDecoration(
  //         borderRadius:BorderRadius.circular(setWidth(19)),
  //         color: ColorUtils.BLACK_BACKGROUND
  //     ) ,
  //     child: Column(
  //       children: <Widget>[
  //         CircleAvatar(
  //           radius: setWidth(40),
  //           backgroundColor: ColorUtils.RED_BACKGROUND,
  //           child: Icon(
  //             Icons.location_off,
  //             color: Colors.white,
  //             size: setWidth(30),
  //           ),
  //         ),
  //         WidgetSpacer(height:setWidth(5)),
  //         Text("Không tìm được vị trí của bạn",textAlign: TextAlign.center,
  //           style: FontUtils.NORMAL.copyWith(fontSize: setSp(16),color: Colors.white),)
  //       ],
  //     ),
  //   ),gravity: ToastGravity.CENTER);
  // }
  //
  // static isEmptyIdStr(String idstr){
  //   return idstr==null || idstr.isEmpty || idstr=="000000000000000000000000";
  // }
  //
  // static String currencyFormatterWithoutSuffix(num amount) {
  //   if (amount == null) return null;
  //   NumberFormat formatter = NumberFormat('###,###');
  //   return formatter.format(amount);
  // }
  //
  // static String dateToString(DateTime vdate, {String format:  "dd/MM/yyyy"}){
  //   DateFormat dateFormat = DateFormat(format);
  //   return dateFormat.format(vdate);
  // }
  //
  //
  //
  // static ProgressDialog getProgressDialog(BuildContext context, {String message = "Vui lòng chờ..."}){
  //   final dialog = ProgressDialog(context);
  //   dialog.style(
  //       message: message,
  //       borderRadius: 10.0,
  //       backgroundColor: Colors.white,
  //       progressWidget: CircularProgressIndicator(),
  //       elevation: 10.0,
  //       insetAnimCurve: Curves.easeInOut,
  //       progress: 0.0,
  //       maxProgress: 100.0,
  //       progressTextStyle: TextStyle(
  //           color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
  //       messageTextStyle: TextStyle(
  //           color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
  //   );
  //   return dialog;
  // }
}