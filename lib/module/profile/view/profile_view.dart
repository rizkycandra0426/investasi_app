import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/profile/widget/profile_clipath.dart';
import 'package:hyper_ui/shared/util/animation/animation.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text("profile"),
      //   actions: [],
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(height: 70.0),
                  CircleAvatar(
                    radius: 67.0,
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Rizky",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    "rizky@gmail.com",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ], // Tutup Column
              ),
            ),
            Positioned(
              top: 390,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  // horizontal: 10,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Container di-tap!");
                          },
                          child: Container(
                            width: 180,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 24,
                                  offset: Offset(0, 11),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Investasi.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Berita",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Container di-tap!");
                          },
                          child: Container(
                            height: 90,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 24,
                                  offset: Offset(0, 11),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Berita",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Investasi.png'),
                                        fit: BoxFit.cover,
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Container di-tap!");
                          },
                          child: Container(
                            width: 180,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 24,
                                  offset: Offset(0, 11),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Investasi.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "About Us",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(LoginView());
                          },
                          child: Container(
                            width: 180,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 24,
                                  offset: Offset(0, 11),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Logout",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Investasi.png'),
                                        fit: BoxFit.cover,
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
