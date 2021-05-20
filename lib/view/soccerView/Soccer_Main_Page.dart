
import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/color_utils.dart';
import 'package:flutter_testt/utils/custom_appbar.dart';
import 'package:flutter_testt/utils/global.dart';
import 'package:flutter_testt/view/soccerView/play_soccer_page.dart';
import 'package:flutter_testt/view/soccerView/test/show_list_soccer.dart';
import 'package:flutter_testt/widget/custombutton.dart';
import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart' as parser;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
// import 'package:static_dom/static_dom.dart' as dom;

class SoccerMain extends StatefulWidget {

  final Bongda bongda;

  const SoccerMain({Key key, this.bongda}) : super(key: key);
  @override
  _SoccerMainState createState() => _SoccerMainState();
}

class _SoccerMainState extends State<SoccerMain> {

  List<String> title = List();
  List<String> post = List();
  List<String> link = List();

  void _getDataFormWed() async{
    final response = await http.get("https://xembongda.pro/tin-tuc.html/");
    dom.Document document = parser.parse(response.body);
    final link2 = document.getElementsByClassName('list_main_news');
    final elements = document.getElementsByClassName("item_post row");

    setState(() {
      // title = elements.map((e) => e.getElementsByTagName('a')[0].innerHtml).toList();
    });
  }

  List<Bongda> listBongda = [];

  TextEditingController _doi1Ctrl;
  TextEditingController _tysoCtrl;
  TextEditingController _doi2Ctrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFormWed();
    _doi1Ctrl = TextEditingController();
    _tysoCtrl = TextEditingController();
    _doi2Ctrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Bóng đá"),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.fiber_new_outlined),
              ),
              Tab(
                icon: Icon(Icons.score),
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              tabHome(),
              newSpaper(),
              addList(widget.bongda),
            ],
          ),
        ),
      ),
    );
  }
  Widget tabHome() {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return itemHome();
        });
  }
  Widget itemHome() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(border: Border.all(color: ColorUtils.gray2, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/logo1.png",
                width: 70,
                height: 70,
              ),
              Text("Barcelona")
            ],
          ),
          Column(
            children: [
              Text("15:30 04/14",
                  style: TextStyle(
                      fontSize: setSp(15), fontWeight: FontWeight.bold)),
              Text("champion",
                  style:
                      TextStyle(fontSize: setSp(12), color: ColorUtils.gray3)),
           SizedBox(height: setHeight(10)),
           ButtonCustom(
             width: setWidth(100),
             height: setHeight(40),
             borderRadius: 5,
             title: "Xem",
             textStyle: TextStyle(color: ColorUtils.WHITE_TEXT),
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => PlaySoccer()));
             },
           )
            ],
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/logo2.png",
                width: 70,
                height: 70,
              ),
              Text("Real Madrid")
            ],
          ),
        ],
      ),
    );
  }
  Widget newSpaper(){
    return ListView.builder(
        itemBuilder: (context, index){
      return Container(
        padding: EdgeInsets.all(10),
        decoration:
        BoxDecoration(border: Border.all(color: ColorUtils.gray2, width: 1)),
        child: Row(
          children: [
            Image.asset("assets/images/logo1.png", width: 50),
            SizedBox(width: setWidth(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: setWidth(270),
                    child: Text("Fan MU cãi nhau việc Lukaku ăn đứt  Rashford và Martial", maxLines: 2, overflow: TextOverflow.clip, style: TextStyle(
                      color: ColorUtils.gray2, fontWeight: FontWeight.w600
                    ),)),
                Container(
                  width: setWidth(270),
                  child: Text("Sau khi MU để đội đứng thứ 19 NHA cầm hòa, còn Lukaku rực sáng giúp Inter  Milan có chiến thắng. Các CĐV của MU bắt đầu đem Lukaku so sánh với  Rashford và Martial.",
                    style: TextStyle(fontSize: setSp(12)),overflow: TextOverflow.visible,
                  ),
                )
              ],
            )
          ],
        ),
      );
    });

  }
  Widget addList(Bongda bongda1){
    return Column(
      children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Container(
             width: 100,
             decoration: BoxDecoration(
                 border: Border.all(width: 1, color: ColorUtils.gray6)
             ),
             child: TextField(
               controller: _doi1Ctrl,
               textAlign: TextAlign.center,
               decoration: InputDecoration(
                   hintText: "Đội 1"
               ),
             ),
           ),
           Container(
             width: 100,
             decoration: BoxDecoration(
                 border: Border.all(width: 1, color: ColorUtils.gray6)
             ),
             child: TextField(
               controller: _tysoCtrl,
               textAlign: TextAlign.center,
               decoration: InputDecoration(
                   hintText: "Tỷ số"
               ),
             ),
           ),
           Container(
             width: 100,
             decoration: BoxDecoration(
                 border: Border.all(width: 1, color: ColorUtils.gray6)
             ),
             child: TextField(
               controller: _doi2Ctrl,
               textAlign: TextAlign.center,
               decoration: InputDecoration(
                   hintText: "Đội 2"
               ),
             ),
           ),
         ],
       ),
        SizedBox(height: 20),
        ButtonCustom(
          onTap: (){
            listBongda.add(Bongda(_doi1Ctrl.text, _doi2Ctrl.text, tyso: _tysoCtrl.text));
            setState(() {
            });
          },
          title: "ADD",
        ),
        SizedBox(height: 10),
        Expanded(child: ListView.builder(
            itemCount: listBongda.length,
            itemBuilder: (context, index){
          return itemSoccer(listBongda[index]);
        }))
      ],
    );
  }
  Widget itemSoccer(Bongda bongda){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: ColorUtils.gray6, width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Text(bongda.name1Soccer),
          Text(bongda.tyso??""),
          Text(bongda.name2Soccer),
        ],
      ),
    );
  }
}
class Bongda{
  String name2Soccer;
  String name1Soccer;
  String tyso;

  Bongda(this.name1Soccer, this.name2Soccer, {this.tyso});
}
