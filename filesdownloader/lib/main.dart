import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


void main(){
  runApp(const MyDownloader());
}

class MyDownloader extends StatefulWidget {
  const MyDownloader({super.key});

  @override
  State<MyDownloader> createState() => _MyDownloaderState();
}

class _MyDownloaderState extends State<MyDownloader> {
  // variables
  double _progress = 0.0;
  bool _downloading = false;
  bool _downloadCompleted=false;
  final TextEditingController _downloadURL = TextEditingController();
  late String _downloadStatus='';

  // get path to download
  Future<String> getFilePath() async{
    String path='';
    Directory dir = await getApplicationDocumentsDirectory();
    path = dir.path;
    return path;
  }

  Future<void> startDownload() async{

    String savePath= await getFilePath();
    Dio dio = Dio();
    const url = 'https://freetestdata.com/wp-content/uploads/2022/11/Free_Test_Data_10.5MB_PDF.pdf';

    final File file=File(url);
    final filename=basename(file.path);

    try{
      await dio.download(
          url,
          '$savePath/$filename',
          onReceiveProgress: (receive,total) {
            setState(() {
              _progress = (receive / total )* 100;
              if(_progress>0){
                _downloading=true;
                _downloadCompleted=false;
              }
              if(_progress==100.0){
                _progress=0;
                _downloading=false;
                _downloadCompleted=true;
                _downloadStatus='Download Completed Successfully';
              }
            });
          },
          deleteOnError: true,
          cancelToken: cancel
      );
    } on DioException catch(e){
      _downloadStatus='$e';
    }

  }

  CancelToken cancel = CancelToken();

  Future<void> cancelDownload() async{
    cancel.cancel();
    setState(() {
      _progress=0;
      _downloading=false;
      _downloadCompleted=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text("File Downloader"),
          centerTitle: true,
        ),
        body: Card(
          margin: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Download URL',
                  ),
                  controller: _downloadURL,
                ),
                if(_downloading)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
                    child: SizedBox(
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                          value: _progress/100,
                            backgroundColor: Colors.redAccent,
                            color: Colors.green,
                            minHeight: 5,
                      ),
                          Text("Downloaded: ${_progress.toStringAsFixed(2)}%/100%")
                        ],
                      ),
                    ),
                  ),
                if(_downloadCompleted)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
                    child: Text(_downloadStatus),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            startDownload();
                          },
                          child: const Text("Download"),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          cancelDownload();
                        },
                        child: const Text("Cancel"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
