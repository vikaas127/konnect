import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:konnect/theme/theme.dart';
import 'package:share/share.dart';


class PdfViewerPage extends StatelessWidget {
  final String path;
  const PdfViewerPage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
IconButton(icon:Icon(Icons.share),onPressed: (){
  Share.shareFiles(['${path}']);
},),
        ],
        title: Text('PdfView',style: theme().title16w,),
      ),
      path: path,
    );
  }
}