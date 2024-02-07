import 'dart:convert';

import 'package:assagainment_flutterapi/gallery.dart';
import 'package:assagainment_flutterapi/photo_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  List<galleryEdit> myList = [];
  @override
  void initState() {
    super.initState();
    onTapPhotoGalleryApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoDetails(
                      passId: myList[index].id,
                      passTitleData: myList[index].title,
                      passUrl: myList[index].url,
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text(myList[index].title),
                  leading: Image.network(myList[index].url ?? ' '),
                ),
              ),
            );
          }),
    );
  }

  Future<void> onTapPhotoGalleryApi() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      for (var item in responseBody) {
        galleryEdit photo = galleryEdit(
          url: item["url"],
          id: item["id"],
          title: item["title"],
        );
        myList.add(photo);
      }
      setState(() {});
    }
  }
}
