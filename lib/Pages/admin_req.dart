import 'package:flutter/material.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:catalogapp/utils/networking.dart';
import 'package:url_launcher/url_launcher.dart';

var froom = "";
var freq = "";

class AdminReq extends StatefulWidget {
  const AdminReq({Key? key}) : super(key: key);

  @override
  State<AdminReq> createState() => _AdminReqState();
}

class _AdminReqState extends State<AdminReq> {
  @override
  void initState() {
    getReqFromSheet();
    super.initState();
  }

  getReqFromSheet() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://script.googleusercontent.com/macros/echo?user_content_key=9kZdM_nbfdeUYxJm7LoXd2tKlS9d35foK1oKx1X568CDtjiRJsCxhIHqyRXANwdk2taoGuaNHwkkvedKQowo1PUN9q3E7mFNm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnK0RLA2QMvcnmU5iTDf1Mn_pv5-j-bWF8aRAuhIe1VYHBS7MrI_MTTuL6f9Kb0s7qOc4j9qy9A52ZDJYjyA2yRVgweUhqjzcNdz9Jw9Md8uu&lib=MUjgZYJM7LHbfvm-6eQOoEGDYpHFTgkH9');
    var reqData = await networkHelper.getData();
    updateUI(reqData);
  }

  void updateUI(dynamic reqData) {
    froom = reqData[0]['droom'].toString();
    freq = reqData[0]['dfeed'].toString();
    print(froom);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Requests"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/haaal.jpg'),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'The Latest Change Request is :',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Room No: $froom',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'Request: $freq',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                const url =
                    'https://docs.google.com/spreadsheets/d/1WUiQldYjNcB6KMpozvp5P_xw-IrueezLrSIsQ7Mlzdo/edit?resourcekey=undefined#gid=1580194059';
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url),
                      mode: LaunchMode.externalApplication);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 45),
              ),
              child: const Text(
                "View all Requests",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.adminLandRoute);
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
