import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/profile/widget/profile_card.dart';
import 'package:hyper_ui/module/profile/widget/profile_clippath.dart';

import 'package:hyper_ui/shared/util/animation/animation.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "PROFILE",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ClipPath(
              clipper: ProfileCardClipPath(),
              child: Container(
                height: 340,
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                      ),
                    ),
                    SizedBox(height: 10), // Spasi antara CircleAvatar dan teks
                    Text(
                      "Rizky",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Montserrat",
                          color: Colors.white),
                    ),
                    SizedBox(height: 5), // Spasi antara nama dan email
                    Text(
                      "rizky@gmail.com",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 340,
              left: 0,
              right: 0,
              child: ProfileCard(),
            ),
            Positioned(
              top: 470,
              left: 20,
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Positioned(
              top: 500,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Material(
                    elevation: 5, // Atur tinggi material untuk efek melayang
                    borderRadius:
                        BorderRadius.circular(12), // Atur radius sudut material
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      visualDensity: VisualDensity.compact,
                      leading: Icon(Icons.notifications),
                      minLeadingWidth: 0.0,
                      title: Text("Berita"),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 24.0,
                      ),
                      onTap: () => Get.to(BeritaView()),
                      tileColor: Colors.white70
                          .withOpacity(0.3), // Warna untuk ListTile
                    ),
                  ),
                  SizedBox(height: 5), // Spasi antara ListTile
                  Material(
                    elevation: 5, // Atur tinggi material untuk efek melayang
                    borderRadius:
                        BorderRadius.circular(12), // Atur radius sudut material
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      visualDensity: VisualDensity.compact,
                      leading: Icon(Icons.info),
                      minLeadingWidth: 0.0,
                      title: Text("About Us"),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 24.0,
                      ),
                      onTap: () => Get.to(AboutUsView()),
                      tileColor: Colors.white70
                          .withOpacity(0.3), // Warna untuk ListTile
                    ),
                  ),
                  SizedBox(height: 5), // Spasi antara ListTile
                  Material(
                    elevation: 5, // Atur tinggi material untuk efek melayang
                    borderRadius:
                        BorderRadius.circular(12), // Atur radius sudut material
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      visualDensity: VisualDensity.compact,
                      leading: Icon(Icons.logout),
                      minLeadingWidth: 0.0,
                      title: Text("Logout"),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 24.0,
                      ),
                      onTap: () => controller.logout(),
                      tileColor: Colors.white70
                          .withOpacity(0.3), // Warna untuk ListTile
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
