import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scope_model/scope/scope_donate.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://pngimg.com/uploads/cat/cat_PNG50539.png"))),
            ),
          ),
          Column(
            children: <Widget>[
              Spacer(),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                elevation: 14,
                child: ScopedModelDescendant<ScopeDonate>(builder: (context,child,model){

                  if(model.donateClicked){
                    return _builtNextContent(model);

                  }else{
                    return _builtInitContent(model);
                  }

                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _builtInitContent(ScopeDonate donate) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "STEWARD",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Cats are Helpfull, not painfull",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cancle",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 16
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: Material(
                      color: Color(0xEEEEEEEE),
                      elevation: 14,
                      borderRadius: BorderRadius.circular(50),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {donate.decrement();},
                        child: Icon(
                          Icons.remove,
                          size: 35,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                    "${donate.count}\$",
                    style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
                  )),
                  Container(
                    height: 50,
                    width: 50,
                    child: Material(
                      color: Color(0xEEEEEEEE),
                      elevation: 14,
                      borderRadius: BorderRadius.circular(50),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {donate.increment();},
                        child: Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.purple,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.deepPurple,
                highlightColor: Colors.purple.withOpacity(0.7),
                onTap: (){donate.donateClicked = true;},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Donate",style: TextStyle(color: Colors.white,fontSize: 24),),
                      SizedBox(width: 30,),
                      Icon(Icons.pets,color: Colors.white,),

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
  Widget _builtNextContent(ScopeDonate donate){
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.bone,color: Colors.purple,size: 50,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "STEWARD says",
              style:
              TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Thanks for donating \$${donate.count}",
              style:
              TextStyle(fontSize: 16,color: Colors.purple, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Container(
            width: 350,
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.purple,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.deepPurple,
                highlightColor: Colors.purple.withOpacity(0.7),
                onTap: (){donate.donateClicked = false;},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.pets,color: Colors.white,),
                      SizedBox(width: 30,),
                      Text("Donate More",style: TextStyle(color: Colors.white,fontSize: 24),),
                      SizedBox(width: 30,),
                      Icon(Icons.pets,color: Colors.white,),

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
