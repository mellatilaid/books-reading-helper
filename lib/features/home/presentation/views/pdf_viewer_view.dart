import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerView extends StatefulWidget {
  final String filePath;
  const PdfViewerView({super.key, required this.filePath});

  @override
  State<PdfViewerView> createState() => _PdfViewerViewState();
}

class _PdfViewerViewState extends State<PdfViewerView> {
  PDFViewController? _pdfViewController;
  int _currentPage = 0;
  int _totalPages = 0;
  final Map<int, String> _notes = {}; // Store notes with page numbers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: widget.filePath, // Path to your PDF file
        preventLinkNavigation: false,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        nightMode: true,
        fitPolicy: FitPolicy.BOTH,
        pageFling: true,
        fitEachPage: false,
        pageSnap: true,
        onRender: (pages) {
          setState(() {
            _totalPages = pages!;
          });
        },
        onPageChanged: (current, total) {
          setState(() {
            _currentPage = current!;
          });
        },
        onViewCreated: (PDFViewController viewController) {
          _pdfViewController = viewController;
        },
      ),
    );
  }

  void _showAddNoteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final noteController = TextEditingController();
        return AlertDialog(
          title: const Text('Add Note'),
          content: TextField(
            controller: noteController,
            decoration: const InputDecoration(hintText: 'Enter your note'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final note = noteController.text;
                if (note.isNotEmpty) {
                  setState(() {
                    _notes[_currentPage] = note;
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showNotesDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Notes'),
          content: ListView.builder(
            itemCount: _notes.length,
            itemBuilder: (context, index) {
              final page = _notes.keys.elementAt(index);
              final note = _notes[page];
              return ListTile(
                title: Text('Page ${page + 1}'),
                subtitle: Text(note!),
                onTap: () async {
                  await _pdfViewController?.setPage(page);
                  if (!mounted) return;
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        );
      },
    );
  }
}
