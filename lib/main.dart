import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Gandhi_House_Database.dart';
import 'Nehru_House_Database.dart';
import 'Tagore_House_Database.dart';
import 'Teresa_House_Database.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:animator/animator.dart';
import  'dart:math';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voting(2019-20)',
            debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.indigo,

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Elections (2019-20)'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text('\n\n\n\n'),
          new Image.asset(
            'assets/emblem.JPG',
          ),
          new Text('\n\n\n'),
          new RaisedButton(
              child: Text('Begin',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => hs()),
                );
              }),

        ],
      )),
    ));
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(
              "",
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                   ),
            ),
            accountEmail: new Text(
              "Council Member Elections 2019-20",
              style: new TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.double,),
            ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/head.png'),
                  fit: BoxFit.fill,
                ),
              ),


          ),
          Divider(
            color:Colors.black,
            height: 0.5,

          ),
          new ListTile(
            leading: Icon(Icons.home),
            title: new Text(
              'Home',
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          Divider(
            height: 2.0,
          ),
          new ListTile(
            leading: new Icon(Icons.security),
            title: new Text(
              'Admin',
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Admin()),
              );
            },
          ),
          Divider(
            height: 2.0,
          ),
          new ListTile(
            leading: new Icon(Icons.details),
            title: new Text(
              'About Us',
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Aboutus()),
              );
            },
          ),
          Divider(
            height: 2.0,
          ),
          new ListTile(
            leading: new Icon(Icons.contact_mail),
            title: new Text(
              'Contact Us',
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contactus()),
              );
            },
          ),
          Divider(
            height: 2.0,
          ),

          new Text('\n\n\n\n\n\n\n\n\n'),
          new Text('                               Version : 2.0.0',style: TextStyle(fontWeight:FontWeight.w300),),
        ],
      ),
    );
  }
}

class Admin extends StatelessWidget {

  String id;
  String pass;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final idc = TextEditingController();
  final passc = TextEditingController();

  positive(String acname,BuildContext context){
    Fluttertoast.showToast(
      msg: 'Welcome $acname  ',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultPage()),
    );

  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    idc.dispose();
     passc.dispose();
  }
  @override
  Widget build(BuildContext context) {


    final emailField = TextField(
      controller: idc,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "User Id",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: passc,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
        onPressed: () {
          gandhihouse helper = gandhihouse.instance;
          helper.countvotesvc();
          helper.countvotesc();

          nehruhouse helper2 = nehruhouse.instance;
          helper2.countvotesvc();
          helper2.countvotesc();

          tagorehouse helper3 = tagorehouse.instance;
          helper3.countvotesvc();
          helper3.countvotesc();

          teresahouse helper4 = teresahouse.instance;
          helper4.countvotesvc();
          helper4.countvotesc();
           id = idc.text.toLowerCase();
           pass = passc.text.toLowerCase();
           switch(id){

             case "ma'am":
             (pass=='pmsjbdla')?positive(id, context): Fluttertoast.showToast(
               msg: 'Incorrect Password , Please Try Again',
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
             );


             break;


             case 'akkii':
             (pass=='vasudeva')?positive(id,context): Fluttertoast.showToast(
               msg: '$id Incorrect Password , Please Try Again',
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
             );


             break;

             case 'pika':
             (pass=='vasyt')?positive(id, context): Fluttertoast.showToast(
               msg: '$id Incorrect Password , Please Try Again',
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
             );


             break;

             case 'vasu':
             (pass=='imadeit')?positive(id, context): Fluttertoast.showToast(
               msg: '$id Incorrect Password , Please Try Again',
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
             );
             break;
             default:Fluttertoast.showToast(
               msg: '$id , You are not authorised to access this information',
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
             );

        }
        }
      ),
    );



    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin'),
          centerTitle: true,
        ),
        drawer: MyDrawer(),

        body: Center(
      child: SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text('Enter Your Credentials To Login',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),


              ],
            ),

      ),
    ),
    )
      ),
    );
  }
}

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('About Us'), centerTitle: true),
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child:ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text("The Tradition of voting for the Members of "
                        "our Student Council was started in year 2013 "
                        "by our then Ma'am Principal Susan Jacob. "
                        "My senior Ankit Sharma was the first one to "
                        "develop the voting application for Desktop PC.\n"
                        "This method for voting was used untill the Year 2017 "
                        "when the first version of this Application "
                        "(version:1.0.0) was made by me , to ease the process "
                        "by the use of android mobile devices which significantly "
                        "reduced the voting time and efforts.\n"
                        "I would like to thank my Mentor and my IP teacher  "
                        "Ma'am Vineeta Robert , my Class Teacher Ma'am Archana dave "
                        " Brother Director , Ma'am Principal, and all my teachers "
                        " and school management for believing in me and supporting "
                        " me for this application.\n\n"

                      ,style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),),

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('                          '),
                        Text(   'Student',style: new TextStyle(fontSize: 20,decoration: TextDecoration.underline,)),
                        Text('                   '),
                        Text('Mentor',style: new TextStyle(fontSize: 20,decoration: TextDecoration.underline,)),
                        Text('    '),
                      ],
                    ),

                    Text('             👇🏻                         👇🏻       ',style: new TextStyle(fontSize: 20)),
                    new Image.asset(
                      'assets/mepic.png',
                    ),

                    /* new RaisedButton(
                  child: Text('Result',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  onPressed: () {

                    gandhihouse helper = gandhihouse.instance;
                    helper.countvotesvc();
                    helper.countvotesc();

                    nehruhouse helper2 = nehruhouse.instance;
                    helper2.countvotesvc();
                    helper2.countvotesc();

                    tagorehouse helper3 = tagorehouse.instance;
                    helper3.countvotesvc();
                    helper3.countvotesc();

                    teresahouse helper4 = teresahouse.instance;
                    helper4.countvotesvc();
                    helper4.countvotesc();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultPage()),
                    );
                  }),*/
                  ],
                ),
              ],
            )


          ),
        ),
      ),
    );
  }
}

class Contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        body: Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Contact Us',
              style: new TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
            new Text('\n\n\n\n'),
            new Text(
              'If you are facing a problem or you have\nany suggestion or a complain. We will be \n be happy to help. Select your preffered \nway  of communication below',
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
            new Text(' \n\n\n\n\n\n\n\n\n\n'),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.call), iconSize: 50, onPressed: _call),
                new Text("          "),
                new IconButton(
                    icon: Icon(Icons.sms), iconSize: 50, onPressed: _text),
                new Text("          "),
                new IconButton(
                    icon: Icon(Icons.email), iconSize: 50, onPressed: _email),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

_text() async {
  const sms = 'https://wa.me/917838516674';
  if (await canLaunch(sms)) {
    await launch(sms);
  } else {
    throw 'Could not launch $sms';
  }
}

_call() async {

  const num = 'tel:+917838516674';
  if (await canLaunch(num)) {
    await launch(num);
  } else {
    throw 'Could not launch $num';
  }
}

_email() async {
  const url = 'mailto:vasugl981@gmail.com?subject=&body=';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class hs extends StatefulWidget {
  // This widget is the home page of your application.
  @override
  Houseselection createState() => Houseselection();
}

class Houseselection extends State<hs> {
  @override

 // Offset _offset = Offset(0.4, 0.7);
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Houses'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body:  Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child:ListView(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Text(''),
                              new Text('Choose your House',style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400)),
                              Divider(height: 15,),

                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Animator(
                                      tween: Tween<double>(begin:0,end:4*pi),
                                      duration: Duration(seconds:15),
                                      repeats:0,
                                      builder:(anim) => Transform(
                                        transform: Matrix4.rotationY(anim.value),
                                        alignment: Alignment.center,
                                        child:new Image.asset(
                                          'assets/ght.png',
                                        ),
                                      )
                                  ),
/*  Transform(  // Transform widget
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateX(0.01*_offset.dy)
              ..rotateY(-0.01*_offset.dx),
              alignment: FractionalOffset.center,
              child: GestureDetector( // new
                onPanUpdate: (details) => setState(() => _offset += details.delta),
                onDoubleTap: () => setState(() => _offset = Offset.zero),
                child: new Image.asset(
                'assets/ght.png',
              ),),
            ),*/

                                  new Text('             '),
                                  new RaisedButton(
                                      child: Text('Gandhi House',
                                          style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => gandhihousevc()),
                                        );
                                      }),
                                ],
                              ),

                              Divider(height: 15),

                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Animator(
                                      tween: Tween<double>(begin:0,end:4*pi),
                                      duration: Duration(seconds:15),
                                      repeats:0,
                                      builder:(anim) => Transform(
                                        transform: Matrix4.rotationY(anim.value),
                                        alignment: Alignment.center,
                                        child:new Image.asset(
                                          'assets/nht.png',
                                        ),
                                      )
                                  ),
                                  new Text('             '),
                                  new RaisedButton(
                                      child: Text('Nehru House',
                                          style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => nehruhousevc()),
                                        );
                                      }),
                                ],
                              ),

                              Divider(height: 15,),

                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Animator(
                                      tween: Tween<double>(begin:0,end:4*pi),
                                      duration: Duration(seconds:15),
                                      repeats:0,
                                      builder:(anim) => Transform(
                                        transform: Matrix4.rotationY(anim.value),
                                        alignment: Alignment.center,
                                        child:new Image.asset(
                                          'assets/taht.png',
                                        ),
                                      )
                                  ),
                                  new Text('             '),
                                  new RaisedButton(
                                      child: Text('Tagore House',
                                          style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => tagorehousevc()),
                                        );
                                      }),
                                ],
                              ),

                              Divider(height: 15,),

                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Animator(
                                      tween: Tween<double>(begin:0,end:4*pi),
                                      duration: Duration(seconds:15),
                                      repeats:0,
                                      builder:(anim) => Transform(
                                        transform: Matrix4.rotationY(anim.value),
                                        alignment: Alignment.center,
                                        child:new Image.asset(
                                          'assets/tht.png',
                                        ),
                                      )
                                  ),
                                  new Text('             '),
                                  new RaisedButton(
                                      child: Text('Teresa House',
                                          style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => teresahousevc()),
                                        );
                                      }),
                                ],
                              ),

                              Divider(height: 15,),
                            ],
                          )



                        ],
                      )


                  ),
                )),
      ),
    );
  }
}

