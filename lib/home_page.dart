import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slider/providers/state_manage.dart';
import 'package:slider/widgets/build_content.dart';

import './widgets/navigation_bottom.dart';
import './widgets/profile_page_view.dart';


class MyHomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<MyHomePage > with SingleTickerProviderStateMixin{

  final expandedHeightFactor = 0.50;
  final collapsedHeightFactor = 0.90;
  AnimationController _controller;
  Animation<double> _heightFactorAnimation;
  bool isAnimationComplete = false;
  double screenHeight;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _heightFactorAnimation = Tween<double>(begin: collapsedHeightFactor,end: expandedHeightFactor).animate(_controller);
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  void onBottomPartTap(){
     if(isAnimationComplete)
       _controller.reverse();
     else
       _controller.forward();
     setState(() {
       isAnimationComplete =! isAnimationComplete;
     });
  }


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      bottomNavigationBar: AppBottomBar(),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context,widget){
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: _heightFactorAnimation.value,
                child: ProfilePageView()
              ),
              GestureDetector(
                onVerticalDragUpdate: _handleVerticalUpdate,
                onVerticalDragEnd: _handleVerticalEnd ,
                onTap: onBottomPartTap,
                child: FractionallySizedBox(
                  heightFactor: 1.06 - _heightFactorAnimation.value,
                  alignment: Alignment.bottomCenter,
                  child: Consumer<StateManage>(
                    builder: (context,stateManage,_) =>
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40.0))
                        ),
                          /*child: BuildContent(profile : stateManage.profile),*/
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            BuildContent(profile : stateManage.profile),
                          ],
                        ),
                      )
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }



  void _handleVerticalEnd(DragEndDetails dragDetails){
      if(_controller.value>=0.5)
          _controller.forward();
      else
          _controller.reverse();
  }


  void _handleVerticalUpdate(DragUpdateDetails updateDetails){
      double fractionDragged = updateDetails.primaryDelta / screenHeight;
      _controller.value = _controller.value - 3 * fractionDragged;
  }
}



































/*
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

   double collapsedHeightFactor = 0.80;
   double expandedHeightFactor = 0.67;
   AnimationController _controller;
   Animation<double> _heightFactorAnimation;
   bool isAnimationCompleted = false;


   @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _heightFactorAnimation = Tween<double> (begin: collapsedHeightFactor,end: expandedHeightFactor,).animate(_controller);*/
/*
    _controller.addStatusListener((currentStatus){
        if(currentStatus == AnimationStatus.completed){
           isAnimationCompleted = true;
        }
    });*//*

   }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  onBottomPartTap(){
      setState(() {
         if(isAnimationCompleted){
            _controller.reverse();
         }else{
            _controller.forward();
         }
         isAnimationCompleted =! isAnimationCompleted;
      });
  }


  Widget getWidget(){
     return Stack(
       fit: StackFit.expand,
       children: <Widget>[
         FractionallySizedBox(
           heightFactor: _heightFactorAnimation.value,
           alignment: Alignment.topCenter,
           child: Image.asset(
             'images/billgates.jpg',
             fit: BoxFit.cover,
             height: 500,
             colorBlendMode: BlendMode.hue,
             color: Colors.black,
           ),
         ),
         GestureDetector(
           onTap: onBottomPartTap,
           child: FractionallySizedBox(
             alignment: Alignment.bottomCenter,
             heightFactor: 1 - _heightFactorAnimation.value,
             child: Container(
               color: Colors.teal,
             ),
           ),
         )
       ],
     );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context,widget){
            return getWidget();
        },
      )

    );
  }
}
*/
