import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class Jualwidget extends StatefulWidget {
  const Jualwidget({Key? key}) : super(key: key);

  @override
  State<Jualwidget> createState() => _JualwidgetState();
}

class _JualwidgetState extends State<Jualwidget> {
  ValueNotifier<int> lot = ValueNotifier(1);
  ValueNotifier<int> total = ValueNotifier(1);
  ValueNotifier<bool> volumeCukup = ValueNotifier(false);

  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  int sisaVolume = 0;
  getData() async {
    var controller = StockDetailController.instance;
    var value = controller.data?.response?.data?.results?.first;

    sisaVolume = await PortofolioJualService()
        .getSisaVolume(controller.view.stock["id_saham"]);
    lot.value = sisaVolume;
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return Container();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      onPressed: () {
        _showSimpleModalDialog(context);
      },
      child: Text(
        'JUAL',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _showSimpleModalDialog(BuildContext context) {
    var controller = StockDetailController.instance;
    var value = controller.data?.response?.data?.results?.first;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ValueListenableBuilder(
              valueListenable: total,
              builder: (context, _, __) {
                return Container(
                  constraints: BoxConstraints(maxHeight: 400),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Wrap(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'JUAL',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    20), // Jarak antara judul dan konten lainnya
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('Fee Jual'),
                                    Text(
                                      '0,25',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    width:
                                        8), // Jarak antara teks dan kontainer pertama
                                Expanded(
                                  // Kontainer pertama
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Harga Jual'),
                                      // Jarak antara teks dan kontainer
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 80,
                                              alignment: Alignment.center,
                                              child: Text(
                                                '${value?.close}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        8), // Jarak antara kontainer pertama dan kontainer kedua
                                Expanded(
                                  // Kontainer pertama
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Tanggal Jual'),
                                      // Jarak antara teks dan kontainer
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              DateTime.now().yMd,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Volume Lembar Jual'),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height:
                                                  5), // Spasi antara tombol dan TextFormField
                                          Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: TextFormField(
                                              initialValue:
                                                  lot.value.toString(),
                                              textAlign: TextAlign.center,
                                              showCursor: true,
                                              cursorColor: Colors.transparent,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.transparent,
                                              ),
                                              onFieldSubmitted: (value) async {
                                                lot.value = int.tryParse(
                                                        value.toString()) ??
                                                    0;

                                                try {
                                                  showLoading();
                                                  var response =
                                                      await PortofolioJualService()
                                                          .create(
                                                    {
                                                      "id_saham": controller
                                                          .view
                                                          .stock["id_saham"],
                                                      "tanggal_jual":
                                                          DateTime.now().yMd,
                                                      "volume_jual": lot.value,
                                                      "action": "READ",
                                                    },
                                                  );

                                                  total.value =
                                                      response["penjualan"];

                                                  if (response["volume_cukup"]
                                                          .toString() ==
                                                      "false") {
                                                    volumeCukup.value = false;
                                                  } else {
                                                    volumeCukup.value = true;
                                                  }

                                                  print(response);
                                                  print(
                                                      "Bisa beli saham ${volumeCukup.value}");
                                                  hideLoading();
                                                } on Exception catch (err) {
                                                  hideLoading();
                                                  print(err);
                                                  print(
                                                      "Tidak bisa  beli saham");
                                                  se("Tidak bisa menjual lebih dari volume yang dimiliki");
                                                  volumeCukup.value = false;
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Total Penjualan'),
                                    if (volumeCukup.value == false) ...[
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        "Lot melebihi volume yang dimiliki",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                    ],
                                    Container(
                                      width: 200,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${total.value.currency}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(200, 20),
                                  // shape: StadiumBorder(),
                                  backgroundColor: volumeCukup.value
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () async {
                                  if (volumeCukup.value == false) return;

                                  try {
                                    showLoading();
                                    var response =
                                        await PortofolioJualService().create(
                                      {
                                        "id_saham":
                                            controller.view.stock["id_saham"],
                                        "tanggal_jual": DateTime.now().yMd,
                                        "volume_jual": lot.value,
                                        "action": "SELL",
                                      },
                                    );

                                    total.value =
                                        response["portofolioJual"]["penjualan"];

                                    print(response);
                                    print("Bisa jual saham");
                                    hideLoading();
                                    Get.back();
                                    ss("Berhasil menjual!");
                                  } on Exception catch (err) {
                                    hideLoading();
                                    print(err);
                                    print("Tidak bisa menjual saham");
                                    Get.back();
                                    se("Tidak bisa menjual saham");
                                  }
                                },
                                child: Text(
                                  'jual',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors
                                          .white), // Gaya teks untuk tombol
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
