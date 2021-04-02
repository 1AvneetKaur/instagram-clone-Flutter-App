import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'comments.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'IOSD App',
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                Icons.menu,
                color: Colors.black,
              )),
              Text('\n        TalkItOut                                                                   ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black)),
//IconButton(icon: Icon(Icons. , color: Colors.black)),
//IconButton(icon: Icon(Icons.rin , color: Colors.black))
            ],
          ),
          body: Column(children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Text('\n     Trending',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            Text('\n'),
            Container(
              child: Text(
                  'Let out a thing of the past that\n                  bothers you',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              width: 370.0,
              height: 250.0,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.dstATop),
                    image: AssetImage('assets/iosdphoto.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            Image(),
          ]),
        ),
        debugShowCheckedModeBanner: false);
  }
}

class Image extends StatefulWidget {
  @override
  ImageState createState() => new ImageState();
}

class ImageState extends State<Image> {
  bool liked = false;
int _n;
bool showHeartOverlay = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }
_commentButtonPressed(){
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage()));
    });
}
  @override
  Widget build(BuildContext context) {
    IconButton heartButton = IconButton(
        icon: Icon(liked ? Icons.favorite : Icons.favorite_border,
            color: liked ? Colors.red : null),
        onPressed: () =>  _pressed(),

    );
    IconButton commentButton = IconButton(
      icon: Icon(Icons.chat,
          color: Colors.grey),
      onPressed: () =>  _commentButtonPressed(),
    );
    return Container(
        child: Column(
      children: [
        SafeArea(
        //  top: false,
        //bottom: false,
        child:ListTile(

            title: Row(children: <Widget>[heartButton, commentButton])
        ) )

    //    ListTile(leading: new Text('$_n', style: new TextStyle(fontSize: 20))),
      ],
    ));
  }

  void add() {
    setState(() {

      _n++;
    });
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
