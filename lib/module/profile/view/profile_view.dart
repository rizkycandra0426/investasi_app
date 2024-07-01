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
          child: Padding(
            padding:
                const EdgeInsets.only(left: 48), // Atur jarak sesuai kebutuhan
            child: Text(
              "PROFILE",
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Montserrat",
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            iconSize: 28,
            icon: Icon(Icons.web), // Icon yang ingin ditambahkan
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => StockDetailView(),
              //   ),
              // );
            },
          ),
        ],
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
                    SizedBox(height: 90),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/robot.png'), // Ganti dengan path gambar Anda
                    ),
                    SizedBox(height: 10), // Spasi antara CircleAvatar dan teks
                    Text(
                      "${currentUser!.name}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Montserrat",
                          color: Colors.white),
                    ),
                    SizedBox(height: 5), // Spasi antara nama dan email
                    Text(
                      "${currentUser!.email}",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 100,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.logout();
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 335,
              left: 0,
              right: 0,
              child: ProfileCard(),
            ),
            Positioned(
              top: 450,
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
              top: 480,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  GestureDetector(
                    onLongPress: () async {
                      dio.get(
                          "$baseUrl/notification?title=Ada%20berita%20baru,%20yuk%20kita%20cek!&message=Ada%20berita%20baru,%20yuk%20kita%20cek!");
                    },
                    child: Material(
                      elevation: 5, // Atur tinggi material untuk efek melayang
                      borderRadius: BorderRadius.circular(
                          12), // Atur radius sudut material
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 20),
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.new_releases),
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
                  ),
                  SizedBox(height: 5), // Spasi antara ListTile
                  Material(
                    elevation: 5, // Atur tinggi material untuk efek melayang
                    borderRadius:
                        BorderRadius.circular(12), // Atur radius sudut material
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 20),
                      visualDensity: VisualDensity.compact,
                      leading: Icon(Icons.notifications),
                      minLeadingWidth: 0.0,
                      title: Text("Notifikasi"),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 24.0,
                      ),
                      onTap: () => Get.to(NotifikasiView()),
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
                      leading: Icon(Icons.mode_edit),
                      minLeadingWidth: 0.0,
                      title: Text("Kategori Request"),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 24.0,
                      ),
                      onTap: () => Get.to(KategoriRequestView()),
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
                      leading: Icon(Icons.attach_money),
                      minLeadingWidth: 0.0,
                      title: Text("Harga Dividen & Kurs"),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 24.0,
                      ),
                      onTap: () => Get.to(HargaDividenView()),
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
