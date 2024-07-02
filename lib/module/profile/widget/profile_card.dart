import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/controller/dashboard_controller.dart';
import 'package:hyper_ui/module/saham/portofolio/controller/portofolio_controller.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashboardcontroller = DashboardController.instance;
    var portofoliocontroller = PortofolioController.instance;

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
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                24.0,
              ),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                          "${NumberFormat().format(dashboardcontroller.balance)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Portofolio",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "${portofoliocontroller.floatingReturn}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "(${portofoliocontroller.portoYield})",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
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
