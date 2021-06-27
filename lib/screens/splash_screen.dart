import 'dart:async';

import 'package:dsc_world_app/layouts/home_layout.dart';
import 'package:dsc_world_app/shared/components/components.dart';
import 'package:dsc_world_app/shared/style/colors.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
   final bool? isDark;

  const SplashScreen({Key? key,required this.isDark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () =>navigateTo(context,HomeLayout()));

    var assetsImage = new AssetImage('assets/images/logo.png');
    var image = new Image(image: assetsImage,
    width: 100,
     height: 100);
     bool mode = false;
     if(isDark!=null){
     mode = isDark!;
     }
   

    return 
       Scaffold(
         backgroundColor:mode?black: Colors.white,
        body: Container(
          child: new Center(
            child: image,
          ),
        ),
      
    );
  }
}
