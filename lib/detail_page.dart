import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuisprakmobile/top_album.dart';

class Detailpage extends StatelessWidget {
  final TopAlbum album;
  
  const Detailpage({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.albumName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              album.imageUrls[0],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    album.albumName,
                  ),
                  SizedBox(height: 10),
                  Text(
                    album.singer,
                  ),
                  SizedBox(height: 10),
                  Text(
                    album.releaseDate,
                  ),
                  SizedBox(height: 10),
                  Text(
                    album.source,
                  ),
                  SizedBox(height: 10),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
