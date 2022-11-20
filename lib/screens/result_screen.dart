import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizup/main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score,{super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF252c4a);
    Color secondColor = Color(0xFF117eeb);
    Color buttonColor = Color(0xFF117eeb);
    return  Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
             "Congratulations!",
              style : TextStyle(
                color: Colors.orange,fontSize: 25,fontWeight: FontWeight.bold
                )
            ),
            Text(
             " Your Score :",
              style : TextStyle(
                color: Colors.orange,fontSize: 25,fontWeight: FontWeight.bold
                )
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${widget.score}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
             SizedBox(
              height: 30,
             ),
             ElevatedButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
             },
              child:Text(
                "Restart",
                )
               )
          ],
        ),
      ),
    );
  }
} 