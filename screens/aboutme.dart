import 'package:flutter/material.dart';

class AboutME extends StatelessWidget {
  const AboutME({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      backgroundColor: Colors.white,
     body: Center(
       child: Padding(
         padding: const EdgeInsets.all(50.0),
         child: Column(
           children: [
             CircleAvatar(
               radius: 70,
               backgroundImage: 
               AssetImage('images/profileimage.jpg'),
             ),
             SizedBox(
               height: 20,
             ),
             Text('Atif Zaman Yousafzai',style: TextStyle(
               fontSize: 24,fontWeight: FontWeight.bold
             ),),
             Divider(
               thickness: 2,
             ),
             Text('Beginner Flutter Developer',style: TextStyle(
               fontFamily: 'Pacifico',fontSize: 18
             ),),
             SizedBox(
               height: 10,
             ),
             Divider(
               height: 1,
             ),
             SizedBox(
               height: 15,
             ),
             Text('Every master was once a beginner.\nEvery pro was once an amateur.',style: TextStyle(
                 fontSize: 15
             ),),
             Text('—Robin S. Sharma'),
             SizedBox(
               height: 10,
             ),
             Divider(
               height: 1,
               thickness: 2,
             )
           ],
         ),
       ),
     ),
    );

  }
}
