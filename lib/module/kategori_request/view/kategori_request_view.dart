import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class KategoriRequestView extends StatefulWidget {
  KategoriRequestView({Key? key}) : super(key: key);

  Widget build(context, KategoriRequestController controller) {
    controller.view = this;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Kategori Request",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: RequestClipPathClass(),
              child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 24,
                            offset: Offset(0, 11),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Nama kategori",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  showCursor: true,
                                  cursorColor: Colors.transparent,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                  ),
                                  onChanged: (value) {
                                    controller.namaKategori = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      height: 115,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 24,
                            offset: Offset(0, 11),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Kategori",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          QDropdownField(
                              label: "",
                              items: [
                                {
                                  "label": "Pemasukan",
                                  "value": "pemasukan",
                                },
                                {
                                  "label": "Pengeluaran",
                                  "value": "pengeluaran",
                                }
                              ],
                              onChanged: (value, label) {
                                controller.categoryType = value;
                              }),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 55,
                      width: 130,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Border radius 30
                          ),
                        ),
                        onPressed: () => controller.submit(),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                30), // Same as button's border radius
                          ),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            child: Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: SegmentedButton(
                        showSelectedIcon: false,
                        segments: const <ButtonSegment>[
                          ButtonSegment(
                            value: "Pending",
                            label: Text(
                              'Pending',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          ButtonSegment(
                            value: "Approved",
                            label: Text(
                              'Approved',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          ButtonSegment(
                            value: "Rejected",
                            label: Text(
                              'Rejected',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                        selected: {controller.status},
                        onSelectionChanged: (Set newSelection) {
                          controller.updateStatus(newSelection.first);
                        },
                      ),
                    ),
                    ListView.builder(
                      itemCount: controller.items.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = controller.items[index];
                        if (item['status'] != controller.status)
                          return Container();
                        return ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          title: Text(
                            item["nama_kategori"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          subtitle: Text(item["category_type"]),
                          trailing: Text(item["status"]),
                        );
                      },
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
  State<KategoriRequestView> createState() => KategoriRequestController();
}
