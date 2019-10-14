import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slider/providers/state_manage.dart';
import '../models/profile.dart';
import '../widgets/build_column.dart';


class ProfilePageView extends StatefulWidget{

  final PageController _pageController = PageController(initialPage: 0);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();

}


class _ProfilePageViewState extends State<ProfilePageView> with SingleTickerProviderStateMixin{

  AnimationController _controller ;
  int indexSlider = 0;
  Animation _slideAnimation;
  Animation _fadeAnimation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500));

    _slideAnimation = TweenSequence([
      TweenSequenceItem<Offset>(weight: 10, tween: Tween(begin: Offset(0,0) , end: Offset(0,1))),
      TweenSequenceItem<Offset>(weight: 90, tween: Tween(begin: Offset(0,1) , end: Offset(0,0))),
    ]).animate(_controller);

    _fadeAnimation = TweenSequence([
      TweenSequenceItem<double>(weight: 10, tween: Tween(begin: 1 ,end: 0)),
      TweenSequenceItem<double>(weight: 90, tween: Tween(begin: 0 , end: 1)),
    ]).animate(_controller);

  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context){
    return Stack(
      children: <Widget>[
        PageView.builder(
            controller: widget._pageController,
            pageSnapping: true,
            onPageChanged: (indexPage){
              Provider.of<StateManage>(context).fetchProfile(indexPage);
              setState(() {
                indexSlider = indexPage;
                _controller.reset();
                _controller.forward();
              });
            },
            scrollDirection: Axis.horizontal,
            itemCount: profiles.length,
            itemBuilder: (context,index) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    profiles[index].imagePath,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.hue,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.5)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                        )
                    ),
                  ),
                ],
              );
            }
        ),
        Positioned(
            bottom: 40.0,
            right: 20.0,
            left: 20.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BuildColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        title: profiles[indexSlider].followers.toString(),
                        subTitle: 'Followers',
                      ),
                      BuildColumn(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        title: profiles[indexSlider].posts.toString(),
                        subTitle: 'Posts',
                      ),
                      BuildColumn(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        title: profiles[indexSlider].following.toString(),
                        subTitle: 'Following',
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }

}
