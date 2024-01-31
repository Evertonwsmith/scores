import 'package:flutter/material.dart';
import 'package:scores/styles.dart';

class curling extends StatefulWidget {
  final String team1;
  final String team2;

  const curling({super.key, required this.team1, required this.team2});

  @override
  State<curling> createState() => _curlingState();
}

class _curlingState extends State<curling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customStyles.appbarColor,
        toolbarHeight: 80,
        elevation: 5,
        title: Title(
            color: Colors.black,
            child: Text(
              "Curling",
              style: customStyles.mainTextStyleY(),
            )),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: customStyles.getCustomBoxDec4(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              teamRow(team1: "Team1", team2: "Team2"),
              scoreRow(inning: 1),
              scoreRow(inning: 2),
              scoreRow(inning: 3),
              scoreRow(inning: 4),
              scoreRow(inning: 5),
              scoreRow(inning: 6),
            ],
          ),
        ),
      ),
    );
  }
}

class teamRow extends StatefulWidget {
  final String team1;
  final String team2;

  const teamRow({super.key, required this.team1, required this.team2});

  @override
  State<teamRow> createState() => _teamRowState();
}

class _teamRowState extends State<teamRow> {
  bool init = false;
  String team1name = 'er';
  String team2name = 'er';

  void _showPopup1(BuildContext context) {
    late TextEditingController textController = new TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text('Popup Window'),
            content: TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: "Team 1 name",
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    team1name = textController.text;
                  });

                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPopup2(BuildContext context) {
    late TextEditingController textController = new TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text('Popup Window'),
            content: TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: "Team 2 name",
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    team2name = textController.text;
                  });

                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (init == false) {
      team1name = widget.team1;
      team2name = widget.team2;
      init = true;
    }
    return Column(
      children: [
        SizedBox(
          height: customStyles.stdboxht,
          width: customStyles.stdboxht,
        ),
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              // TODO: open prompt to change widget.team1
              _showPopup1(context);
            });
          },
          child: Container(
              height: customStyles.stdboxht,
              width: customStyles.stdboxht,
              decoration: customStyles.getCustomBoxDec(),
              child: Center(
                  child: Text(team1name, style: customStyles.mainTextStyle()))),
        ),
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              // TODO: open prompt to change widget.team2
              _showPopup2(context);
            });
          },
          child: Container(
            height: customStyles.stdboxht,
            width: customStyles.stdboxht,
            decoration: customStyles.getCustomBoxDec(),
            child: Center(
                child: Text(team2name, style: customStyles.mainTextStyle())),
          ),
        ),
      ],
    );
  }
}

class scoreRow extends StatefulWidget {
  final int inning;

  const scoreRow({super.key, required this.inning});

  @override
  State<scoreRow> createState() => _scoreRowState();
}

class _scoreRowState extends State<scoreRow> {
  int scoreOne = 0;
  int scoreTwo = 0;
  bool clicked = false;
  bool downclicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: customStyles.getCustomBoxDec(),
          height: customStyles.stdboxht,
          width: customStyles.stdboxht,
          child: Center(
              child: Text('End ' + widget.inning.toString(),
                  style: customStyles.mainTextStyle())),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              scoreOne++;
              clicked = true;
              downclicked = false;
            });
          },
          onDoubleTap: () {
            setState(() {
              scoreOne--;
              clicked = false;
              downclicked = true;
            });
          },
          child: Container(
            decoration: customStyles.getCustomBoxDec2(),
            height: customStyles.stdboxht,
            width: customStyles.stdboxht,
            child: Center(
                child: AnimatedContainer(
              duration: Duration(milliseconds: 50),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: clicked ? Colors.green[200] : downclicked ? Colors.red[200] : Colors.white,
              ),
              child: Center(
                child: Text(scoreOne.toString(),
                    style: customStyles.mainTextStyle()),
              ),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              scoreTwo++;
            });
          },
          onDoubleTap: () {
            setState(() {
              scoreTwo--;
            });
          },
          child: Container(
            decoration: customStyles.getCustomBoxDec3(),
            height: customStyles.stdboxht,
            width: customStyles.stdboxht,
            child: Center(
                child: Text(scoreTwo.toString(),
                    style: customStyles.mainTextStyle())),
          ),
        ),
      ],
    );
  }
}
