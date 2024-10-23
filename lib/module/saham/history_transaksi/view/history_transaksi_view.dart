import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class HistoryTransaksiView extends StatefulWidget {
  final String emiten;
  const HistoryTransaksiView({
    Key? key,
    required this.emiten,
  }) : super(key: key);

  Widget build(context, HistoryTransaksiController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "History Transaksi",
            style: TextStyle(fontSize: 16),
          ),
        ),
        actions: [
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.insert_chart), // Icon yang ingin ditambahkan
            onPressed: () async {
              var res = await StockService().get(
                param: {
                  "emiten": emiten,
                },
              );
              var stock = res["data"][0];
              Get.to(StockDetailView(
                stock: stock,
              ));
            },
          ),
        ],
      ),
      body: controller.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.histories.length,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.histories[index];

                bool isBeli = item["id_portofolio_beli"] != null;
                bool isJual = !isBeli;

                int price = 0;
                String volume = "0";
                DateTime? date;
                // String penjualanOrPembelian = "";
                String total = "";
                if (isBeli) {
                  price = item["harga_beli"];
                  volume = item["volume_beli"].toString();
                  // penjualanOrPembelian = item["harga_total"].toString();
                  total = item["pembelian"].toString();
                  date = DateTime.parse(item["tanggal_beli"]);
                } else {
                  price = item["harga_jual"];
                  volume = item["volume_jual"].toString();
                  // penjualanOrPembelian = item["harga_total"].toString();
                  total = item["penjualan"].toString();
                  date = DateTime.parse(item["tanggal_jual"]);
                }

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${emiten}",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            isBeli ? "BELI" : "JUAL",
                            style: TextStyle(
                              color: isJual ? Colors.red : Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Harga",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "${price}",
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Volume ",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "${volume}",
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Tanggal",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "${date.dMMMy}",
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10), // Spasi antara dua Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Expanded(
                              //   child: Container(
                              //     margin: EdgeInsets.symmetric(horizontal: 10),
                              //     child: Column(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.center,
                              //       children: [
                              //         Text(
                              //           "Pembelian",
                              //           style: TextStyle(
                              //             color: Colors.black87,
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.w900,
                              //           ),
                              //         ),
                              //         SizedBox(height: 3),
                              //         Text(
                              //           "${penjualanOrPembelian}",
                              //           style: TextStyle(
                              //             color: Colors.grey[800],
                              //             fontSize: 12,
                              //             fontWeight: FontWeight.w700,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // Expanded(
                              //   child: Container(
                              //     margin: EdgeInsets.symmetric(horizontal: 10),
                              //     child: Column(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.center,
                              //       children: [
                              //         Text(
                              //           "Fee",
                              //           style: TextStyle(
                              //             color: Colors.black87,
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.w900,
                              //           ),
                              //         ),
                              //         SizedBox(height: 3),
                              //         Text(
                              //           "0,25%",
                              //           style: TextStyle(
                              //             color: Colors.grey[800],
                              //             fontSize: 12,
                              //             fontWeight: FontWeight.w700,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "${total}",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
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
                );
              },
            ),
    );
  }

  @override
  State<HistoryTransaksiView> createState() => HistoryTransaksiController();
}
