// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';
import 'package:hyper_ui/shared/util/log/log.dart';

class QDetailView extends StatefulWidget {
  final String endpoint;
  final dynamic id;
  final bool shrinkWrap;
  final Widget Function(Map item)? itemBuilder;
  final Widget Function()? emptyBuilder;

  const QDetailView({
    super.key,
    required this.endpoint,
    required this.id,
    required this.itemBuilder,
    this.emptyBuilder,
    this.shrinkWrap = false,
  });

  @override
  State<QDetailView> createState() => _QListViewState();
}

class _QListViewState extends State<QDetailView> {
  bool loading = true;
  Map item = {};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    loading = true;
    setState(() {});

    var response = await dio.get(
      "${widget.endpoint}/${widget.id}",
    );
    Map obj = response.data;
    item = obj["data"] ?? {};
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    printo("--------------------");
    (item).forEach((key, value) {
      printo("$key: ${item[key]}");
    });

    printo("--------------------");

    if (widget.emptyBuilder != null && item.isEmpty) {
      return widget.emptyBuilder!();
    }
    return widget.itemBuilder!(item);
  }
}

/*
//#TEMPLATE dio_detail
QDetailView(
  endpoint: "articles",
  id: "1",
  itemBuilder: (detail) { 
    // Your detail here
  }
),
//#END
*/
