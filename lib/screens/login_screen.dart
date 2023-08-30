import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/text_utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment>_topAlignment;
  late Animation<Alignment>_bottomAlignment;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration:const  Duration(seconds: 4));

    _topAlignment=TweenSequence<Alignment>([
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.topLeft,end: Alignment.topRight), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.topRight,end: Alignment.centerRight), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.centerRight,end: Alignment.bottomRight), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.bottomRight,end: Alignment.bottomLeft), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.bottomLeft,end: Alignment.centerLeft), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.centerLeft,end: Alignment.topLeft), weight: 1),

    ]).animate(_controller);

    _bottomAlignment=TweenSequence<Alignment>([
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.bottomRight,end: Alignment.bottomLeft), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.bottomLeft,end: Alignment.centerLeft), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.centerLeft,end: Alignment.topLeft), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.topLeft,end: Alignment.topRight), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.topRight,end: Alignment.centerRight), weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.centerRight,end: Alignment.bottomRight), weight: 1)
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,

        builder: (context,_) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: _topAlignment.value,
                end: _bottomAlignment.value,
                colors: [

                  Color(0xffF99E43),

                  Color(0xffDA2323),





                ]
              )
            ),
            child: BackdropFilter(filter:ImageFilter.blur(sigmaY: 5,sigmaX: 5),
          child:  Container(
          padding:const  EdgeInsets.all(20),
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.15),
          border: Border.all(color: Colors.white54),
          // noise image to improve the glass effect
          image:const  DecorationImage(
          image: AssetImage("assets/i.jpeg"),fit: BoxFit.fill,opacity: 0.03

          )
          ),
            child: Column(
              children: [
                const  Spacer(),
                TextUtil(text: "Welcome Back!",size: 30,weight: true,),
               const  Spacer(),
                // for Username
                TextFormField(
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w800),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                    constraints:const  BoxConstraints(
                      maxHeight: 40
                    ),
                    filled: true,
                      enabledBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.white, width: 0.0),
                      ),
                      fillColor: Colors.white.withOpacity(0.4),
                      prefixIcon: const Icon(Icons.person, color: Colors.white,),
                      hintText: "Enter your username",

                      hintStyle: const TextStyle(color: Colors.white,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                const  Spacer(),
                // For Password
                TextFormField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w800),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      constraints:const  BoxConstraints(
                          maxHeight: 40
                      ),
                      filled: true,

                      enabledBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.white, width: 0.0),
                      ),

                      fillColor: Colors.white.withOpacity(0.4),
                      prefixIcon: const Icon(Icons.lock, color: Colors.white,),
                      hintText: "Enter your password",

                      hintStyle: const TextStyle(color: Colors.white,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
               const  SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtil(text: "remember me",size: 12,weight: true,),
                    TextUtil(text: "forgot Password?",size: 12,weight: true,)
                  ],
                ),
                const  Spacer(),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                   color: Colors.white.withOpacity(0.4),
                  ),
                  alignment: Alignment.center,
                  child: TextUtil(text: "Login",weight: true,),

                )

              ],
            ),
            ),
          ));
        }
      ),
    );
  }
}
