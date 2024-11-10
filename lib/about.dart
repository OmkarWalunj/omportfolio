import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/main.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          }, child: Text("Projects", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () {
Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
          }, child: Text("About", style: TextStyle(color: Colors.orangeAccent))),
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
          // Determine the layout based on the available width
          bool isDesktop = constraints.maxWidth >= 1000;
          bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1000;

          double contentWidth = isDesktop
              ? 800
              : isTablet
                  ? constraints.maxWidth * 0.85
                  : constraints.maxWidth * 0.95;

          return Container(
             decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF3533CD)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Center(
              child: Container(
                width: contentWidth,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isDesktop ? 48 : isTablet ? 36 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Hello! I am Omkar Walunj, a passionate and experienced developer with expertise in various programming languages and frameworks. I have a strong background in full-stack development and enjoy building scalable and user-friendly applications.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: isDesktop ? 20 : isTablet ? 18 : 16,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Skills',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isDesktop ? 36 : isTablet ? 28 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        SkillChip(skill: 'Flutter'),
                        SkillChip(skill: 'Dart'),
                        SkillChip(skill: 'Java'),
                        SkillChip(skill: 'Python'),
                        SkillChip(skill: 'C'),
                        SkillChip(skill: 'DSA'),
                        SkillChip(skill: 'Spring Boot'),
                        SkillChip(skill: 'Django'),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Values',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isDesktop ? 36 : isTablet ? 28 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'I believe in writing clean, efficient, and maintainable code. I am committed to lifelong learning and am always looking for ways to improve my skills and stay updated with the latest technologies.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: isDesktop ? 20 : isTablet ? 18 : 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  SkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        skill,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[800],
    );
  }
}
