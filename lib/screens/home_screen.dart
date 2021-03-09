import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme_grid/models/image_model.dart';
import 'package:meme_grid/network/base_network.dart';
import 'package:meme_grid/screens/individual_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Getimages> imageList = List();
  dynamic res;
  bool fetching = true;
  void getHttp() async {
    setState(() {
      fetching = true;
    });
    try {
      Response response =
      await dioClient.ref.get("/memes/page/0/60",
      );
      setState(() {
        imageList = getimagesFromMap(jsonEncode(response.data));
        fetching = false;
        print(response);
      });
    } catch (e) {
      setState(() {
        fetching = false;
      });
      print(e);
    }
  }

  void initState() {
    getHttp();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Color(0xff6548e2),
          centerTitle: true,
          title: Text("Meme" , style: TextStyle(fontWeight:  FontWeight.w500), ),

        ),
        body: NewWidget(imageList: imageList ,fetching: fetching,)
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.imageList, this.fetching
  }) ;

  final List<Getimages> imageList;
   final bool fetching ;
  @override
  Widget build(BuildContext context) {
    if (fetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (imageList.length == 0) {
      return Center(
        child: Text("No Data"),
      );
    }
    return SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            child: Column(
                children: [
                  GridView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio:1,
                        crossAxisCount: 3 ,crossAxisSpacing: 5, mainAxisSpacing: 5),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    IndividualImage(
                                     imageRefVar: imageList[index],
                                    )));
                      },
                        child: CachedNetworkImage(
                          imageUrl: imageList[index].url,
                          fit: BoxFit.cover,
                          placeholder: (context,url) =>
                         Transform.scale(
                              scale: 0.2,
                                child: CircularProgressIndicator()),

                          errorWidget: (context,url,error) => Icon(Icons.error_outline)
                        ),
                      // child: imageList[index].url != null ? Image.network(imageList[index].url ,
                      //   fit: BoxFit.cover, height: 100,width: 100,):
                      //      Image.asset("assets\images\load.gif")

                    ),
                  )
                ]
            )
        )
    );
  }

}

