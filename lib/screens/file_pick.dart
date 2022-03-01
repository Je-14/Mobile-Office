import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class GetFiles extends StatelessWidget {
  const GetFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[300],
      child: IconButton(
        focusColor: const Color.fromARGB(255, 84, 184, 18),
        icon: const Icon(
          Icons.file_upload,
          size: 100,
        ),
        onPressed: () => _upload(),
      ),
    );
  }
}

_upload() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.any,
    withData: false,
    withReadStream: true,
  );

  if (result == null || result.files.isEmpty) {
    throw Exception('No files picked or file picker was canceled');
  }

  final file = result.files.first;
  final filePath = file.path;
  final mimeType = filePath != null ? lookupMimeType(filePath) : null;
  final contentType = mimeType != null ? MediaType.parse(mimeType) : null;

  final fileReadStream = file.readStream;
  if (fileReadStream == null) {
    throw Exception('Cannot read file from null stream');
  }

  final stream = http.ByteStream(fileReadStream);

  final uri =
      Uri.https('gs://mobile-office-6d5ed.appspot.com', '/cash/receipt');
  final request = http.MultipartRequest('POST', uri);
  final multipartFile = http.MultipartFile(
    'file',
    stream,
    file.size,
    filename: file.name,
    contentType: contentType,
  );
  request.files.add(multipartFile);

  final httpClient = http.Client();
  final response = await httpClient.send(request);

  if (response.statusCode != 200) {
    AlertDialog(
      title: Text('${response.statusCode}'),
    );
    throw Exception('HTTP ${response.statusCode}');
  }

  final body = await response.stream.transform(utf8.decoder).join();

  print(body);
}
