import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/userSettings.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFReader extends StatefulWidget {
  final String pdfUrl;
  const PDFReader({Key key, @required this.pdfUrl}) : super(key: key);

  @override
  _PDFReaderState createState() => _PDFReaderState();
}

class _PDFReaderState extends State<PDFReader> {
  PdfViewerController _pdfViewerController;
  int sensitivity = 100;
  int pageNum = 0;
  int totalPages = 0;

  void _selectPagePopUp(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          int valueSelected = pageNum;
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150,
                  child: CupertinoPicker(
                    children: new List.generate(totalPages + 1, (index) {
                      if (index == 0) {
                        return Text("");
                      } else {
                        return Text("$index");
                      }
                    }),
                    itemExtent: 30,
                    onSelectedItemChanged: (int value) {
                      setState(() {
                        valueSelected = value;
                      });
                    },
                  ),
                ),
                Container(
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _pdfViewerController.jumpToPage(valueSelected);
                        pageNum = valueSelected;
                      },
                      child: Text("Confirm",
                          style: TextStyle(color: Colors.grey[700]))),
                )
              ],
            ),
          );
        });
  }

  void _pdfError(String error, Size size) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 150,
                    width: 100,
                    child: AutoSizeText(
                      "The following error was thrown:\n $error",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(fontSize: size.height * 0.05),
                    )),
                Container(
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (context) {
                        //   return HomeScreen();
                        // }));
                      },
                      child: Text("Ok",
                          style: TextStyle(color: Colors.grey[700]))),
                )
              ],
            ),
          );
        });
  }

  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Center(
            child: Container(
              width: phone ? size.width * 0.15 : size.width * 0.1,
              child: GestureDetector(
                child: Text(
                  "$pageNum/$totalPages",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          phone ? size.width * 0.04 : size.height * 0.015),
                ),
                onTap: () {
                  _selectPagePopUp(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: phone ? size.height * 0.1 : 0,
              child: Container(
                height: phone ? size.height * 0.6 : size.height,
                width: size.width,
                child: SfPdfViewer.network(
                  '${widget.pdfUrl}',
                  controller: _pdfViewerController,
                  onDocumentLoaded: (details) {
                    setState(() {
                      pageNum = _pdfViewerController.pageNumber;
                      totalPages = _pdfViewerController.pageCount;
                    });
                  },
                  onDocumentLoadFailed: (details) {
                    _pdfError(details.description, size);
                  },
                  onPageChanged: (details) {
                    setState(() {
                      pageNum = _pdfViewerController.pageNumber;
                      totalPages = _pdfViewerController.pageCount;
                    });
                  },
                  searchTextHighlightColor: Colors.green[700],
                  canShowScrollHead: false,
                  canShowScrollStatus: true,
                  enableTextSelection: true,
                  initialScrollOffset: Offset(10, 10),
                  canShowPaginationDialog: true,
                  interactionMode: PdfInteractionMode.selection,
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: GestureDetector(
                child: Container(
                  color: Colors.transparent,
                  height: size.height,
                  width: size.width * 0.15,
                  child: pageNum == 1 || pageNum == 0
                      ? Container()
                      : Icon(
                          Icons.chevron_left,
                          size: 30,
                          color: Colors.grey[600],
                        ),
                ),
                onTap: () {
                  _pdfViewerController.previousPage();
                },
                onLongPress: () {
                  _pdfViewerController.firstPage();
                },
                // onHorizontalDragUpdate: (details) {
                //   if (details.delta.dx > sensitivity) {
                //     _pdfViewerController.jumpToPage(pageNum - 1);
                //   }
                // }
              ),
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                child: Container(
                  color: Colors.transparent,
                  height: size.height,
                  width: size.width * 0.1,
                  child: pageNum == totalPages
                      ? Container()
                      : Icon(
                          Icons.chevron_right,
                          size: 30,
                          color: Colors.grey[600],
                        ),
                ),
                onTap: () {
                  _pdfViewerController.nextPage();
                  setState(() {
                    pageNum = _pdfViewerController.pageNumber;
                  });
                },
                onLongPress: () {
                  _pdfViewerController.lastPage();
                },
                // onHorizontalDragUpdate: (details) {
                //   if (details.delta.dx < -sensitivity) {
                //     _pdfViewerController.nextPage();
                //   }
                // }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