class gandhihousevc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gandhi House Vice Captains '),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child:ListView(
                    children: <Widget>[
                      new ListTile(
                          subtitle: Text(
                              '\n          Select Your Vice Captain From below Candidates\n'
                                  '                                      (Scroll Down Too!!)\n')),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                           
                          new Image.asset(
                            'assets/gvcc1.png',
                          ),
                          new Text('        '),
                          RaisedButton(
                              child: Text(' Aditi Chauhan ',
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.bold)),
                              onPressed: () {
                                votesg vote = votesg();
                                vote.can1 = 1;
                                vote.can2 = 0;
                                vote.can3 = 0;
                                vote.can4 = 0;
                                vote.can5 = 0;
                                gandhihouse helper = gandhihouse.instance;
                                helper.insertvc(vote);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => gandhihousec()),
                                );
                              }),
                        ],
                      ),
                      Divider(
                        height: 40.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                           
                          new Image.asset(
                            'assets/gvcc2.png',
                          ),
                          new Text('        '),
                          RaisedButton(
                              child: Text(' Emilyn Dinkar ',
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.bold)),
                              onPressed: () {
                                votesg vote = votesg();
                                vote.can1 = 0;
                                vote.can2 = 1;
                                vote.can3 = 0;
                                vote.can4 = 0;
                                vote.can5 = 0;
                                gandhihouse helper = gandhihouse.instance;
                                helper.insertvc(vote);
                                Fluttertoast.showToast(
                                  msg: "Your Vote is Registered\n"
                                      "Now Vote For Your Captain",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => gandhihousec()),
                                );
                              }),
                        ],
                      ),
                      Divider(
                        height: 40.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                           
                          new Image.asset(
                            'assets/gvcc3.png',
                          ),
                          new Text('        '),
                          RaisedButton(
                              child: Text(' Ananya Srivastav ',
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.bold)),
                              onPressed: () {
                                votesg vote = votesg();
                                vote.can1 = 0;
                                vote.can2 = 0;
                                vote.can3 = 1;
                                vote.can4 = 0;
                                vote.can5 = 0;
                                gandhihouse helper = gandhihouse.instance;
                                helper.insertvc(vote);
                                Fluttertoast.showToast(
                                  msg: "Your Vote is Registered\n"
                                      "Now Vote For Your Captain",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => gandhihousec()),
                                );
                              }),
                        ],
                      ),
                      Divider(
                        height: 40.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                           
                          new Image.asset(
                            'assets/gvcc4.png',
                          ),
                          new Text('        '),
                          RaisedButton(
                              child: Text('  Prachi Jha  ',
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.bold)),
                              onPressed: () {
                                votesg vote = votesg();
                                vote.can1 = 0;
                                vote.can2 = 0;
                                vote.can3 = 0;
                                vote.can4 = 1;
                                vote.can5 = 0;
                                gandhihouse helper = gandhihouse.instance;
                                helper.insertvc(vote);
                                Fluttertoast.showToast(
                                  msg: "Your Vote is Registered\n"
                                      "Now Vote For Your Captain",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => gandhihousec()),
                                );
                              }),
                        ],
                      ),
                      Divider(
                        height: 40.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                           
                          new Image.asset(
                            'assets/gvcc5.png',
                          ),
                          new Text('        '),
                          RaisedButton(
                              child: Text(' Sanya Jaiswal ',
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.bold)),
                              onPressed: () {
                                votesg vote = votesg();
                                vote.can1 = 0;
                                vote.can2 = 0;
                                vote.can3 = 0;
                                vote.can4 = 0;
                                vote.can5 = 1;
                                gandhihouse helper = gandhihouse.instance;
                                helper.insertvc(vote);
                                Fluttertoast.showToast(
                                  msg: "Your Vote is Registered\n"
                                      "Now Vote For Your Captain",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => gandhihousec()),
                                );
                              }),
                        ],
                      ),
                      Divider(
                        height: 40.0,
                      ),
                    ],
                  )


              ),
            )),
      ),
    );
  }
}

class nehruhousevc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nehru House Vice Captains '),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child:ListView(
                  children: <Widget>[
                    new ListTile(
                        subtitle: Text(
                            '\n          Select Your Vice Captain From below Candidates\n'
                                '                                      (Scroll Down Too!!)\n')),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/nvcc1.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Abhishek Thakur ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              nvotes vote = nvotes();
                              vote.can1 = 1;
                              vote.can2 = 0;
                              vote.can3 = 0;
                              vote.can4 = 0;

                              nehruhouse helper = nehruhouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => nehruhousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/nvcc2.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('  Sreya Varghese  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              nvotes vote = nvotes();
                              vote.can1 = 0;
                              vote.can2 = 1;
                              vote.can3 = 0;
                              vote.can4 = 0;

                              nehruhouse helper = nehruhouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => nehruhousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/nvcc3.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('      Meher Rao      ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              nvotes vote = nvotes();
                              vote.can1 = 0;
                              vote.can2 = 0;
                              vote.can3 = 1;
                              vote.can4 = 0;

                              nehruhouse helper = nehruhouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => nehruhousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/nvcc4.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('   Vyom Paliwal   ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              nvotes vote = nvotes();
                              vote.can1 = 0;
                              vote.can2 = 0;
                              vote.can3 = 0;
                              vote.can4 = 1;
                              nehruhouse helper = nehruhouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => nehruhousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                  ],
                )),


          ),
        )),
    );
  }
}

class tagorehousevc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tagore House Vice Captains '),
          centerTitle: true,
        ),
        body:Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child:ListView(
                  children: <Widget>[
                    new ListTile(
                        subtitle: Text(
                            '\n          Select Your Vice Captain From below Candidates\n'
                                '                                      (Scroll Down Too!!)\n')),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tavc1.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('  Arooshi Sharma  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can1 = 1;
                              vote.can2 = 0;
                              vote.can3 = 0;
                              vote.can4 = 0;
                              vote.can5 = 0;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => tagorehousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tavc2.png',
                        ),
                        new Text('            '),
                        RaisedButton(
                            child: Text('  Avani Thakur  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can1 = 0;
                              vote.can2 = 1;
                              vote.can3 = 0;
                              vote.can4 = 0;
                              vote.can5 = 0;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => tagorehousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tavc3.png',
                        ),
                        new Text('         '),
                        RaisedButton(
                            child: Text('  Sanjivini Sinha  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can1 = 0;
                              vote.can2 = 0;
                              vote.can3 = 1;
                              vote.can4 = 0;
                              vote.can5 = 0;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => tagorehousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tavc4.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('      Kevin Jogy      ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can1 = 0;
                              vote.can2 = 0;
                              vote.can3 = 0;
                              vote.can4 = 1;
                              vote.can5 = 0;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => tagorehousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tavc5.png',
                        ),
                        new Text('          '),
                        RaisedButton(
                            child: Text('   Harshit Nair   ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can1 = 0;
                              vote.can2 = 0;
                              vote.can3 = 0;
                              vote.can4 = 0;
                              vote.can5 = 1;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => tagorehousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                  ],
                )),


          ),
        )



      ),
    );
  }
}

