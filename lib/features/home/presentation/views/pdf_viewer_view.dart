import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerView extends StatelessWidget {
  final String filePath;
  const PdfViewerView({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
