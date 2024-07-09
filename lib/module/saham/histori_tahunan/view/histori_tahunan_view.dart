import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/histori_tahunan_controller.dart';

class HistoriTahunanView extends StatefulWidget {
  const HistoriTahunanView({Key? key}) : super(key: key);

  Widget build(context, HistoriTahunanController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historitahunan"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.grey[200],
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            var item = controller.items[index];

            return Card(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: H5(title: item["year"].toString()),
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: VerticalRowItem(
                            label: "Equity",
                            value:
                                double.parse(item["equity"].toString()).number,
                          ),
                        ),
                        Expanded(
                          child: VerticalRowItem(
                            label: "Harga/unit",
                            value:
                                double.parse(item["harga_per_unit"].toString())
                                    .number,
                          ),
                        ),
                        Expanded(
                          child: VerticalRowItem(
                            label: "Jumlah/unit",
                            value:
                                double.parse(item["jumlah_per_unit"].toString())
                                    .number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: VerticalRowItem(
                            label: "Floating return",
                            value:
                                double.parse(item["floating_return"].toString())
                                    .number,
                          ),
                        ),
                        Expanded(
                          child: VerticalRowItem(
                            label: "Yield",
                            value: item["yield"],
                          ),
                        ),
                        Expanded(
                          child: VerticalRowItem(
                            label: "IHSG",
                            value: item["ihsg"],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  State<HistoriTahunanView> createState() => HistoriTahunanController();
}

class VerticalRowItem extends StatelessWidget {
  final String label;
  final dynamic value;
  const VerticalRowItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$label",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          "$value",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