class teresahousevc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Teresa House Vice Captains '),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child:ListView(
                  children: <Widget>[
                    new ListTile(
                        subtitle: Text(
                            '\n          Select Your Vice Captain From below Candidates\n'
                                '                                      (Scroll Down Too!!)\n')),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tvc1.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Ananya Srivastava ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can1 = 1;
                              vote.can2 = 0;
                              vote.can3 = 0;
                              vote.can4 = 0;
                              vote.can5 = 0;
                              vote.can6 = 0;

                              teresahouse helper = teresahouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => teresahousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tvc2.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('  Manya Sawhney  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can1 = 0;
                              vote.can2 = 1;
                              vote.can3 = 0;
                              vote.can4 = 0;
                              vote.can5 = 0;
                              vote.can6 = 0;

                              teresahouse helper = teresahouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => teresahousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tvc3.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('  Ritika Thakur  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can1 = 0;
                              vote.can2 = 0;
                              vote.can3 = 1;
                              vote.can4 = 0;
                              vote.can5 = 0;
                              vote.can6 = 0;

                              teresahouse helper = teresahouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => teresahousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tvc4.png',
                        ),
                        new Text('         '),
                        RaisedButton(
                            child: Text('    Riya Bhati    ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can1 = 0;
                              vote.can2 = 0;
                              vote.can3 = 0;
                              vote.can4 = 1;
                              vote.can5 = 0;
                              vote.can6 = 0;

                              teresahouse helper = teresahouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => teresahousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),


                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tvc5.png',
                        ),
                        new Text('         '),
                        RaisedButton(
                            child: Text('  Tisya Sharma ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can1 = 0;
                              vote.can2 = 0;
                              vote.can3 = 0;
                              vote.can4 = 0;
                              vote.can5 = 1;
                              vote.can6 = 0;

                              teresahouse helper = teresahouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => teresahousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tvc6.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('  Yuvika Mishra ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can1 = 0;
                              vote.can2 = 0;
                              vote.can3 = 0;
                              vote.can4 = 0;
                              vote.can5 = 0;
                              vote.can6 = 1;

                              teresahouse helper = teresahouse.instance;
                              helper.insertvc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "Now Vote For Your Captain",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => teresahousec()),
                              );
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                  ],
                )),


          ),
        )



      ),
    );
  }
}

class gandhihousec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gandhi House Captains '),
          centerTitle: true,
        ),
        body:
        Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child:ListView(
                  children: <Widget>[
                    new ListTile(
                        subtitle: Text(
                            '\n          Select Your  Captain From below Candidates\n'
                                '                                   (Scroll Down Too!!)\n')),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/gcc1.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Daivik Keswani ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              votesg vote = votesg();
                              vote.can6 = 1;
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 0;
                              vote.can11 = 0;
                              gandhihouse helper = gandhihouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/gcc2.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' M.Fairaz ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              votesg vote = votesg();
                              vote.can6 = 0;
                              vote.can7 = 1;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 0;
                              vote.can11 = 0;
                              gandhihouse helper = gandhihouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/gcc3.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Lakshita Kataria ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              votesg vote = votesg();
                              vote.can6 = 0;
                              vote.can7 = 0;
                              vote.can8 = 1;
                              vote.can9 = 0;
                              vote.can10 = 0;
                              vote.can11 = 0;
                              gandhihouse helper = gandhihouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(

                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/gcc4.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Sanskriti ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              votesg vote = votesg();
                              vote.can6 = 0;
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 1;
                              vote.can10 = 0;
                              vote.can11 = 0;
                              gandhihouse helper = gandhihouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/gcc5.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Palak Sharma ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              votesg vote = votesg();
                              vote.can6 = 0;
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 1;
                              vote.can11 = 0;
                              gandhihouse helper = gandhihouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/gcc6.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Shreya Panwar ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              votesg vote = votesg();
                              vote.can6 = 0;
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 0;
                              vote.can11 = 1;
                              gandhihouse helper = gandhihouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                  ],
                )),


          ),
        ),
      ),
    );
  }
}

class nehruhousec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nehru House Captains '),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child:ListView(
                  children: <Widget>[
                    new ListTile(
                        subtitle: Text(
                            '\n          Select Your  Captain From below Candidates\n')),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/ncc1.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Deepanjal Dwivedi ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              nvotes vote = nvotes();
                              vote.can5 = 1;
                              vote.can6 = 0;
                              vote.can7 = 0;


                              nehruhouse helper = nehruhouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/ncc2.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Akshay Khanna ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {nvotes vote = nvotes();
                            vote.can5 = 0;
                            vote.can6 = 1;
                            vote.can7 = 0;


                            nehruhouse helper = nehruhouse.instance;
                            helper.insertc(vote);

                            Fluttertoast.showToast(
                              msg: "Your Vote is Registered\n"
                                  "   Thank you!!! 😊😊😊",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/ncc3.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Khushi Raina ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              nvotes vote = nvotes();
                              vote.can5 = 0;
                              vote.can6 = 0;
                              vote.can7 = 1;
                              nehruhouse helper = nehruhouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                  ],
                )),


          ),
        ),
      ),
    );
  }
}

class tagorehousec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tagore House Captains '),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child:ListView(
                  children: <Widget>[
                    new ListTile(
                        subtitle: Text(
                            '\n          Select Your  Captain From below Candidates\n'
                                '                                   (Scroll Down Too!!)\n')),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tacc1.png',
                        ),
                        new Text('             '),
                        RaisedButton(
                            child: Text('  Aditi Bhati  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can6 = 1;
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 0;
                              vote.can11= 0;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tacc2.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('  Sandra Santheesh  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can6 = 0;
                              vote.can7 = 1;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 0;
                              vote.can11= 0;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tacc3.png',
                        ),
                        new Text('         '),
                        RaisedButton(
                            child: Text('  Pranjal Malhotra  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can6 = 0;
                              vote.can7 = 0;
                              vote.can8 = 1;
                              vote.can9 = 0;
                              vote.can10 = 0;
                              vote.can11= 0;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tacc4.png',
                        ),
                        new Text('         '),
                        RaisedButton(
                            child: Text(' Shiva Shrotriya ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can6 = 0;
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 1;
                              vote.can10 = 0;
                              vote.can11= 0;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tacc5.png',
                        ),
                        new Text('         '),
                        RaisedButton(
                            child: Text(' Utkarsh Tyagi ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can6 = 0;
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 1;
                              vote.can11= 0;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tacc6.png',
                        ),
                        new Text('         '),
                        RaisedButton(
                            child: Text(' Prakriti Suman ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tavotes vote = tavotes();
                              vote.can6 = 0;
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 0;
                              vote.can11= 1;
                              tagorehouse helper = tagorehouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                  ],
                )),


          ),
        ),
      ),
    );
  }
}

