import 'package:firstapp/screens/aboutme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  late List countryData;

  fetchCountryData() async {

    http.Response response =
    await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Countries Stats',
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
      // ignore: unnecessary_null_comparison
      body: countryData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          countryData[index]['country'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Image.network(
                          countryData[index]['countryInfo']['flag'],
                          height: 50,
                          width: 60,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'CONFIRMED:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(countryData[index]['cases'].toString(),style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red),),
                            Text(
                              'ACTIVE:' +
                                  countryData[index]['active'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              'RECOVERED:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),),
                            Text(countryData[index]['recovered'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),),
                            Text(
                              'DEATHS:' +
                                  countryData[index]['deaths'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        // ignore: unnecessary_null_comparison
        itemCount: countryData.length,
      ),
    );
  }
}