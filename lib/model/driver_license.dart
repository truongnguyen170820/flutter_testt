class DriverLicense {
  String zNAME;
  String zTIPTYPE;
  String zPK;

  DriverLicense({this.zNAME, this.zTIPTYPE, this.zPK});

  DriverLicense.fromJson(Map<String, dynamic> json) {
    zNAME = json['ZNAME'];
    zTIPTYPE = json['ZTIPTYPE'];
    zPK = json['Z_PK'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ZNAME'] = this.zNAME;
    data['ZTIPTYPE'] = this.zTIPTYPE;
    data['Z_PK'] = this.zPK;
    return data;
  }
}