import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omar\'s portofolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _isAnimationCompleted = true;
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background section
          AnimatedBackground(animation: _animation),

          // Main content section
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner section
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    /*gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.pinkAccent,
                        Colors.blue,
                      ],
                    ),*/
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(.3),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        //Row()
                        CircleAvatar(
                          radius: 100,
                          backgroundImage:AssetImage('assets/images/meee.jpeg'),

                        ),
                        SizedBox(height: 10),
                        Text(
                          '    Hello! I am omar almas',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '  And That \'s my portofolio',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Quote(
                            text: '"Commitment and hard work are better than intelligence."',
                            author: '"small baby steps can differ"',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialMediaButton(
                      icon: Icons.mail_outline,
                      color: Colors.red,
                      text: 'email',
                      url: 'omaralmas262@gmail.com',
                    ),
                    SocialMediaButton(
                      icon: Icons.code,
                      color: Colors.green,
                      text: 'Guithub',
                      url: 'https://github.com/Maso2000',
                    ),
                    SocialMediaButton(
                      icon: Icons.link,
                      color: Colors.blue,
                      text: 'Linkedin',
                      url: 'https://www.linkedin.com/in/omar-almas-33366625a/',
                    ),
                    SocialMediaButton(
                      icon: Icons.person,
                      color: Colors.purple,
                      text: 'My resume',
                      url: 'https://docs.google.com/document/d/1Z0CZso09jOT4SUjUkWN0BGnH5_6iubZMTTc4GWW0v04/edit',
                    ),
                  ],
                ),
                // Introduction section
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 30,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'I am a software engineer ,graduated from faculty of engineering Alexandria University,I am An eager learner, hard worker, love problem solving and team work.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Skills',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: [
                          SkillChip('Python'),
                          SkillChip('Java'),
                          SkillChip('Kotlin'),
                          SkillChip('Javascript'),
                          SkillChip('C++/C'),
                          SkillChip('C#'),
                          SkillChip('PHP'),
                          SkillChip('SQL'),
                          SkillChip('MySQL'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Projects that I am proud of',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      ProjectCard(
                        title: 'Restaurant reservation system',
                        description:
                        'A restaurent reservation system done using java,applying object oriented programming principles .'
                        'The project was divided in admin side and client side.' 'Has a stunning user interface .',
                        image:'assets/images/submitt.png',

                        projectUrl: 'https://github.com/Maso2000/Restaurant_Reservation_System',
                      ),
                      SizedBox(height: 20),
                      ProjectCard(
                        title: 'Aggarly',
                        description:
                        'A car rental website ,developed using php and sql for the backend and database.'
                        'Html ,Css and JavaScript for the frontend.' 'The project was divided in client side and server side.',
                        image:'assets/images/submitt.png',
                        projectUrl: 'https://github.com/Maso2000/Car_Rental_System',
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Let\'s Connect',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'If you\'d like to discuss a project or just say hi, feel free to drop me an email at ',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () => launch('omaralmas262@gmail.com'),
                        child: Text(
                          'omaralmas262@gmail.com',
                          style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.indigo[900],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String projectUrl;

  ProjectCard({
    required this.title,
    required this.description,
    required this.image,
    required this.projectUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Card(

        color: Colors.grey[800],

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //width: 100,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () => launch(projectUrl),
                    child: Text(
                      'Learn more',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBackground extends StatelessWidget {
  final Animation<double> animation;
  final Random random = Random();

  AnimatedBackground({required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(00000),
              ],
            ),
          ),
        );
      },
    );
  }
}
class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final String url;

  SocialMediaButton({
    required this.icon,
    required this.color,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton.extended(
      backgroundColor: Colors.black54,
      icon: Icon(
        icon,
        color: Colors.indigo[900],

      ),

      //color: color,
      onPressed: () {
        launch(url);
      }, label: Text(text),

    );

  }
}class Quote extends StatelessWidget {
  final String text;
  final String author;

  Quote({required this.text, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            author,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ],
      ),
    );
  }
}