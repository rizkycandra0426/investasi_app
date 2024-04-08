import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
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
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
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
                // onChanged: (value) {
                //   _controller.updateSearchQuery(value);
                // },
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
                physics: ClampingScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white70,
                    margin: EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      splashColor: Colors.redAccent.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StockDetailView(),
                          ),
                        );
                      },
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
                                    'Ticker $index',
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
                                      'Company Name $index',
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
                            // Image.network(
                            //   'https://example.com/logo_$index.png',
                            //   width: 40,
                            //   height: 40,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StockView> createState() => StockController();
}
