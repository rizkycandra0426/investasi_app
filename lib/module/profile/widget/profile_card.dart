import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashboardcontroller = DashboardController.instance;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        right: 28,
        left: 28,
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/card_new.png'), // Ganti dengan nama file gambar Anda
            fit: BoxFit.cover, // Atur gambar agar memenuhi container
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white24,
              blurRadius: 30,
              offset: Offset(0, 11),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(
              24.0,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                24.0,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Keuangan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${dashboardcontroller.balance.currency}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Portofolio",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Text(
                                // "${StockNewService.getAllStockValuationsTotal(now.year)}",
                                "${TRX.getCurrentFloatingReturn(now.year).number}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                // "${StockNewService.getYieldInPercent(now.year)}%",
                                "${TRX.getLastYield(now.year).percentage}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
