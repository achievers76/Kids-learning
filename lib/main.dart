import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const PariKidsLkgApp());
}

class PariKidsLkgApp extends StatelessWidget {
  const PariKidsLkgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pari Kids - ICSE LKG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFFFF9C4),
      ),
      home: const LkgSyllabusHomeScreen(),
    );
  }
}

class VoiceHelper {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> speak(String text) async {
    await _tts.stop();
    await _tts.setLanguage("en-IN");
    await _tts.setPitch(1.25);
    await _tts.setSpeechRate(0.42);
    await _tts.speak(text);
  }
}

class LkgSyllabusHomeScreen extends StatelessWidget {
  const LkgSyllabusHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 650;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Pari Kids • ICSE LKG App",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: const Color(0xFF0D47A1)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Namaste Beta! Aao Seekhte Hain",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 28 : 22,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          VoiceHelper.speak("Chalo English section me chalte hain");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const EnglishSectionScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFB74D),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        icon: const Icon(Icons.menu_book),
                        label: Text("English Section", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          VoiceHelper.speak("Chalo Maths section me chalte hain");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const MathsSectionScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF81C784),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        icon: const Icon(Icons.calculate),
                        label: Text("Maths Section", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EnglishSectionScreen extends StatelessWidget {
  const EnglishSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFFB74D), title: Text("English Learning", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
      body: Center(
        child: Text("English Section Active!", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: const Color(0xFF0D47A1))),
      ),
    );
  }
}

class MathsSectionScreen extends StatelessWidget {
  const MathsSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF81C784), title: Text("Maths Learning (1-20)", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
      body: Center(
        child: Text("Maths Section Active!", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: const Color(0xFF0D47A1))),
      ),
    );
  }
}
