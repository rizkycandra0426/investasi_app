import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/widget/dio_list/list_view.dart';
import '../controller/stock_controller.dart';

class StockView extends StatefulWidget {
  const StockView({Key? key}) : super(key: key);

  Widget build(context, StockController controller) {
    controller.view = this;
    final StockController _controller = StockController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                initialValue: controller.search,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  suffixIcon: InkWell(
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    focusColor: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Search',
                ),
                onChanged: (value) {},
                onFieldSubmitted: (value) {
                  controller.updateSearch(value);
                },
              ),
            ),
            Expanded(
              child: QListView(
                key: Key("st0ck_${controller.search}"),
                endpoint: "stock",
                search: controller.search,
                itemBuilder: (item, index) {
                  return InkWell(
                    onTap: () => Get.to(StockDetailView(
                      stock: Map<String, dynamic>.from(item),
                    )),
                    child: Card(
                      color: Colors.grey[50],
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${item['nama_saham']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25,
                                      color: Colors.redAccent[400],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    child: Text(
                                      '${item["nama_perusahaan"]}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Image.network(
                              item["pic"] ??
                                  "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                              width: 40,
                              height: 40,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                                  width: 40,
                                  height: 40,
                                );
                              },
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
  State<StockView> createState() => StockController();
}
