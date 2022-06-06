import 'package:envio_gif/pages/components/create_widget_screen.dart';
import 'package:flutter/material.dart';
import 'title_home_screen.dart';
import '../repositories/giphy_repository.dart';

class HomeAppGifs extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeAppGifs> {
  String textBusca = '';
  late GiphyRepository getG = new GiphyRepository();
  late CreateGif createG = new CreateGif();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Envio GIPHY'),

        ),
        body: Column(children: [
          SizedBox(height: 20),
          TituloHome(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar Gif',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (text) {
                    setState(() {
                      textBusca = text;
                    });
                  })),
          Expanded(
              child: FutureBuilder(
                  future: getG.getGifs(textBusca),
                  //_getGifs(),
                  builder: (context, snapshot) {
                    return createG.createGifTable(context, snapshot);
                  }))
        ]));
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}