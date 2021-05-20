class DriverRequest {
  String zCONTENT;
  String zTIPCATEGORY;

  DriverRequest({this.zCONTENT, this.zTIPCATEGORY});

  DriverRequest.fromJson(Map<String, dynamic> json) {
    zCONTENT = json['ZCONTENT'];
    zTIPCATEGORY = json['ZTIPCATEGORY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ZCONTENT'] = this.zCONTENT;
    data['ZTIPCATEGORY'] = this.zTIPCATEGORY;
    return data;
  }
}
