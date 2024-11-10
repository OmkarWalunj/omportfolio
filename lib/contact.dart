import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/about.dart';
import 'package:portfolio/main.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import for URL launching

class ContactPage extends StatelessWidget {
  final String resumeUrl = 'https://drive.google.com/file/d/1Iq8iM9z6jMaFcjzfz2kdNcB5lBRrGKvN/view?usp=sharing'; // Replace with your PDF URL

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
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PortfolioHomePage()),
                );
              },
              child: Text("Home", style: TextStyle(color: Colors.white))),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OmkarPortfolio()),
                );
              },
              child: Text("Projects", style: TextStyle(color: Colors.white))),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
              child: Text("About", style: TextStyle(color: Colors.white))),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
              child: Text("Contact", style: TextStyle(color: Colors.orangeAccent))),
          // Add Resume button
          TextButton(
              onPressed: _downloadResume,
              child: Text("Resume", style: TextStyle(color: Colors.white))),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                      'Get in Touch',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isDesktop ? 48 : isTablet ? 36 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'I would love to hear from you! Whether you have a question, a project proposal, or just want to connect, feel free to reach out.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: isDesktop ? 20 : isTablet ? 18 : 16,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Contact Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isDesktop ? 36 : isTablet ? 28 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    ContactDetailRow(
                      icon: Icons.email,
                      detail: 'omkarwalunj1704@gmail.com',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    ContactDetailRow(
                      icon: Icons.phone,
                      detail: '+91 8767886904',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    ContactDetailRow(
                      icon: Icons.location_on,
                      detail: 'Pune, India',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
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

  void _downloadResume() async {
    if (await canLaunch(resumeUrl)) {
      await launch(resumeUrl);
    } else {
      throw 'Could not launch $resumeUrl';
    }
  }
}

class ContactDetailRow extends StatelessWidget {
  final IconData icon;
  final String detail;
  final bool isDesktop;
  final bool isTablet;

  ContactDetailRow({
    required this.icon,
    required this.detail,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white70,
            size: isDesktop ? 28 : isTablet ? 24 : 20,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              detail,
              style: TextStyle(
                color: Colors.white70,
                fontSize: isDesktop ? 20 : isTablet ? 18 : 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
