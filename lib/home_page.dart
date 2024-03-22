import 'package:flutter/material.dart';
import 'package:kuisprakmobile/detail_page.dart';
import 'package:kuisprakmobile/login_page.dart';
import 'package:kuisprakmobile/top_album.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF76885B),
        title: Text(
          "TOP ALBUM",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10), // Adjust the padding as needed
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: topAlbumList.length,
          itemBuilder: (context, index){
            final album = topAlbumList[index];
            return _buildListItem(context, album);
          },
        ),
      ),
    );
  }
  Widget _buildListItem(BuildContext context, TopAlbum album){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder :(context) => Detailpage(album: album)
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                album.imageUrls,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
