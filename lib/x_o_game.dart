import 'package:flutter/material.dart';
import 'package:x_o_game/app_colors.dart';
import 'package:x_o_game/board_button.dart';

class HomeScreen extends StatefulWidget {
 static const String routeName ="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<String> boardState =['','','',
 '','','',
 '','',''];
 int player1Score=0;
 int player2Score=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.purple_one,
      appBar:AppBar(
        backgroundColor: AppColors.yellow,
        title: Text("XO Game",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body:
      Column(
        children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.blue_one,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PLAYER 1 (X)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$player1Score",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.blue_two,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PLAYER 2 (O)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$player2Score",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],),
        )
        ,Expanded(
            flex: 2,

            child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch
            ,children: [
            BoardButton(text: boardState[0],index: 0,onButtonClick: onButtonClick,),
            BoardButton(text:boardState[1] ,index: 1,onButtonClick: onButtonClick,),
            BoardButton(text: boardState[2],index: 2,onButtonClick: onButtonClick,),
          ],),
        )
        ,Expanded(
            flex: 2,
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch
            ,children: [
            BoardButton(text: boardState[3],index: 3,onButtonClick: onButtonClick,),
            BoardButton(text: boardState[4],index: 4,onButtonClick: onButtonClick,),
            BoardButton(text: boardState[5],index: 5,onButtonClick: onButtonClick,),
          ],),
        )
        ,Expanded(
            flex: 2,
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch
            ,children: [
              BoardButton(text: boardState[6],index: 6,onButtonClick: onButtonClick,),
              BoardButton(text: boardState[7],index: 7,onButtonClick: onButtonClick,),
              BoardButton(text: boardState[8],index: 8,onButtonClick: onButtonClick,),
          ],),
        )
        ,Expanded(
            flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch
              ,children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: ElevatedButton(onPressed: (){
                 player1Score=0;
                 player2Score=0;
                 initBoard();
                 setState(() {

                 });
                }, child: Text("Replay",style: TextStyle(color:Colors.black ,fontSize: 40,fontWeight: FontWeight.bold))),)
            ],),
          ),
        )

      ],),
    );
  }

  int counter=0;

  void onButtonClick(int index){
    if(boardState[index].isNotEmpty){
      return;
    }
    print(index);
    if(counter.isEven){
     boardState[index]="X";
    }else{
      boardState[index]="O";
    }
    counter++;
    if(checkWiner('X')){
      player1Score++;
      initBoard();
    }else if(checkWiner('O')){
      player2Score++;
      initBoard();

    }else if(counter==9){
      initBoard();
    }
    setState(() {

    });
  }
  bool checkWiner(String symbol){
   for(int i=0 ; i<9; i+=3){
    if(boardState[i]==symbol&&boardState[i+1]==symbol&&boardState[i+2]==symbol){
      return true;
    }
   }
   for(int i=0 ; i<3; i++){
     if(boardState[i]==symbol&&boardState[i+3]==symbol&&boardState[i+6]==symbol){
       return true;
     }
   }
   if(boardState[2]==symbol&&
       boardState[4]==symbol&&
       boardState[6]==symbol){
     return true;
   }if(boardState[0]==symbol&&
       boardState[4]==symbol&&
       boardState[8]==symbol){
     return true;
   }
   return false;
  }

  void initBoard() {
    boardState =['','','',
      '','','',
      '','',''];
    counter =0;
  }
}
