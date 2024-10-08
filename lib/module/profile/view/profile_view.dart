import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

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
        // actions: [
        //   IconButton(
        //     iconSize: 28,
        //     icon: Icon(Icons.web), // Icon yang ingin ditambahkan
        //     onPressed: () {
        //       // Navigator.push(
        //       //   context,
        //       //   MaterialPageRoute(
        //       //     builder: (context) => StockDetailView(),
        //       //   ),
        //       // );
        //     },
        //   ),
        // ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ClipPath(
              clipper: ProfileCardClipPath(),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/robot.png'),
                      backgroundColor:
                          Colors.white, // Ganti dengan path gambar Anda
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
                  ],
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: ProfileCard(),
            ),
            Positioned(
              top: 420,
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
              top: 450,
              left: 20,
              right: 20,
              bottom: 0,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    Material(
                      elevation: 5, // Atur tinggi material untuk efek melayang
                      borderRadius: BorderRadius.circular(
                          12), // Atur radius sudut material
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 20),
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.list),
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
                    SizedBox(height: 5),
                    Material(
                      elevation: 5, // Atur tinggi material untuk efek melayang
                      borderRadius: BorderRadius.circular(
                          12), // Atur radius sudut material
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
                    SizedBox(height: 5),
                    Material(
                      elevation: 5, // Atur tinggi material untuk efek melayang
                      borderRadius: BorderRadius.circular(
                          12), // Atur radius sudut material
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 20),
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.mode_edit),
                        minLeadingWidth: 0.0,
                        title: Text("Request Kategori"),
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
                      borderRadius: BorderRadius.circular(
                          12), // Atur radius sudut material
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
                    SizedBox(height: 5), // Spasi antara ListTile
                    Material(
                      elevation: 5, // Atur tinggi material untuk efek melayang
                      borderRadius: BorderRadius.circular(
                          12), // Atur radius sudut material
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
                          onTap: () => controller.logout()),
                    ),
                    SizedBox(height: 5), // Spasi antara ListTile
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
  State<ProfileView> createState() => ProfileController();
}
