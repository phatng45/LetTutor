import 'package:flutter/material.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_theme.dart';
import 'package:let_tutor/flutter_flow/flutter_flow_util.dart';
import 'package:pdfx/pdfx.dart';

import 'pdf_page_model.dart';

export 'pdf_page_model.dart';

class PdfPageWidget extends StatefulWidget {
  const PdfPageWidget({Key? key}) : super(key: key);

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

  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/pdfs/TheInternet.pdf'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: FlutterFlowTheme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Colors.indigo),
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.white,
        title: const Text('Lesson'),
        titleTextStyle: FlutterFlowTheme.of(context).title1.override(
            fontFamily: FlutterFlowTheme.of(context).title1Family,
            color: Colors.indigo),
      ),
      key: scaffoldKey,
      body: Center(
        child: PdfView(
          controller: pdfController,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
