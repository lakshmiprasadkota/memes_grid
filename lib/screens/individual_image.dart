import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme_grid/models/image_model.dart';

class IndividualImage extends StatefulWidget {
  IndividualImage({this.imageRefVar });
  final Getimages imageRefVar ;
  @override
  _IndividualImageState createState() => _IndividualImageState();
}

class _IndividualImageState extends State<IndividualImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          toolbarHeight: 70,
      backgroundColor: Colors.black,

        leading: CircleAvatar(
           backgroundColor: Colors.black,

          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.cancel ,size: 50, color: Color(0xff8ddad0),),),

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: double.infinity,
        child: Image.network(widget.imageRefVar.url),
        )
          ],
        ),
      ),
    );
  }
}
