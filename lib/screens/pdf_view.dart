import 'package:agdmm_design/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class PdfViewWidget extends StatefulWidget {
  const PdfViewWidget({Key? key}) : super(key: key);

  @override
  _PdfViewWidget createState() => _PdfViewWidget();
}

class _PdfViewWidget extends State<PdfViewWidget> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPurpleColor,
        title: const Text('Help Notes'),
      ),
      body: SfPdfViewer.asset(
        'assests/docs/help_line.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}
