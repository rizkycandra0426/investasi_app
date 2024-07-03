import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/histori_tahunan_controller.dart';

class HistoriTahunanView extends StatefulWidget {
  const HistoriTahunanView({Key? key}) : super(key: key);

  Widget build(context, HistoriTahunanController controller) {
    controller.view = this;
    final screenHeight = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Historitahunan"),
          actions: const [],
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: screenHeight * 0.18,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  color: Colors.white,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5.0),
                          ),
                          Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HistoriDetailView(
                                        // emiten: item["emiten"],
                                        ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Equity',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                // Text(
                                                //     "${controller.floatingReturn}")
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Harga/Unit",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                // Text("${controller.portoYield}")
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Jumlah/Unit",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                // Text("${controller.ihsg}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'floating return',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                // Text(
                                                //     "${controller.floatingReturn}"
                                                //     ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Yield",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                // Text("${controller.portoYield}")
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "IHSG",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                // Text("${controller.ihsg}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<HistoriTahunanView> createState() => HistoriTahunanController();
}
