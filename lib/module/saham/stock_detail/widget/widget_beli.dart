import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/portofolio_beli_service.dart';
import 'package:hyper_ui/state_util.dart';

class Beliwidget extends StatefulWidget {
  const Beliwidget({Key? key}) : super(key: key);

  @override
  State<Beliwidget> createState() => _BeliwidgetState();
}

class _BeliwidgetState extends State<Beliwidget> {
  ValueNotifier<int> lot = ValueNotifier(1);
  ValueNotifier<int> total = ValueNotifier(1);
  ValueNotifier<bool> saldoCukup = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      onPressed: () {
        _showSimpleModalDialog(context);
      },
      child: Text(
        'BELI',
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
                  constraints: BoxConstraints(maxHeight: 380),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'BELI SAHAM',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Center(
                          child: BalanceWidget(
                            enableTopup: false,
                          ),
                        ),
                        SizedBox(
                            height:
                                20), // Jarak antara judul dan konten lainnya
                        Row(
                          children: [
                            Column(
                              children: [
                                Text('Fee Beli'),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Harga Beli'),
                                  // Jarak antara teks dan kontainer
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(8.0),
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
                                            '${value?.open}',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tanggal Beli'),
                                  // Jarak antara teks dan kontainer
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 80,
                                          child: Text(
                                            DateTime.now().yMd,
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
                          ],
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Total Pembelian'),
                                  if (saldoCukup.value == false) ...[
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Text(
                                      "Saldo tidak mecukupi",
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${total.value.currency}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Volume Lot Beli : ${lot.value}'),
                                  Container(
                                    width: 200,
                                    height: 40,
                                    // padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            initialValue: '${lot.value}',
                                            textAlign: TextAlign.center,
                                            showCursor: true,
                                            cursorColor: Colors.transparent,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                            ),
                                            onChanged: (value) {
                                              lot.value = int.tryParse(
                                                      value.toString()) ??
                                                  0;
                                              printr(
                                                  "Lot value berubah jadi ${lot.value}");
                                            },
                                            onFieldSubmitted: (value) async {
                                              lot.value = int.tryParse(
                                                      value.toString()) ??
                                                  0;

                                              try {
                                                showLoading();
                                                var response =
                                                    await PortofolioBeliService()
                                                        .create(
                                                  {
                                                    "id_saham": value,
                                                    "tanggal_beli":
                                                        DateTime.now().yMd,
                                                    "volume_beli": lot.value,
                                                    "action": "READ",
                                                  },
                                                );

                                                total.value =
                                                    response["pembelian"];

                                                if (response["saldo_cukup"] ==
                                                    true) {
                                                  saldoCukup.value = true;
                                                } else {
                                                  saldoCukup.value = false;
                                                }

                                                print(response);
                                                print("Bisa beli saham");
                                                hideLoading();
                                              } on Exception catch (err) {
                                                hideLoading();
                                                print(err);
                                                print("Tidak bisa  beli saham");
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 20),
                              // shape: StadiumBorder(),
                              backgroundColor:
                                  saldoCukup.value ? Colors.green : Colors.grey,
                            ),
                            onPressed: () async {
                              if (saldoCukup.value == false) return;

                              try {
                                showLoading();
                                var response =
                                    await PortofolioBeliService().create(
                                  {
                                    "id_saham":
                                        controller.view.stock['id_saham'],
                                    "tanggal_beli": DateTime.now().yMd,
                                    "volume_beli": lot.value,
                                    "action": "BUY",
                                  },
                                );

                                total.value = response["pembelian"];

                                print(response);
                                print("Bisa beli saham");
                                hideLoading();
                                Get.back();
                                ss("Berhasil membuat Order!");
                              } on Exception catch (err) {
                                hideLoading();
                                print(err);
                                print("Tidak bisa  beli saham");
                                Get.back();
                                se("Saldo tidak mencukupi");
                              }
                            },
                            child: Text(
                              'BELI',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color:
                                      Colors.white), // Gaya teks untuk tombol
                            ),
                          ),
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
