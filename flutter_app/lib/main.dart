import 'package:flutter/material.dart';

enum TileState { covered, blown, open, flagged, revealed}

void main() => runApp(Minsweeper());

class Minsweeper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:  "Minesweeper",
      home: Board()
    );
  }
}

class Board extends StatefulWidget{
  @override
  BoardState createState() => BoardState();
}

class BoardState extends State<Board>{
  final int rows=9;
  final int columns=9;
  final int numOfMines = 11;

  List<List<TileState>> uiState;

  void resetBoard(){
    uiState = new List<List<TileState>>.generate(rows, (row){
       return new List<TileState>.filled(columns, TileState.covered);
    });
  }

  @override
  void initState(){
    resetBoard();
    super.initState();

  }

  Widget buildBoard(){
    List<Row> boardRow = <Row>[];
    for(int i=0; i<rows;i++)
      {
        List<Widget> rowChildren = <Widget>[];
        for(int j=0; j<columns; j++){
          TileState state = uiState[i][j];
          if(state==TileState.covered){
            rowChildren.add(GestureDetector(
              child: Container(
                margin: EdgeInsets.all(2.0),
                height: 20.0,
                width: 20.0,
                color:Colors.grey,
              ),
            ));
          }

        }

        boardRow.add(Row(
          children : rowChildren,
          mainAxisAlignment: MainAxisAlignment.center,
          key: ValueKey<int>(i),
        ));
      }
      return Container(
        color: Colors.grey[700],
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: boardRow,
        ),

      );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text("MineSweeper"),
      ),
      body: Container(
        color: Colors.grey[50],
        child : Center(
          child: buildBoard(),
        )
      ),
    );
  }

}