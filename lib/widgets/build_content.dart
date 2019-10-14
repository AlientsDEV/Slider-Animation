import 'package:flutter/material.dart';
import 'package:slider/models/profile.dart';


class BuildContent extends StatefulWidget{

  final Profile profile;
  BuildContent({this.profile});

  @override
  _BuildContentState createState() => _BuildContentState();
}

class _BuildContentState extends State<BuildContent> {
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text(
                       widget.profile.name,
                       style: TextStyle(
                         fontSize: 19.0,
                         fontWeight: FontWeight.bold
                       ),
                       ),
                     SizedBox(height: 2.0,),
                     Text(
                       '${widget.profile.country}. ${widget.profile.city}',
                       style: TextStyle(
                         fontSize: 13.0,
                       ),
                     )
                  ],
                ),
                OutlineButton(
                  onPressed: () {
                    setState(() {
                      widget.profile.isFollow =! widget.profile.isFollow ;
                    });
                  },
                  child: Text( widget.profile.isFollow ? 'Follow' : 'UnFollow'),
                  textColor: widget.profile.isFollow ? Colors.green : Colors.red,
                  borderSide: BorderSide(color: widget.profile.isFollow ? Colors.green : Colors.red,width: 2.0),
                  shape: StadiumBorder(),
                )
            ],
          ),
           /*SizedBox(height: 20.0,),
           Text(
             profile.hobbies ,
             style: TextStyle(
               fontSize: 13.0,
             ),
           ),*/
           SizedBox(height: 25.0,),
           Text(
             'Photos',
             style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 17.0
             ),
           ),
          SizedBox(height: 20.0,),
            Row(
              children: <Widget>[
                buildImage('images/photo1.jpg'),
                SizedBox(width: 10.0,),
                buildImage('images/photo2.jpg'),
                SizedBox(width: 10.0,),
                buildImage('images/photo3.jpg'),
                SizedBox(height: 20.0,)
              ],
            )
        ],
      ),
    );
  }

  Widget buildImage(String pathImage){
    return ClipRRect(
       borderRadius: BorderRadius.circular(8.0),
         child: Image.asset(
           pathImage,
           height: 150,
           width: 100,
           fit: BoxFit.cover,
         ),
    );
  }
}