class teresahousec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Teresa House Captains '),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child:ListView(
                  children: <Widget>[
                    new ListTile(
                        subtitle: Text(
                            '\n          Select Your  Captain From below Candidates\n'
                                '                                   (Scroll Down Too!!)\n')),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tcc1.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Arnav Pratap Singh ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can7 = 1;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 0;


                              teresahouse helper = teresahouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tcc2.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text(' Shreya Kushwaha  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can7 = 0;
                              vote.can8 = 1;
                              vote.can9 = 0;
                              vote.can10 = 0;


                              teresahouse helper = teresahouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tcc3.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('  Saloni Choudhary  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 1;
                              vote.can10 = 0;


                              teresahouse helper = teresahouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Image.asset(
                          'assets/tcc4.png',
                        ),
                        new Text('        '),
                        RaisedButton(
                            child: Text('  Uday Rana  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              tvotes vote = tvotes();
                              vote.can7 = 0;
                              vote.can8 = 0;
                              vote.can9 = 0;
                              vote.can10 = 1;


                              teresahouse helper = teresahouse.instance;
                              helper.insertc(vote);
                              Fluttertoast.showToast(
                                msg: "Your Vote is Registered\n"
                                    "   Thank you!!! 😊😊😊",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                    Divider(
                      height: 40.0,
                    ),
                  ],
                )),


          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,

      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(

              bottom: TabBar(tabs: [
                Tab(
                  text: 'Gandhi',
                ),
                Tab(
                  text: 'Nehru',
                ),
                Tab(text: 'Tagore'),
                Tab(text: 'Teresa'),
              ]),
              title: Text('Results'),centerTitle: true,
            ),
            drawer: MyDrawer(),
            body: TabBarView(children: [
              g1(),
              n1(),
              ta1(),
              t1(),
            ]),
          )),
    );
  }
}

class g1 extends StatefulWidget {
  // This widget is the home page of your application.
  @override
  _g2 createState() => _g2();
}
class _g2 extends State<g1> {
  bool chart = false;//vice captain chart
  bool chart2 = false;// captain chart
  bool clearstate = false;// captain chart

  double a=0;
  double b=0;
  double c=0;
  double d=0;
  double e=0;
  double f=0;
  double g=0;
  double h=0;
  double i=0;
  double j=0;
  double k=0;
  @override
  Widget build(BuildContext context) {
    gandhihouse helper = gandhihouse.instance;
    //vice captain chart data map
    Map<String, double> dataMapgvc = new Map();
    dataMapgvc.putIfAbsent("Aditi Chauhan", () => a);
    dataMapgvc.putIfAbsent("Emilyn Dinkar", () =>b);
    dataMapgvc.putIfAbsent("Ananya KR. Srivastav", () => c);
    dataMapgvc.putIfAbsent("Prachi Jha", () => d);
    dataMapgvc.putIfAbsent("Sanya Jaiswal", () => e);
    // captain data map
    Map<String, double> dataMapgc = new Map();
    dataMapgc.putIfAbsent("Daivik Keswani", () => f);
    dataMapgc.putIfAbsent("M.Faraz", () =>g);
    dataMapgc.putIfAbsent("Lakshita Kataria", () => h);
    dataMapgc.putIfAbsent("Sanskriti", () => i);
    dataMapgc.putIfAbsent("Palak sharma", () => j);
    dataMapgc.putIfAbsent("Shreya Panwar", () => k);
    //body of navigation tab for house
    return SafeArea(
        child: Scaffold(

          body: ListView(

            children: <Widget>[

              Center(
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      new Text('\n'),
                      //row for the buttons
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          //vice captain button
                          new RaisedButton(
                              child: Text('vice captain',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {

                                helper.countvotesvc();
                                 setState(() {
                                  a=ag;
                                  b=bg;
                                  c=cg;
                                  d=dg;
                                  e=eg;
                                  chart2=false;
                                  clearstate=false;
                                  chart =true;
                                });
                              })
                          ,
                          new Text('       '),

                          //captain button
                          new RaisedButton(
                              child: Text('captain',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {

                                helper.countvotesc();
                                setState(() {
                                  f=fg;
                                  g=gg;
                                  h=hg;
                                  i=ig;
                                  j=jg;
                                  k=kg;
                                  clearstate=false;
                                  chart =false;
                                  chart2 =true;
                                });
                              }),

                          new Text('       '),

                          //clear button
                          new RaisedButton(
                              child: Text('Clear',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                helper.clearg();
                                gandhihouse helper5 = gandhihouse.instance;
                                helper5.countvotesvc();
                                helper5.countvotesc();
                                setState(() {

                                  chart=false;
                                  chart2= false;
                                  clearstate=true;
                                });


                              })
                        ],
                      ),
                      //chart and button divider
                      Divider(
                        height: 20.0,
                      ),
                      //display conditions
                      chart?
                          //parent column
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          //Pie chart
                          PieChart(
                            dataMap: dataMapgvc, //Required parameter
                            legendFontColor: Colors.blueGrey[900],
                            legendFontSize: 14.0,
                            legendFontWeight: FontWeight.w500,
                            animationDuration: Duration(milliseconds: 800),
                            chartLegendSpacing: 32.0,
                            chartRadius: MediaQuery
                                .of(context)
                                .size
                                .width / 2.7,
                            showChartValuesInPercentage: true,
                            showChartValues: true,
                            showChartValuesOutside: true,
                            chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),

                            showLegends: true,
                          ),

                          // chart and row divider
                          Divider(
                            height: 20.0,
                          ),
                          //data row starts
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Aditi Chauhan', style: TextStyle(fontWeight:FontWeight.bold),),
                              new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text(a.toString(), style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //row and row divider
                          Divider(
                            height: 20.0,
                          ),

                          //row and row divider
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Emilyn Dinkar',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text(b.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //row and row divider
                          Divider(
                            height: 20.0,
                          ),


                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Ananya KR. Srivastav',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text(c.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //row and row divider
                          Divider(
                            height: 20.0,
                          ),

                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Prachi Jha',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text(d.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //row and row divider
                          Divider(
                            height: 20.0,
                          ),

                          //Last row
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Sanya Jaiswal',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  '),
                              new Text(e.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //data snd divider
                          Divider(
                            height: 20.0,
                          ),

                        ],
                      )
                      : //second condition
                      chart2?
                          //parent column
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //chart
                          PieChart(
                            dataMap: dataMapgc, //Required parameter
                            legendFontColor: Colors.blueGrey[900],
                            legendFontSize: 14.0,
                            legendFontWeight: FontWeight.w500,
                            animationDuration: Duration(milliseconds: 800),
                            chartLegendSpacing: 32.0,
                            chartRadius: MediaQuery
                                .of(context)
                                .size
                                .width / 2.7,
                            showChartValuesInPercentage: true,
                            showChartValues: true,
                            showChartValuesOutside: true,
                            chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
                            showLegends: true,
                          ),
                          //chart and row divider
                          Divider(
                            height: 20.0,
                          ),

                          // row data starts
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Daivik Keswani',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text(f.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //row and row divider
                          Divider(
                            height: 20.0,
                          ),


                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('M.Fairaz',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text(g.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //row and row divider
                          Divider(
                            height: 20.0,
                          ),


                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Lakshita Kataria',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  '),
                              new Text(h.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //row and row divider
                          Divider(
                            height: 20.0,
                          ),

                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Sanskriti',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  '),
                              new Text(h.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //row and row divider
                          Divider(
                            height: 20.0,
                          ),


                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Palak Sharma',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text(j.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //row and row divider
                          Divider(
                            height: 20.0,
                          ),

                          //Last Row
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('Shreya Panwar',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                              new Text(k.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                            ],
                          ),

                          //Data end Divider
                          Divider(
                            height: 20.0,
                          ),


                        ],
                      )
                       : //third condition
                       clearstate?
                         //parent column
                       Container(
                         padding: const EdgeInsets.all(20.0),
                         child:new Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             new Text('\n\n\n\n\n\n\n\n'),
                             new Text('The Data For Vice Captain and Captain of Gandhi House \n '
                                 '                                    Has Been Cleared',
                               style: TextStyle(fontWeight:FontWeight.w500 ),),
                           ],
                         ) ,

                       )
                         ://default actaion
                         new Text(
                             'select appropriate option',style: TextStyle(fontWeight:FontWeight.w500 ),),
                    ],
                  ))
            ],
          )
        )     );
  }
}

