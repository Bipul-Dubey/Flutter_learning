import 'package:flutter/material.dart';
import 'package:dio/dio.dart' show Dio, DioError;
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart' show DownloadsPathProvider;
import 'package:permission_handler/permission_handler.dart' show Permission, PermissionListActions, PermissionStatus, PermissionStatusGetters;


void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String fileUrl ="";
  bool downloading = false;
  double progress = 0;

  void downloadFile() async {
    setState(() {
      downloading = true;
      progress = 0;
    });
    Map<Permission, PermissionStatus> statuses = await [Permission.storage,].request();
    if (statuses[Permission.storage]!.isGranted) {
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        String saveName = "file.zip";
        String savePath = dir.path + "/$saveName";
        print(savePath);
        try {
          await Dio().download(
            fileUrl,
            savePath,
            onReceiveProgress: (received, total) {
              if (total != -1) {
                double percentage = (received / total * 100);
                setState(() {
                  progress = percentage;
                });
                print("$percentage%");
              }
            },
          );
          print("File is saved to the download folder.");
          // ignore: deprecated_member_use
        } on DioError catch (e) {
          print(e.message);
        } finally {
          setState(() {
            downloading = false;
          });
        }
      }
    } else {
      print("No permission to read and write.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Download File"),
        ),
        body: Center(
          child: Card(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    downloadFile();
                  },
                  child: const Text("Download File"),
                ),
                if (downloading)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        LinearProgressIndicator(value: progress / 100),
                        const SizedBox(height: 10),
                        Text("${progress.toStringAsFixed(0)}%"),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
