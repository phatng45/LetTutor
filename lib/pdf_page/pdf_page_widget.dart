import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:let_tutor/schedule_page/schedule_page_widget.dart';
import 'package:pdfx/pdfx.dart';

import 'pdf_page_model.dart';

export 'pdf_page_model.dart';

class PdfPageWidget extends StatefulWidget {
  PdfPageWidget(this.url, this.name, {Key? key}) : super(key: key);
  String url;
  String name;

  @override
  _PdfPageWidgetState createState() => _PdfPageWidgetState();
}

class _PdfPageWidgetState extends State<PdfPageWidget>
    with WidgetsBindingObserver {
  late PdfPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfPageModel());
    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  late PdfControllerPinch pdfController = PdfControllerPinch(
    document: PdfDocument.openData(InternetFile.get(widget.url)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            TabHeader(
              title: widget.name,
              centerTitle: true,
              start: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: Colors.indigo,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: PdfViewPinch(
                  controller: pdfController,
                  scrollDirection: Axis.vertical,
                  padding: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
