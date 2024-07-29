import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pencatatan_keuangan/dashboard/view/dashboard_view.dart';

class MainNavigationView extends StatefulWidget {
  MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    List<Widget> pages = [
      DashboardView(),
      StatistikDashboardView(),
      DashboardInvestasiView(),
      ProfileView(),
    ];
    List<Map<String, dynamic>> menus = [
      {
        "icon": Icons.home,
        "label": "Home",
      },
      {
        "icon": Icons.incomplete_circle,
        "label": "Order",
      },
      {
        "icon": Icons.analytics,
        "label": "Favorite",
      },
      {
        "icon": Icons.person,
        "label": "Profile",
      }
    ];

    return DefaultTabController(
      length: pages.length,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: controller.selectedIndex,
              children: pages,
            ),
            //Preload screens
            Transform.scale(
              scale: 0.0,
              // child: PortofolioView(),
              child: PortofolioNewView(),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: primaryColor,
          padding: const EdgeInsets.all(0.0),
          shape: CircularNotchedRectangle(), // Membuat notch
          child: Container(
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(menus.length, (index) {
                var item = menus[index];
                bool selected = index == controller.selectedIndex;
                if ((menus.length / 2).floor() == index) {}

                return Expanded(
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 400),
                    scale: selected ? 1.2 : 1.0,
                    child: IconButton(
                      onPressed: () => controller.updateIndex(index),
                      icon: Icon(
                        item["icon"],
                        color: selected
                            ? Colors.white
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        floatingActionButton: Container(
          child: FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              Get.offAll(TransaksiKeuanganView());
            },
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
