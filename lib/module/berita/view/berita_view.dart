import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class BeritaView extends StatefulWidget {
  const BeritaView({Key? key}) : super(key: key);

  Widget build(context, BeritaController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 34, left: 0), // Atur margin atas sesuai kebutuhan
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
                SizedBox(width: 100),
                Container(
                  margin: EdgeInsets.only(top: 33),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Berita",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.items.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var item = controller.items[index];

                  return InkWell(
                    onTap: () async {
                      Get.to(BeritaWebView(url: item["url"]));
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 160.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    item["image"] ??
                                        "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        item["publisher_name"] ?? "-",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        DateTime.parse(item["created_at"]!).yMd,
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    item["title"] ?? "-",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(item["url"]));
                                    },
                                    child: Text(
                                      "Read more",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<BeritaView> createState() => BeritaController();
}
