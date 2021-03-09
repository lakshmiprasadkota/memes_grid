
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme_grid/models/image_model.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';


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
      body:  Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 150),
            child: PinchZoomImage(
              image: Image.network(widget.imageRefVar.url),
            ),
          ),
        ),
        // child: Container(
        //      margin: EdgeInsets.symmetric(vertical: 100),
        //     alignment: Alignment.center,
        //     child: Center(
        //       child: InteractiveViewer(
        //         panEnabled: false,
        //
        //         child: Image.network(
        //           widget.imageRefVar.url,
        //
        //           fit: BoxFit.fill,
        //         ),
        //       ),
        //     ),
        //   ),


    );
  }
}