class n1 extends StatefulWidget {
  // This widget is the home page of your application.
  @override
  _n2 createState() => _n2();
}
class _n2 extends State<n1> {
  bool chart = false;//vice captain chart
  bool chart2 = false;// captain chart
  bool clearstate = false;// captain chart

  double a=0;
  double b=0;
  double c=0;
  double d=0;
  double e=0;
  double f=0;
  double g=0;


  @override
  Widget build(BuildContext context) {
    nehruhouse helper2 = nehruhouse.instance;
    //vice captain chart data map
    Map<String, double> dataMapnvc = new Map();
    dataMapnvc.putIfAbsent("Abhishek Thakur", () => a);
    dataMapnvc.putIfAbsent("Sreya Varghese", () =>b);
    dataMapnvc.putIfAbsent("Meher Rao", () => c);
    dataMapnvc.putIfAbsent("Vyom Paliwal", () => d);

    // captain data map
    Map<String, double> dataMapnc = new Map();
    dataMapnc.putIfAbsent("Deepanjali Dwivedi", () => e);
    dataMapnc.putIfAbsent("Akshay Khanna", () =>f);
    dataMapnc.putIfAbsent("Khushi Raina", () => g);

    //body of navigation tab for house
    return SafeArea(
        child: Scaffold(

            body: ListView(

              children: <Widget>[

                Center(
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Text('\n'),
                        //row for the buttons
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            //vice captain button
                            new RaisedButton(
                                child: Text('vice captain',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {

                                  helper2.countvotesvc();
                                  setState(() {
                                    a=an;
                                    b=bn;
                                    c=cn;
                                    d=dn;

                                    chart2=false;
                                    clearstate=false;
                                    chart =true;
                                  });
                                })
                            ,
                            new Text('       '),

                            //captain button
                            new RaisedButton(
                                child: Text('captain',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {

                                  helper2.countvotesc();
                                  setState(() {
                                    e=en;
                                    f=fn;
                                    g=gn;


                                    clearstate=false;
                                    chart =false;
                                    chart2 =true;
                                  });
                                }),

                            new Text('       '),

                            //clear button
                            new RaisedButton(
                                child: Text('Clear',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  helper2.clearn();
                                  nehruhouse helper5 = nehruhouse.instance;
                                  helper5.countvotesvc();
                                  helper5.countvotesc();
                                  setState(() {
                                    chart=false;
                                    chart2= false;
                                    clearstate=true;
                                  });

                                  print('trying to clear the data');
                                })
                          ],
                        ),
                        //chart and button divider
                        Divider(
                          height: 20.0,
                        ),
                        //display conditions
                        chart?
                        //parent column
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            //Pie chart
                            PieChart(
                              dataMap: dataMapnvc, //Required parameter
                              legendFontColor: Colors.blueGrey[900],
                              legendFontSize: 14.0,
                              legendFontWeight: FontWeight.w500,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32.0,
                              chartRadius: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.7,
                              showChartValuesInPercentage: true,
                              showChartValues: true,
                              showChartValuesOutside: true,
                              chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),

                              showLegends: true,
                            ),

                            // chart and row divider
                            Divider(
                              height: 20.0,
                            ),
                            //data row starts
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Abhishek Thakur',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(a.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            //row and row divider
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Sreya Varghese',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(b.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),


                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Meher Rao',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(c.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            // last row
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Vyom Paliwal',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(d.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //data end divider
                            Divider(
                              height: 20.0,
                            ),



                          ],
                        )
                            : //second condition
                        chart2?
                        //parent column
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //chart
                            PieChart(
                              dataMap: dataMapnc, //Required parameter
                              legendFontColor: Colors.blueGrey[900],
                              legendFontSize: 14.0,
                              legendFontWeight: FontWeight.w500,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32.0,
                              chartRadius: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.7,
                              showChartValuesInPercentage: true,
                              showChartValues: true,
                              showChartValuesOutside: true,
                              chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
                              showLegends: true,
                            ),
                            //chart and row divider
                            Divider(
                              height: 20.0,
                            ),

                            // row data starts
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Deepanjali Dwivedi',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(e.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),


                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Akshay Khanna',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(f.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            //last row
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Khushi Raina',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  '),
                                new Text(g.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //data end divider
                            Divider(
                              height: 20.0,
                            ),


                          ],
                        )
                            : //third condition
                        clearstate?
                        //parent column
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child:new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('\n\n\n\n\n\n\n\n'),
                              new Text('The Data For Vice Captain and Captain of Nehru House \n '
                                  '                                    Has Been Cleared',
                                style: TextStyle(fontWeight:FontWeight.w500 ),),
                            ],
                          ) ,

                        )://default actaion
                        new Text('Select appropriate option', style: TextStyle(fontWeight:FontWeight.w500 ),),
                      ],
                    ))
              ],
            )
        )     );
  }
}

