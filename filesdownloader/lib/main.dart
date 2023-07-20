import 'package:flutter/material.dart';

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
  double _progress = 50.0;
  bool _downloading = false;
  final TextEditingController _downloadURL = TextEditingController();
  

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
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 2),
                    child: SizedBox(
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                          value: _progress/100,
                            backgroundColor: Colors.redAccent,
                            color: Colors.green,
                            minHeight: 5,
                      ),
                          Text("Downloaded: $_progress%/100%")
                        ],
                      ),
                    ),
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
