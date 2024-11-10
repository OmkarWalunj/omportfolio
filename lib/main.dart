
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/about.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/data.dart';
import 'package:portfolio/project.dart';
import 'package:url_launcher/url_launcher.dart';


void main() async{
  
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.orangeAccent,
              ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: PortfolioHomePage(),
    );
  }
}



class PortfolioHomePage extends StatefulWidget {
  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      appBar: AppBar(
        title: Text(
          "Omkar Portfolio",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2D2F41),
        actions: [
          TextButton(onPressed: () {
             Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PortfolioHomePage()),
                    );
          }, child: Text("Home", style: TextStyle(color: Colors.orangeAccent,))),
          TextButton(onPressed: () {
Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const OmkarPortfolio()),
                    );
          }, child: Text("Projects", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () {
Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
          }, child: Text("About", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () {
Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    );
          }, child: Text("Contact", style: TextStyle(color: Colors.white))),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF3533CD)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: _opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WELCOME TO MY PORTFOLIO!",
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 24,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(height: 10),
                ScaleTransition(
                  scale: _animation,
                  child: CircleAvatar(
                    radius: isMobile ? 60 : 150,
                    backgroundImage: AssetImage('assets/images/image.jpg'), // Replace with your image
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Omkar Walunj",
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Computer Engineer | Flutter Developer | Java Developer",
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 20,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const OmkarPortfolio()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 40,
                      vertical: isMobile ? 10 : 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Explore My Work",
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      
                      onTap: () => _launchURL("https://github.com/OmkarWalunj"), // Replace with GitHub URL
                      child: CircleAvatar( 
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/github.jpg'),
                      )
                    ),
                    const SizedBox(width: 50,),
                    GestureDetector(
                      
                      onTap: () => _launchURL("https://www.linkedin.com/in/omkar-walunj-b4a4a521b/"), // Replace with GitHub URL
                      child: CircleAvatar( 
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/linkedin.jpg'),
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OmkarPortfolio extends StatefulWidget {
  const OmkarPortfolio({super.key});

  @override
  State createState() => _OmkarPortfolioState();
}
class _OmkarPortfolioState extends State<OmkarPortfolio> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _containerScale = 0.8;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _containerScale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          "Omkar Portfolio",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2D2F41),
        actions: [
          TextButton(onPressed: () {
             Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PortfolioHomePage()),
                    );
          }, child: Text("Home", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () {
Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const OmkarPortfolio()),
                    );
          }, child: Text("Projects", style: TextStyle(color: Colors.orangeAccent,))),
          TextButton(onPressed: () {
Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
          }, child: Text("About", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () {
Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    );
          }, child: Text("Contact", style: TextStyle(color: Colors.white))),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          bool isMobile = screenWidth < 600;
          bool isTablet = screenWidth >= 600 && screenWidth < 1024;
          bool isDesktop = screenWidth >= 1024;

          double containerWidth = isMobile ? screenWidth * 0.9 : (isTablet ? screenWidth * 0.7 : screenWidth * 0.7);
          double containerHeight = isMobile ? 500 : (isTablet ? 600 : 600);
          double imageWidth = isMobile ? containerWidth * 0.5 : (isTablet ? containerWidth * 0.3 : containerWidth * 0.4);

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF3533CD)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _opacity,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  width: containerWidth * _containerScale,
                  height: containerHeight * _containerScale,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    children: _buildContent(isMobile, isTablet, isDesktop, imageWidth),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      // Floating Action Button for navigation
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => Project(
      title: projects[0]['title'] ?? "Title", 
      subtitle: projects[0]['subtitle'] ?? "No subtitle", 
      description: List<String>.from(projects[0]['description'] ?? []), 
      techstack: (projects[0]['techStack'] ?? []).join(', '), 
      videourl: projects[0]['videoUrl'] ?? "",
      index: 0,
    ),
  ),
);

        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  List<Widget> _buildContent(bool isMobile, bool isTablet, bool isDesktop, double imageWidth) {
    double titleFontSize = isDesktop ? 55 : (isTablet ? 24 : 20);
    double subtitleFontSize = isDesktop ? 35 : (isTablet ? 20 : 16);
    double bodyFontSize = isDesktop ? 30 : (isTablet ? 16 : 14);

    return [
      Container(
        width: imageWidth,
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/abc.png',
          fit: BoxFit.contain,
           repeat: ImageRepeat.noRepeat, 
        ),
      ),
      const SizedBox(width: 20, height: 20),
      Flexible(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://img.icons8.com/?size=100&id=7I3BjCqe9rjG&format=png&color=000000',
                    width: isMobile ? 60 : (isTablet ? 80 : 100),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Flutter",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      Text(
                        "App Development",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: subtitleFontSize),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 2),
                child: Text(
                  "Projects by",
                  style: GoogleFonts.dancingScript( 
                      color: const Color.fromARGB(255, 121, 65, 45),
                      fontSize: subtitleFontSize,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600
                    ),
                ),
              ),
              const SizedBox(height: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
             
                width: 400,
                margin: const EdgeInsets.all(15),
                decoration: const BoxDecoration( 
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                     color: Colors.orange,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Er. Omkar Walunj",
                  style: GoogleFonts.dancingScript( 
                    color: const Color.fromARGB(255, 121, 65, 45),
                    fontSize: titleFontSize,
                  )
                ),
              ),
              const SizedBox(height: 10),
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 2),
                child: Column(
                  children: [
                    Text(
                      "Software Developer,",
                      style: GoogleFonts.dancingScript(
                        color: const Color.fromARGB(255, 121, 65, 45),
                        fontSize: bodyFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Techie",
                      style: GoogleFonts.dancingScript(
                        color: const Color.fromARGB(255, 121, 65, 45),
                        fontSize: bodyFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}


