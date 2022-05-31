import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeAppGifs extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeAppGifs> {
  late String textBusca;
  int _offsetPagination = 0;

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
                _offsetPagination = 0;
              });

              Text('$text');
             //GiphyRepository;
              //_offsetPagination = 0;
            },
          ),
        ),
        Text("aksjuasdadsadasdaewasdadsdp2çemdjbuy3dnddgha"),
        Expanded(
          child: FutureBuilder(
            future: _getGifs(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Container(
                    width: 200,
                    height: 700,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 5,
                    ),
                  );
                default:
                  if (snapshot.hasError)
                    return Container(
                      child: Text(
                        "",

                      ),
                    );
                  else
                    return _createGifTable(context, snapshot);
              }
            },
          ),
        ),
      ]),
    );
  }

  int _getCount(List data) {
    if (textBusca == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _getCount(snapshot.data['data']),
        itemBuilder: (context, index) {
          if (textBusca == null || index < snapshot.data['data'].length) {
            return GestureDetector(
              child: Stack(
                children: <Widget>[
                  Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5,
                      )),
                  Center(
                    child: FadeInImage.assetNetwork(
                      image: snapshot.data['data'][index]['images']
                      ['fixed_height']['url'],
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: 'https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
                    ),
                  ),
                ],
              ),
                          );
          } else {
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 70,
                    ),
                    Text(
                      "Carregar mais...",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
                
              ),
            );
          }
        });
  }

  Future<Map> _getGifs() async {
    http.Response response;

    if (textBusca == null || textBusca.isEmpty) {
      response = await http.get(Uri.parse(
          'https://api.giphy.com/v1/gifs/search?api_key=SW5H8LkrCsSWIfPJSzIUHEX6w2gQ0yRz&q=AIRTON&limit=25&offset=0&rating=g&lang=en'));
    } else {
      response = await http.get(Uri.parse(
          'https://api.giphy.com/v1/gifs/search?api_key=SW5H8LkrCsSWIfPJSzIUHEX6w2gQ0yRz&q=${textBusca}&limit=25&offset=0&rating=g&lang=en'));
    }
    return json.decode(response.body);
  }

}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }



