import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controller/splesh_scrren_controller.dart';

class SpleshScrrenPage extends StatefulWidget {
  const SpleshScrrenPage({super.key});

  @override
  State<SpleshScrrenPage> createState() => _SpleshScrrenPageState();
}

class _SpleshScrrenPageState extends State<SpleshScrrenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpleshScrrenConttroler.autoTimeNextPage();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: SizedBox(height:double.infinity,
                    width:double.infinity,child: Image(fit: BoxFit.cover,image: AssetImage("assets/images/splash_screen.webp"))),
              ),
            ],
          ),
          LoadingAnimationWidget.newtonCradle(
            color: Colors.white,
            size: 200,
          ),
        ],
      ),
    );
  }
}
