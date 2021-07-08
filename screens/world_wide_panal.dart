import 'package:flutter/material.dart';



class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key? key, required this.worldData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
            title: ('CONFIRMED'),
            panelColor: Colors.red,
            textColor: Colors.white,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(title: ('ACTIVE CASES'),
            panelColor: Colors.blue,
            textColor: Colors.white,
            count: worldData['active'].toString(),
          ),
          StatusPanel(title: ('RECOVERED'),
            panelColor: Colors.green,
            textColor: Colors.white,
            count: worldData['recovered'].toString(),),
          StatusPanel(title: ('DEATHS'),
            panelColor: Colors.grey,
            textColor: Colors.white,
            count: worldData['deaths'].toString(),),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key? key, required this.panelColor, required this.textColor, required this.title, required this.count}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return

      Container(
      margin: EdgeInsets.all(5),
      height: 80,
      width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text((title),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor),),
          Text((count),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
          color: textColor),),
        ]
      )
    );
}
}

