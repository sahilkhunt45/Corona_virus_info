import 'package:flutter/material.dart';

class RecentCases extends StatefulWidget {
  const RecentCases({Key? key}) : super(key: key);

  @override
  State<RecentCases> createState() => _RecentCasesState();
}

class _RecentCasesState extends State<RecentCases> {
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
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${data.country}'s Cases"),
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
            Image.network("${data.flag}"),
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
                    "Today's Cases",
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${data.todaycases}",
                    style: numberStyle,
                  ),
                ],
              ),
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
                    "Today's Deaths",
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${data.todaydeaths}",
                    style: numberStyle,
                  ),
                ],
              ),
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
                    "Today's Recovered",
                    style: textStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${data.todayrecovered}",
                    style: numberStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
