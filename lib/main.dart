import 'package:corono_virus_cases_info/screens/cases_info.dart';
import 'package:corono_virus_cases_info/screens/homepage.dart';
import 'package:corono_virus_cases_info/screens/recentcondition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => const HomePage(),
        'cases': (context) => const CasesInfoPage(),
        'recent': (context) => const RecentCases(),
      },
    ),
  );
}
