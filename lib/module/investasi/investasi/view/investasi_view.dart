import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/investasi/investasi/widget/investasi_clippath.dart';
import '../controller/investasi_controller.dart';

class InvestasiView extends StatefulWidget {
  const InvestasiView({Key? key}) : super(key: key);

  Widget build(context, InvestasiController controller) {
    controller.view = this;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Rancangan Investasi",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ClipPath(
              clipper: InvestasiClipPathClass(),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 12.0,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: Container(
                          child: DefaultTabController(
                            length: 3,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          24.0,
                                        ),
                                      ),
                                    ),
                                    child: TabBar(
                                      indicator: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(25.0)),
                                      labelColor: Colors.white,
                                      unselectedLabelColor: Colors.blue,
                                      tabs: [
                                        Tab(
                                          text: "Lumpsum",
                                        ),
                                        Tab(
                                          text: "Bulanan",
                                        ),
                                        Tab(
                                          text: "Target",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: TabBarView(
                                        children: [
                                          LumpsumInvestasiView(),
                                          BulananInvestasiView(),
                                          TargetInvestasiView(),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<InvestasiView> createState() => InvestasiController();
}
