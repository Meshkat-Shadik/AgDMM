import 'package:agdmm_design/constants.dart';
import 'package:agdmm_design/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPurpleColor,
        title: const Text('Help Notes'),
      ),
      body: BlocBuilder<LanguageCubit, bool>(
        builder: (context, state) {
          return SfPdfViewer.asset(
            state
                ? 'assests/docs/help_line_bangla.pdf'
                : 'assests/docs/help_line.pdf',
            key: _pdfViewerKey,
          );
        },
      ),
    );
  }
}
