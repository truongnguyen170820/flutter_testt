import 'package:flutter/material.dart';

class ViewImage extends StatefulWidget {
  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 360,
            color: Colors.pink,
            child: Image.asset(listImage[0].imageName),
          ),
          Container(
            height: 200,
            color: Colors.blueAccent,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 4),
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              primary: false,
              itemCount: listImage.length,
              itemBuilder: (context, index){
                return
                  Container(
                  height: 40,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.white,
                      border: Border.all(color: Colors.grey,width: 1)),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Hero(
                          tag: null,
                            child: Image.asset(listImage[index].imageName, fit: BoxFit.contain,),
                        )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class imageList{
  String imageName;

  imageList(this.imageName);
}
List<imageList> listImage =[
  imageList("assets/images/s1.png"),
  imageList("assets/images/s2.png"),
  imageList("assets/images/s1.png"),
  imageList("assets/images/s2.png"),
  imageList("assets/images/s1.png"),
];
