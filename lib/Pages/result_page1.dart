import 'dart:convert';
import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:catalogapp/utils/networking.dart';
import 'package:url_launcher/url_launcher.dart';

var temp1 = "";
var hum1 = "";

class ResultShow1 extends StatefulWidget {
  const ResultShow1({Key? key}) : super(key: key);

  @override
  State<ResultShow1> createState() => _ResultShow1State();
}

class _ResultShow1State extends State<ResultShow1> {
  @override
  void initState() {
    getTempFromSheet();
    super.initState();
  }

  getTempFromSheet() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://script.google.com/macros/s/AKfycbyIy64fwmQbjtjb34CmIDdHyhZw-_jB60aPqdiZAq4g1bkje7oOfovZSDp81PRlHBU7/exec');
    var tempData = await networkHelper.getData();
    updateUI(tempData);
  }

  void updateUI(dynamic tempData) {
    temp1 = tempData[0]['Ftemp'].toString();
    hum1 = tempData[0]['Fhum'].toString();
    print(temp1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("LT 6"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Image.asset(
            //   "assets/images/result.png",
            //   scale: .55,
            // ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "The Temperature and",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "humidity in the room is : ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$temp1 °C',
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "$hum1%",
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.enterRoute);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
              ),
              child: const Text(
                "Check for another room",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                const url = 'https://forms.gle/WKDMPsw2PnET1KTA9';
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url),
                  mode: LaunchMode.externalApplication);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
              ),
              child: const Text(
                "Request for change",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.landingRoute);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
              ),
              child: const Text(
                "Back to Home",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    if (await canLaunchUrl(Uri.parse(urlString))) {
      await launchUrl(
        Uri.parse(urlString),
      );
    } else {
      print("Can't Launch URL");
    }
  }
}
