import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito"
      ),
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Container(
          child:LoginPage(),
          ),
        ),
      );
    
  }
}



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 
  int _pageState=0;

  var _backgroundColor= Colors.white;
  var _headingColor=Color(0xFFB40284A);

  double _loginYOffset=0;
  double _registerYOffset=0;
  double _loginXOffset=0;
  double windowWidth=0;
  double windowHeight=0;
  double _loginWidth=0;
  double _loginOpacity=1;
  @override
  Widget build(BuildContext context) {



    windowWidth= MediaQuery.of(context).size.width;
    windowHeight=MediaQuery.of(context).size.height;


    switch(_pageState) {
      case 0:
         _backgroundColor=Colors.white;
         _headingColor= Color(0xFFB40284A);
         _loginYOffset=windowHeight;
         _registerYOffset=windowHeight;
         _loginXOffset=0;
         _loginWidth=windowWidth;
         _loginOpacity=1;

          break;
      case 1:
        _backgroundColor=Color(0xFFBD34C59);
        _headingColor=Colors.white;
        _loginYOffset=270;
        _registerYOffset=windowHeight;
        _loginXOffset=0;
        _loginWidth=windowWidth;
        _loginOpacity=1;
         
         break;
      case 2:
        _backgroundColor=Color(0xFFBD34C59);
        _headingColor=Colors.white;

        _loginYOffset=240;
        _registerYOffset=270;
        _loginXOffset=20;
        _loginWidth=windowWidth-40;
        _loginOpacity=0.7;
        break;
    }
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1000
          ),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget>[
              GestureDetector(
                onTap:() {
                  setState(() {
                    _pageState=0;
                  });
                },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            top:100
                            ),


                          child: Text(
                            "Eat Bitch",
                            style: TextStyle(
                               color: _headingColor,
                               fontSize: 28
                            ),
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.only(
                            top:20,
                            right: 32,
                            left: 32
                            ),
                          padding: EdgeInsets.symmetric(
                            horizontal:20
                            ),
                          child: Text("I love Covid and Covid loves me next time wont u play with me",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                 color: _headingColor,
                                 fontSize: 16
                              ),
                              ),
                        ),
                      ],
                      ),
                   ),
              ),
              Container(
                   padding: EdgeInsets.symmetric(
                     horizontal:32
                   ),
                child:Center(
                  child: Image.asset("assets/images/cafe.png"),
                    ),
                 ),
              Container(
                 child: GestureDetector(
                    onTap: () {
                       setState(() {
                        if(_pageState!=0){
                          _pageState=0;
                        }
                        else {
                          _pageState=1;
                        }
                         
                       });
                    },            
                                
                    child: Container(
                     margin: EdgeInsets.all(32),
                     padding: EdgeInsets.all(20),
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: Color(0xFFB40284A),
                       borderRadius: BorderRadius.circular(50)
                     ),
                    child:Center(
                     child: Text("Get Started",
                     style: TextStyle(
                       color:Colors.white

                     ),
                      ),
                     ),
                    ),
                 ),
                 ),

            ],
            ),
        ),
        
        GestureDetector(
          onTap:() {
            setState(() {
              _pageState=2;
            });
          },
          
           
        child: AnimatedContainer(
          width: _loginWidth,
          curve: Curves.fastLinearToSlowEaseIn,
          duration:Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(_loginXOffset,_loginYOffset,1),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(_loginOpacity),
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(25),
              topRight:Radius.circular(25),
            )
           ),
          ),
        ),
         GestureDetector(
          onTap:() {
            setState(() {
              _pageState=1;
            });
          },
          
           
        child: AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration:Duration(
            milliseconds: 1000
            ),
          transform: Matrix4.translationValues(0,_registerYOffset,1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(25),
              topRight:Radius.circular(25),
            )
           ),
          ),
        )
    
      ],
    );
  }
}
