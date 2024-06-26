import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';

class Jualwidget extends StatelessWidget {
  const Jualwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            constraints: BoxConstraints(maxHeight: 380),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'JUAL',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Jarak antara judul dan konten lainnya
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
                          width: 8), // Jarak antara teks dan kontainer pertama
                      Expanded(
                        // Kontainer pertama
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Harga Jual'),
                            // Jarak antara teks dan kontainer
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 80,
                                    alignment: Alignment.center,
                                    child: Text(
                                      '50',
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
                            Text('Tanggal Jual'),
                            // Jarak antara teks dan kontainer
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '27-04-2024',
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Total Penjualan'),
                            Container(
                              width: 200,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Teks Atas 2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
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
                            Text('Volume Lot Jual'),
                            Container(
                              height:
                                  100, // Atur tinggi container sesuai kebutuhan
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            side: BorderSide(
                                              color: Colors.black,
                                            ), // Menambahkan garis tepi hitam
                                          ),
                                          onPressed: () {
                                            // Logika untuk tombol pertama
                                          },
                                          child: Text(
                                            '25%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            side: BorderSide(
                                              color: Colors.black,
                                            ), // Menambahkan garis tepi hitam
                                          ),
                                          onPressed: () {
                                            // Logika untuk tombol kedua
                                          },
                                          child: Text(
                                            '50%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            side: BorderSide(
                                              color: Colors.black,
                                            ), // Menambahkan garis tepi hitam
                                          ),
                                          onPressed: () {
                                            // Logika untuk tombol ketiga
                                          },
                                          child: Text(
                                            '75%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            side: BorderSide(
                                              color: Colors.black,
                                            ), // Menambahkan garis tepi hitam
                                          ),
                                          onPressed: () {
                                            // Logika untuk tombol keempat
                                          },
                                          child: Text(
                                            '100%',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          5), // Spasi antara tombol dan TextFormField
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: TextFormField(
                                      initialValue:
                                          '', // Nilai awal jika diperlukan
                                      textAlign: TextAlign.center,
                                      showCursor: true,
                                      cursorColor: Colors.transparent,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                      ),
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
                          backgroundColor: Colors.red),
                      onPressed: () => Get.back(),
                      child: Text(
                        'jual',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white), // Gaya teks untuk tombol
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
