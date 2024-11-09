import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/no-internet.jpeg",height: 200,width: 200,),
              const Text("Oops!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 32),),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Please check your internet connection.",textAlign: TextAlign.center,style: TextStyle(color: Colors.redAccent.withOpacity(0.6),fontWeight: FontWeight.w500,fontSize: 18),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}