import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CreateGif extends StatelessWidget {
  @override
  Widget createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: snapshot.data['data'].length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Stack(children: <Widget>[
                FadeInImage.assetNetwork(
                  image: snapshot.data['data'][index]['images']['fixed_height']
                  ['url'],
                  height: 200,
                  fit: BoxFit.cover,
                  placeholder: '',
                ),Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.share),iconSize: 30,
                        onPressed: () { Share.share(snapshot.data['data'][index]['images']
                        ['fixed_height']['url']);}
                    ),
                    IconButton(
                  icon: Icon(Icons.local_fire_department_outlined, color: Colors.white,
                  ),iconSize: 30,
                  onPressed: (){
                  },
                ),
                  ],
                ),
          ]));
        });
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
