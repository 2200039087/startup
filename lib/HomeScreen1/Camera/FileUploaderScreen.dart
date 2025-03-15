import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploaderScreen extends StatefulWidget {
  @override
  _FileUploaderScreenState createState() => _FileUploaderScreenState();
}

class _FileUploaderScreenState extends State<FileUploaderScreen> {
  String? _fileName;
  PlatformFile? _pickedFile;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _pickedFile = result.files.first;
        _fileName = _pickedFile?.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_pickedFile != null)
              Text('Selected File: $_fileName')
            else
              Text('No file selected.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Pick File'),
            ),
          ],
        ),
      ),
    );
  }
}
