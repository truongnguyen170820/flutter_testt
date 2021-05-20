import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/custom_appbar.dart';

class Transport extends StatefulWidget {
  @override
  _TransportState createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, "Phí vận chuyển"),
    );
  }
}
