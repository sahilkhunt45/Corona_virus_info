import 'package:corono_virus_cases_info/helper/corona_helper.dart';
import 'package:corono_virus_cases_info/modals/corona.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Corona> getCasesData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getCasesData =CoronaHelper.coronaHelper.fetchAllCasesRecordsData() as Future<Corona>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Corona Cases"),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.6),
        leading: const Icon(
          Icons.coronavirus,
          color: Colors.white,
          size: 40,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getCasesData,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Corona>? data = snapshot.data;
                  return ListView.builder(
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: true,
                    padding: const EdgeInsets.all(5),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data?.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 15,
                        child: ListTile(
                          minLeadingWidth: 20,
                          autofocus: true,
                          enabled: true,
                          visualDensity: VisualDensity.standard,
                          style: ListTileStyle.list,
                          contentPadding: const EdgeInsets.all(20),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('cases', arguments: data![i]);
                          },
                          title: Text(
                            data![i].country,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: const Text(
                            "Nation",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          leading: SizedBox(
                            height: 120,
                            width: 90,
                            child: Image.network(
                              data[i].flag,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                }
                return const Center(
                  child:  CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
