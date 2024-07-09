// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/env.dart';
import 'package:hyper_ui/shared/util/dio_interceptors/dio_interceptors.dart';
import 'package:hyper_ui/shared/util/log/log.dart';

class QListView extends StatefulWidget {
  final String endpoint;
  final bool shrinkWrap;
  final String? search;
  final Widget Function(List items)? itemsBuilder;
  final Widget Function(Map item, int)? itemBuilder;
  final Widget Function()? emptyBuilder;

  const QListView({
    super.key,
    required this.endpoint,
    this.search,
    this.itemsBuilder,
    this.itemBuilder,
    this.emptyBuilder,
    this.shrinkWrap = false,
  });

  @override
  State<QListView> createState() => _QListViewState();
}

class _QListViewState extends State<QListView> {
  String? search;
  bool loading = true;
  List items = [];
  int page = 1;

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    search = widget.search;
    loadData();

    scrollController.addListener(() {
      var offset = scrollController.offset;
      var maxScroll = scrollController.position.maxScrollExtent;
      if (offset == maxScroll) {
        page++;
        loadData();
        setState(() {});
      } else {
        setState(() {});
      }
    });
  }

  loadData() async {
    if (page == 1) {
      loading = true;
      setState(() {});
    }

    var response = await dio.get(
      "/${widget.endpoint}?page=$page&search=${search ?? ''}",
    );
    Map obj = response.data;

    if (page == 1) {
      items = obj["data"] ?? [];
    } else {
      List newItems = obj["data"] ?? [];
      items.addAll(newItems);
    }
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

    if (widget.itemsBuilder != null) {
      return widget.itemsBuilder!(items);
    }

    if (widget.emptyBuilder != null && items.isEmpty) {
      return widget.emptyBuilder!();
    }

    return RefreshIndicator(
      onRefresh: () {
        page = 1;
        loadData();
        return Future.value(true);
      },
      child: ListView.builder(
        controller: scrollController,
        itemCount: items.length,
        shrinkWrap: widget.shrinkWrap,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            printo("--------------------");
            (items[index] as Map).forEach((key, value) {
              printo("$key: ${items[index][key]}");
            });

            printo("--------------------");
          }
          return widget.itemBuilder!(items[index], index);
        },
      ),
    );
  }
}

/*
//#TEMPLATE dio_list
QListView(
  endpoint: "articles",
  itemBuilder: (item, index) {
    // Your list item here
  }
),
//#END
*/
