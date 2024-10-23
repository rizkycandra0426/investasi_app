import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockDetailView extends StatefulWidget {
  StockDetailView({
    Key? key,
    required this.stock,
  }) : super(key: key);
  final Map<String, dynamic> stock;

  Widget build(context, StockDetailController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    var value = controller.data?.response?.data?.results?.first;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 28,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: Column(
            children: [
              // Your existing card widget and other widgets here...
              Card(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stock["nama_saham"],
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent[400],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                stock["nama_perusahaan"],
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            child: Image.network(
                              stock["pic"],
                              width: 70,
                              height: 70,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                                  width: 70,
                                  height: 70,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Open",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "${value?.open}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "High",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "${value?.high}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Low",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "${value?.low}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Close",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "${value?.close}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Volume",
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                "${value?.volume}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Beliwidget(),
                          ),
                          // showModalBottomSheet(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return SekuritasModalSheet();
                          //   },
                          // );
                          const SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: Jualwidget(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Builder(
                builder: (context) {
                  List filters = [
                    "3 Bulan",
                    "6 Bulan",
                    "9 Bulan",
                    "1 Tahun",
                  ];

                  return Container(
                    height: 40.0,
                    child: ListView.builder(
                      itemCount: filters.length,
                      scrollDirection: Axis.horizontal,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        bool selected = controller.dateFilterIndex == index;
                        return Container(
                          margin: const EdgeInsets.only(
                            right: 6.0,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  selected ? Colors.green : Colors.grey[600],
                            ),
                            onPressed: () {
                              controller.updateDateFilterIndex(index);
                            },
                            child: Text(
                              filters[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              Builder(
                builder: (context) {
                  if (controller.chartLoading) {
                    return Container(
                      width: 500, // Define chart width as needed
                      height: 300, // Define chart height as needed
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Loading...",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    );
                  }
                  return Container(
                    color: Theme.of(context).cardColor,
                    padding: EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 500, // Define chart width as needed
                      height: 300, // Define chart height as needed
                      child: SfCartesianChart(
                        primaryXAxis: DateTimeAxis(
                          dateFormat: DateFormat.MMMd(),
                        ),
                        primaryYAxis: NumericAxis(),
                        zoomPanBehavior: ZoomPanBehavior(
                          enablePinching: true,
                          enablePanning: true,
                          zoomMode: ZoomMode.x,
                        ),
                        series: <CartesianSeries>[
                          // Renders line chart
                          LineSeries<Map<String, dynamic>, DateTime>(
                            // Notice the generic type `DateTime` for x-axis
                            dataSource: controller.chartValues,
                            xValueMapper: (Map<String, dynamic> data, _) =>
                                data["date"],
                            yValueMapper: (Map<String, dynamic> data, _) =>
                                data["value"] as int,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<StockDetailView> createState() => StockDetailController();
}
