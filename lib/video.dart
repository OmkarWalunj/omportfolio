import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/about.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/data.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/project.dart';

import 'package:video_player/video_player.dart';
class ResponsiveProjectCard1 extends StatefulWidget {
 final String url;
 final int index;
  const ResponsiveProjectCard1({super.key,required this.url, required this.index});

  @override
  State<ResponsiveProjectCard1> createState() => _ResponsiveProjectCardState();
}

class _ResponsiveProjectCardState extends State<ResponsiveProjectCard1> with SingleTickerProviderStateMixin {
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
                      MaterialPageRoute(builder: (context) =>  AboutPage()),
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
          //Navigate to the next screen
          if(widget.index+1< projects.length) {
            Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => Project(
      title: projects[widget.index+1]['title'] ?? "Title", 
      subtitle: projects[widget.index+1]['subtitle'] ?? "No subtitle", 
      description: List<String>.from(projects[widget.index+1]['description'] ?? []), 
      techstack: (projects[widget.index+1]['techStack'] ?? []).join(', '), 
      videourl: projects[widget.index+1]['videoUrl'] ?? "",
      index: widget.index+1,
    ),
  ),
);

          }
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
  child: LayoutBuilder(
    builder: (context, constraints) {
      // Determine if the screen size is mobile, tablet, or desktop
      bool isMobile = constraints.maxWidth < 600;
      bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
      
      // Adjust the height and width based on the device type
      double height = isMobile ? 220 : (isTablet ? 300 : 200);
      double width = isMobile ? 250 : (isTablet ? 400 : 400);
      
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: VideoPlayerScreen(videoUrl: widget.url),
          ),
        ],
      );
    },
  ),
),

    ];
  }
}

 class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late FlickManager _flickManager;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl);
    _flickManager = FlickManager(
      videoPlayerController: _controller,
    );
    _controller.initialize().then((_) {
      setState(() {}); // Refresh after initialization
      _controller.play(); // Start playing video automatically
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
  flickManager: _flickManager,
  
);
  }
}
