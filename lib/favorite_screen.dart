import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFB39DDB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          color: Colors.deepPurple,
        ),
        height: size.height * 0.1,
        width: size.width,
        child: const Text(
          "Favorite  jokes",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Abril",
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ),
    );
  }

}