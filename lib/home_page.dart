import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final List<String> imagePaths = [
    'assets/team.png',
    'assets/image.jpg',
    'assets/im.jpg',
    'assets/health.jpg',
    
  ];
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (_currentPage < imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text('⚕️', style: TextStyle(fontSize: 35)), 
            SizedBox(width: 9), //  spacing between the text and the emoji
            Text(
              'Wellness World',
              style: TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),
     body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
           Expanded(
            flex: 6,
            child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 15.0, // Space between the buttons
              runSpacing: 20.0, // Space between rows of buttons
              children: <Widget>[
                _buildButton(context, 'Appointments', '📅', '/rendezvous'),
                _buildButton(context, 'Doctors List', '👩‍⚕️', '/listemedecins'),
                _buildButton(context, 'Appointments List', '📋', '/listerdv'),
                _buildButton(context, 'Patient Documents', '📄', '/documents'),
                _buildButton(context, 'Emergency', '🚑', '/urgence'),
                _buildButton(context, 'Contact Us', '📞', '/contact'),
      ],
    ),
  ),
),
          ],
        ),
      );
    
  }
   Widget _buildButton(BuildContext context, String text, String emoji, String route) {
    return SizedBox(
    width: MediaQuery.of(context).size.width / 3 - 20, // Adjust button width based on screen width
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route); // means when when the button is pressed 3aymshi new page lihiya ktbnaha f route
        },
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            Text(
              emoji,
              style: TextStyle(fontSize: 40), // Emoji size
            ),
            SizedBox(height: 10), // Space between emoji and text
            SizedBox(width: 9),
            Text(
              text,
              style: TextStyle(
                fontSize: 17, // Text size
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}