class ta1 extends StatefulWidget {
  // This widget is the home page of your application.
  @override
  _ta2 createState() => _ta2();
}
class _ta2 extends State<ta1> {
  bool chart = false;//vice captain chart
  bool chart2 = false;// captain chart
  bool clearstate = false;// captain chart

  double a=0;
  double b=0;
  double c=0;
  double d=0;
  double e=0;
  double f=0;
  double g=0;
  double h=0;
  double i=0;
  double j=0;
  double k=0;
  @override
  Widget build(BuildContext context) {
   tagorehouse helper = tagorehouse.instance;
    //vice captain chart data map
    Map<String, double> dataMaptavc = new Map();
    dataMaptavc.putIfAbsent("Arooshi Sharma", () => a);
    dataMaptavc.putIfAbsent("Avani Thakur", () =>b);
    dataMaptavc.putIfAbsent("Sanjivini Sinha", () => c);
    dataMaptavc.putIfAbsent("Kevin Jogy", () => d);
    dataMaptavc.putIfAbsent("Harshit Nair", () => e);
    // captain data map
    Map<String, double> dataMaptac = new Map();
    dataMaptac.putIfAbsent("Aditi Bhati", () => f);
    dataMaptac.putIfAbsent("Sandra Santhesh", () =>g);
    dataMaptac.putIfAbsent("Pranjal Malhotra", () => h);
    dataMaptac.putIfAbsent("Shiva Shrotriya", () => i);
    dataMaptac.putIfAbsent("Utkarsh Tyagi", () => j);
    dataMaptac.putIfAbsent("Prakriti Suman", () => k);
    //body of navigation tab for house
    return SafeArea(
        child: Scaffold(

            body: ListView(

              children: <Widget>[

                Center(
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Text('\n'),
                        //row for the buttons
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            //vice captain button
                            new RaisedButton(
                                child: Text('vice captain',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {

                                  helper.countvotesvc();
                                  setState(() {
                                    a=ata;
                                    b=bta;
                                    c=cta;
                                    d=dta;
                                    e=eta;
                                    chart2=false;
                                    clearstate=false;
                                    chart =true;
                                  });
                                })
                            ,
                            new Text('       '),

                            //captain button
                            new RaisedButton(
                                child: Text('captain',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {

                                  helper.countvotesc();
                                  setState(() {
                                    f=fta;
                                    g=gta;
                                    h=hta;
                                    i=ita;
                                    j=jta;
                                    k=kta;
                                    clearstate=false;
                                    chart =false;
                                    chart2 =true;
                                  });
                                }),

                            new Text('       '),

                            //clear button
                            new RaisedButton(
                                child: Text('Clear',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  helper.clearta();
                                  tagorehouse helper7 = tagorehouse.instance;
                                  helper7.countvotesvc();
                                  helper7.countvotesc();
                                  setState(() {
                                    chart=false;
                                    chart2= false;
                                    clearstate=true;
                                  });


                                })
                          ],
                        ),
                        //chart and button divider
                        Divider(
                          height: 20.0,
                        ),
                        //display conditions
                        chart?
                        //parent column
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            //Pie chart
                            PieChart(
                              dataMap: dataMaptavc, //Required parameter
                              legendFontColor: Colors.blueGrey[900],
                              legendFontSize: 14.0,
                              legendFontWeight: FontWeight.w500,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32.0,
                              chartRadius: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.7,
                              showChartValuesInPercentage: true,
                              showChartValues: true,
                              showChartValuesOutside: true,
                              chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),

                              showLegends: true,
                            ),

                            // chart and row divider
                            Divider(
                              height: 20.0,
                            ),
                            //data row starts
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Arooshi Sharma', style: TextStyle(fontWeight:FontWeight.bold),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(a.toString(), style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            //row and row divider
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Avani Thakur',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(b.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),


                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Sanjivini Sinha',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(c.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Kevin Jogy',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(d.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            //Last row
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Harshit Nair',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  '),
                                new Text(e.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //data snd divider
                            Divider(
                              height: 20.0,
                            ),

                          ],
                        )
                            : //second condition
                        chart2?
                        //parent column
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //chart
                            PieChart(
                              dataMap: dataMaptac, //Required parameter
                              legendFontColor: Colors.blueGrey[900],
                              legendFontSize: 14.0,
                              legendFontWeight: FontWeight.w500,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32.0,
                              chartRadius: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.7,
                              showChartValuesInPercentage: true,
                              showChartValues: true,
                              showChartValuesOutside: true,
                              chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
                              showLegends: true,
                            ),
                            //chart and row divider
                            Divider(
                              height: 20.0,
                            ),

                            // row data starts
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Aditi Bhati',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(f.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),


                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Sandra Santhesh',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(g.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),


                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Pranjal Malhotra',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  '),
                                new Text(h.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Shiva Shrotriya',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  '),
                                new Text(h.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),


                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Utkarsh Tyagi',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(j.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            //Last Row
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Prakriti Suman',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold ),),
                                new Text(k.toString(),style: TextStyle(fontWeight:FontWeight.bold ),),
                              ],
                            ),

                            //Data end Divider
                            Divider(
                              height: 20.0,
                            ),


                          ],
                        )
                            : //third condition
                        clearstate?
                        //parent column
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child:new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('\n\n\n\n\n\n\n\n'),
                              new Text('The Data For Vice Captain and Captain of Tagore House \n '
                                  '                                    Has Been Cleared',
                                style: TextStyle(fontWeight:FontWeight.w500 ),),
                            ],
                          ) ,

                        )://default actaion
                        new Text(
                          'select appropriate option',style: TextStyle(fontWeight:FontWeight.w500 ),),
                      ],
                    ))
              ],
            )
        )     );
  }
}

