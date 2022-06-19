import 'dart:convert';

import 'package:chuck_norris_joke/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'joke.dart';

void main() => runApp(const MaterialApp(home: MyApplication(),
  debugShowCheckedModeBanner: false,));

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB39DDB),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteScreen()),
              );
            }
          )
        ],
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: const JokesWidget(),
    );
  }
}

class JokesWidget extends StatefulWidget {
  const JokesWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JokesWidget();
  }
}

class _JokesWidget extends State<JokesWidget> {
  Joke joke = Joke("Type to heart fot trying this!");

  Future<Joke> getJoke() async {
    final response = await http.get(Uri.parse("https://api.chucknorris.io/jokes/random"));
    if (response.statusCode == 200) {
      return Joke.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception(
          "Sorry, it's a error. Maybe something wrong with the internet");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
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
          "Chuck Norris IO",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Abril",
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ),
      Container(
        color: const Color(0xFFB39DDB),
        height: size.height * 0.10,
      ),
      Container(
        decoration: const BoxDecoration(
          color: Color(0XFF9575CD),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        width: size.width * 0.75,
        height: size.height * 0.5,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                    image: AssetImage("assets/image/chuck.jpg"), width: 300)),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(joke.getJoke(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Open Sans",
                      fontSize: 14,
                      color: Colors.white,
                    )
                )
            ),
          ],
        ),
      ),
      Container(
        color: const Color(0xFFB39DDB),
        height: size.height * 0.05,
        margin: EdgeInsets.only(bottom: 10),
      ),
      Ink(
        decoration: const ShapeDecoration(
          color: Colors.deepPurple,
          shape: CircleBorder(),
        ),
        child: IconButton(

          icon: const Icon(Icons.favorite),
          color: Colors.white,
          onPressed: () {
            setState(() {
              try {
                getJoke().then((info) => joke = info);
              } catch (err){
                joke = Joke("Sorry,"
                    " it's a error. Maybe something wrong with the internet");
              }
            });
          },
        ),
      )
    ]);
  }
}
