
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/kategori_list_form_view.dart';

class KategoriListFormController extends State<KategoriListFormView> {
    static late KategoriListFormController instance;
    late KategoriListFormView view;

    @override
    void initState() {
        instance = this;
        super.initState();
    }

    @override
    void dispose() => super.dispose();

    @override
    Widget build(BuildContext context) => widget.build(context, this);
}
        
    