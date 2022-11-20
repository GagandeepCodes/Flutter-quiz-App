// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizup/data/question_list.dart';
import 'package:quizup/screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color(0xFF252c4a);
  Color secondColor = Color(0xFF117eeb);
  Color buttonColor = Color(0xFF117eeb);
  // required for the game
  bool isPressed = false;
  Color rightAnswer = Color.fromARGB(255, 76, 175, 80);
  Color wrongAnswer = Colors.red;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    //creating a page controller for pageview builder
    final PageController Controller = PageController(
      initialPage: 0,
    );
    return Scaffold(
      appBar: AppBar(
        //this will remove the back button from the appbar
        automaticallyImplyLeading: false,
        title: Text(
          "Quziup",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 34, 108),
            fontSize: 25
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        ),
        elevation: 10,
      ),  
     backgroundColor: mainColor,
     body: Padding(
      padding: EdgeInsets.all(18.0),
      child : PageView.builder(
        //intialising controller after the pageview builder ( required )
        controller: Controller,
        //we have to reset the conditions after page change
        onPageChanged:(page){ setState(() {
          isPressed = false;
        });
        },
        //this disables the default swiping and
        // moves to next page only on next question
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Question ${index+1} / ${questions.length} ",
            style: TextStyle(color: Colors.white,
            fontSize: 20
            ),
            ),
            Divider(
              color: Colors.white,
              thickness:1.50,
              height:10,
            ),
            SizedBox(
              height: 20,
            ),
            // You can also write .toString() after question which will convert 
            // it into string
            Text(questions[index].question!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 29,
              )
            ),
            SizedBox(
              height: 20,
            ),

            //created button and accesssing each key  of the map
            for(int i=0;i<questions[index].answer!.length;i++)
             Container(
              //to make them of equal width
              width: 500,
               child: ElevatedButton(
                onPressed: isPressed? (){} : (){ setState(() {
                  isPressed = true;
                });
                if(questions[index].answer!.entries.elementAt(i).value){
                  setState(() {
                    // isPressed = true;
                    score +=10;
                    print("Your score is $score");
                  });
                }
                },
               style: ElevatedButton.styleFrom(shape:StadiumBorder(),

               //this is a nested ternary condition ( if statement inside a if statement)
               backgroundColor: isPressed?
               questions[index].answer!.entries.elementAt(i).value?rightAnswer : wrongAnswer
               :buttonColor
               ),
                child:Text(questions[index].answer!.keys.elementAt(i))
                ),
             ),
 
             SizedBox(
              height: 9,
             ),

             //wrapped it with row so that I can move it to the right

             Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 OutlinedButton(onPressed: isPressed ?
                 index == (questions.length) - 1? (){ // this is navigating to a different route 
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) =>  ResultScreen(score)));
                 }:
                 (){
                  Controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                 } : null,
                 child: Text(
                  index == (questions.length) - 1 ? "See Result" : "Next Question",
                  style: TextStyle(color: Colors.white))
                  ),
               ],
             )
          ],
        );
      },
     )
      ),
    );
  }
}