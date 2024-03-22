import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kuisprakmobile/detail_page.dart';
import 'package:kuisprakmobile/top_album.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TOP ALBUM"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: topAlbumList.length,
        itemBuilder: (context, index){
          final album = topAlbumList[index];
          return _buildListItem(context, album);
        },
      ),
    );
  }
  _buildListItem(BuildContext context, TopAlbum album){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder :(context) => Detailpage(album: album)),
        );
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              album.imageUrls[0],
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
