import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom nav bar',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _seletedItem = 0; // page index
  final _pages = [
    // Insert your pages here
    Page1(),
    Page2(),
  ];
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // if false - white background behind nav bar
      body: PageView(
        // use you physics
        physics: BouncingScrollPhysics(),
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _seletedItem = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 90),
        decoration: BoxDecoration(
            // your gradient
            gradient: LinearGradient(colors: [Colors.cyanAccent, Colors.blue]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),

        /// Material widget needs only for splash tap
        child: Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                splashColor: Colors.red,
                splashRadius: 22,
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    _seletedItem = 0;
                    _pageController.animateToPage(_seletedItem,
                        duration: Duration(seconds: 1),
                        // bounceOut
                        // fastOutSlowIn
                        curve: Curves.fastOutSlowIn);
                    print(_seletedItem.toString());
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.mail),
                splashColor: Colors.yellow,
                splashRadius: 22,
                onPressed: () {
                  setState(() {
                    _seletedItem = 1;
                    _pageController.animateToPage(_seletedItem,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                    print(_seletedItem.toString());
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text('Page1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text('Page2'),
      ),
    );
  }
}
