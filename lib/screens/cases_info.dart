import 'package:flutter/material.dart';

class CasesInfoPage extends StatefulWidget {
  const CasesInfoPage({Key? key}) : super(key: key);

  @override
  State<CasesInfoPage> createState() => _CasesInfoPageState();
}

class _CasesInfoPageState extends State<CasesInfoPage> {
  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
    fontStyle: FontStyle.italic,
  );
  TextStyle numberStyle = const TextStyle(
    fontSize: 20,
    color: Colors.grey,
    fontStyle: FontStyle.italic,
  );
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${res.country}'s Cases"),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.6),
        actions: const [
          Icon(
            Icons.coronavirus,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("${res.flag}"),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                backgroundBlendMode: BlendMode.colorBurn,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Cases",
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${res.cases}",
                    style: numberStyle,
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    backgroundBlendMode: BlendMode.colorBurn,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Deaths",
                        style: textStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${res.deaths}",
                        style: numberStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    backgroundBlendMode: BlendMode.colorBurn,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Recovered",
                        style: textStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${res.recovered}",
                        style: numberStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    backgroundBlendMode: BlendMode.colorBurn,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Critical",
                        style: textStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${res.critical}",
                        style: numberStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    backgroundBlendMode: BlendMode.colorBurn,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Tests",
                        style: textStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${res.tests}",
                        style: numberStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                backgroundBlendMode: BlendMode.colorBurn,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Population",
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${res.population}",
                    style: numberStyle,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('recent', arguments: res);
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
                primary: const Color(0xffd8f6fa),
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 15, bottom: 15),
                elevation: 7,
                enableFeedback: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Recent Condition",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