class t1 extends StatefulWidget {
  // This widget is the home page of your application.
  @override
  _t2 createState() => _t2();
}
class _t2 extends State<t1> {
  bool chart = false;//vice captain chart
  bool chart2 = false;// captain chart
  bool clearstate = false;// captain chart

  double a=0;
  double b=0;
  double c=0;
  double d=0;
  double e=0;
  double f=0;
  double g=0;
  double h=0;
  double i=0;
  double j=0;

  @override
  Widget build(BuildContext context) {
    teresahouse helper = teresahouse.instance;
    //vice captain chart data map
    Map<String, double> dataMaptvc = new Map();
    dataMaptvc.putIfAbsent("Ananya Srivastav", () => a);
    dataMaptvc.putIfAbsent("Manya Sawhney", () =>b);
    dataMaptvc.putIfAbsent("Ritika Thakur", () => c);
    dataMaptvc.putIfAbsent("Riya Bhati", () => d);
    dataMaptvc.putIfAbsent("Tisya Sharma", () => e);
    dataMaptvc.putIfAbsent("Yuvika Mishra", () => f);
    // captain data map
    Map<String, double> dataMaptc = new Map();

    dataMaptc.putIfAbsent("Arnav Pratap Singh", () =>g);
    dataMaptc.putIfAbsent("Shreya Kushwaha", () => h);
    dataMaptc.putIfAbsent("Saloni Choudhary", () => i);
    dataMaptc.putIfAbsent("Uday Rana", () => j);
   
    //body of navigation tab for house
    return SafeArea(
        child: Scaffold(

            body: ListView(

              children: <Widget>[

                Center(
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        new Text('\n'),
                        //row for the buttons
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            //vice captain button
                            new RaisedButton(
                                child: Text('vice captain',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {

                                  helper.countvotesvc();
                                  setState(() {
                                    a=at;
                                    b=bt;
                                    c=ct;
                                    d=dt;
                                    e=et;
                                    f=ft;
                                    chart2=false;
                                    clearstate=false;
                                    chart =true;
                                  });
                                })
                            ,
                            new Text('       '),

                            //captain button
                            new RaisedButton(
                                child: Text('captain',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {

                                  helper.countvotesc();
                                  setState(() {

                                    g=gt;
                                    h=ht;
                                    i=it;
                                    j=jt;

                                    clearstate=false;
                                    chart =false;
                                    chart2 =true;
                                  });
                                }),

                            new Text('       '),

                            //clear button
                            new RaisedButton(
                                child: Text('Clear',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  helper.cleart();
                                  teresahouse helper5 = teresahouse.instance;
                                  helper5.countvotesvc();
                                  helper5.countvotesc();
                                  setState(() {
                                    chart=false;
                                    chart2= false;
                                    clearstate=true;
                                  });


                                })
                          ],
                        ),
                        //chart and button divider
                        Divider(
                          height: 20.0,
                        ),
                        //display conditions
                        chart?
                        //parent column
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            //Pie chart
                            PieChart(
                              dataMap: dataMaptvc, //Required parameter
                              legendFontColor: Colors.blueGrey[900],
                              legendFontSize: 14.0,
                              legendFontWeight: FontWeight.w500,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32.0,
                              chartRadius: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.7,
                              showChartValuesInPercentage: true,
                              showChartValues: true,
                              showChartValuesOutside: true,
                              chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),

                              showLegends: true,
                            ),

                            // chart and row divider
                            Divider(
                              height: 20.0,
                            ),
                            //data row starts
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Ananya Srivastav',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text(a.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            //row and row divider
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Manya Sawhney',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  '),
                                new Text(b.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),


                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Ritika Thakur',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  '),
                                new Text(c.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Riya Bhati',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  '),
                                new Text(d.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),


                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Tisya Sharma',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  '),
                                new Text(e.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Yuvika Mishra',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  '),
                                new Text(f.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            // Data end divider
                            Divider(
                              height: 20.0,
                            ),


                          ],
                        )
                            : //second condition
                        chart2?
                        //parent column
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //chart
                            PieChart(
                              dataMap: dataMaptc, //Required parameter
                              legendFontColor: Colors.blueGrey[900],
                              legendFontSize: 14.0,
                              legendFontWeight: FontWeight.w500,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32.0,
                              chartRadius: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.7,
                              showChartValuesInPercentage: true,
                              showChartValues: true,
                              showChartValuesOutside: true,
                              chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
                              showLegends: true,
                            ),
                            //chart and row divider
                            Divider(
                              height: 20.0,
                            ),

                            // row data starts

                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Arnav Pratap Singh',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  '),
                                new Text(g.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),


                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Shreya Kushwaha',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  '),
                                new Text(h.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Saloni Choudhary',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  '),
                                new Text(h.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            //row and row divider
                            Divider(
                              height: 20.0,
                            ),

                             //Last Row
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text('Uday Rana',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text('  :  ',style: TextStyle(fontWeight:FontWeight.bold )),
                                new Text(j.toString(),style: TextStyle(fontWeight:FontWeight.bold )),
                              ],
                            ),

                            //Data end divider
                            Divider(
                              height: 20.0,
                            ),


                          ],
                        )
                            : //third condition
                        clearstate?
                        //parent column
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child:new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('\n\n\n\n\n\n\n\n'),
                              new Text('The Data For Vice Captain and Captain of Teresa House \n '
                                  '                                    Has Been Cleared',
                                style: TextStyle(fontWeight:FontWeight.w500 ),),
                            ],
                          ) ,

                        )://default actaion
                        new Text('select appropriate option',style: TextStyle(fontWeight:FontWeight.w500 ),),
                      ],
                    ))
              ],
            )
        )     );
  }
}


























/*Center(
child: Container(
padding: const EdgeInsets.all(20.0),
child: Center(
child:ListView(
          children: <Widget>[

          ],
        )),


),
)*/

/*

                        */