import 'dart:async';
import 'dart:convert';
import 'package:firstapp/screens/aboutme.dart';
import 'package:firstapp/screens/regional_records.dart';

import 'package:firstapp/screens/world_wide_panal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('LOADING...',style: TextStyle(
                            fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold,
                          ),),
                        ],
                      )
                    ],
                  ),

                ),
              ),
            ],
          )
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map worldData;

  fatchworldData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/all'));
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fatchworldData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Covid Tracker App',
              style: TextStyle(fontFamily: 'Pacifico'),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutME()));
                  },
                  child: Icon(
                    Icons.account_box,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
              Text('App will be updated after every 24 hours',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Pacifico',
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                'WorldWide Stats',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              LinearProgressIndicator(
                  minHeight: 10.0,
                  color: Colors.green,
                  backgroundColor: Colors.red),
              // ignore: unnecessary_null_comparison
              if (worldData == null)
                CircularProgressIndicator()
              else
                WorldWidePanel(
                  worldData: worldData,
                ),
              LinearProgressIndicator(
                  minHeight: 10.0,
                  color: Colors.blue,
                  backgroundColor: Colors.grey[500]),
              SizedBox(
                height: 50,
              ),
              Text(
                'All Countries Stats here',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CountryPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                        child: Text(
                      'Click Here',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(155, 220, 0, 0),
                child: Text('By Atif Zaman Yousafzai'),
              )
            ])),
          )),
    );
  }
}
