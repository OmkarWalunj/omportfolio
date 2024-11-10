import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/about.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/data.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/video.dart';


class Project extends StatefulWidget {
   final String title;
  final String subtitle;
  final List<String> description;
  final String techstack;
  final String videourl;
  final int index;
  const Project({super.key, required this.title, required this.subtitle, required this.description, required this.techstack, required this.videourl,required this.index});

  @override
  State<Project> createState() => _Project();
}

class _Project extends State<Project> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        //  Navigate to the next screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ResponsiveProjectCard1(url: projects[widget.index]['videoUrl'], index:widget.index ,)),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.arrow_forward),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          bool isMobile = screenWidth < 600;
          bool isTablet = screenWidth >= 600 && screenWidth < 1024;
          bool isDesktop = screenWidth >= 1024;

          double cardWidth = isMobile ? screenWidth * 0.9 : (isTablet ? screenWidth * 0.7 : screenWidth * 0.7);
          double cardHeight = isMobile ? 600 : (isTablet ? 500 :  600);

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF3533CD)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Center(
              child: GestureDetector(
                onTapDown: (_) => setState(() => _scale = 1.05),
                onTapUp: (_) => setState(() => _scale = 1.0),
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: _opacity,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    width: cardWidth,
                    height: cardHeight,
                    transform: Matrix4.identity()..scale(_scale),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Flex(
                      direction: isMobile ? Axis.vertical : Axis.horizontal,
                      children: _buildCardContent(isMobile, isTablet, isDesktop),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildCardContent(bool isMobile, bool isTablet, bool isDesktop) {
    double titleFontSize = isDesktop ? 30 : (isTablet ? 24 : 20);
    double subtitleFontSize = isDesktop ? 20 : (isTablet ? 16 : 14);
    double bodyFontSize = isDesktop ? 18 : (isTablet ? 14 : 12);

    return [
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
      const SizedBox(width: 20, height: 20),
      Expanded(
        child: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.blue
            //border: Border.all(width: 5,color: Colors.blueAccent)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    "  ${widget.title}  ",
                    style: GoogleFonts.dancingScript( 
                    color: const Color.fromARGB(255, 121, 65, 45),
                    fontSize: titleFontSize,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                ),
              ),
               const SizedBox(height: 40,),
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "• ${widget.description[0]}\n"
                "• ${widget.description[1]}",
                style: TextStyle(
                  fontSize: bodyFontSize,
                  color: Color.fromRGBO(255, 215, 0, 1),
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              Text(
                "Tech Stack",
                style: TextStyle(
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.techstack,
                style: TextStyle(
                  fontSize: bodyFontSize,
                  color: Color.fromRGBO(255, 215, 0, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}


