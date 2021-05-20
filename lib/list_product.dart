class Product {
  String imgUrl;
  String title;
  int quantily;
  int comments;
  double price;
  int likes;
  double oldPrice;
  int sale;
  String color;
  String size;
  String present;
  int number;
  Product(this.imgUrl, this.title, this.quantily, this.comments,this.price, this.likes,
      {this.oldPrice,this.sale, this.color, this.size, this.present, this.number = 1});
}

List<Product> listProduct = [
  Product('assets/images/s1.png', 'Coko Mặt nạ Coko Detox Bio Skin Mask Hộp 7', 1120,450,200000,3,oldPrice: 250000, sale: 20, color: "Màu đen", present: "Lấy bình lắc", size: "size L" ),
  Product('assets/images/s2.png', 'Sản phẩm chăm sóc da',505,350 ,1000000,5),
  Product('assets/images/s1.png', 'Sản phẩm chống nắng', 26,2,300000,4, color: "Màu đỏ", present: "Lấy bình nước", size: "size M", ),
  Product('assets/images/s2.png', 'thuốc bổ mắt',587,30 ,280000,1,oldPrice: 400000,sale: 30),
  Product('assets/images/s1.png', 'Mặt na đất sét tự nhiên',150,25 ,500000,2),
];