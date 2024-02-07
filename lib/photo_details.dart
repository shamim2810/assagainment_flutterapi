import 'package:flutter/material.dart';

class PhotoDetails extends StatefulWidget {
  final passTitleData;
  final passUrl;
  final passId;

  const PhotoDetails(
      {super.key,
      required this.passTitleData,
      required this.passUrl,
      required this.passId});

  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 500,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Image.network(widget.passUrl,),
                const SizedBox(height: 10,),
                Text("Title: ${widget.passTitleData}"),
                const SizedBox(height: 10,),
                Center(child: Text("ID: ${widget.passId}")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
