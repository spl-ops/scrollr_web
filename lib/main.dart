import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollr_web/firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure proper async calls
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScrollrApp());
}

class ScrollrApp extends StatelessWidget {
  const ScrollrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ObsidianHomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

class ObsidianHomePage extends StatelessWidget {
  const ObsidianHomePage({Key? key}) : super(key: key);

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse("$url"), webOnlyWindowName: "_blank")) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset(
              "s.png",
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "scrollr",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Theme(
              data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor:
                      Colors.blue.withOpacity(0.7), // Highlight color
                  // cursorColor: Colors.red, // Cursor color
                ),
              ),
              child: const SelectableText(
                "splopshq@proton.me",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo and menu
                Image.asset(
                  "s.png",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 16),
                // Main content
                Column(
                  children: [
                    const Text(
                      "auto scroll app for macOS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Buttons
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _launchUrl("https://youtu.be/8Mhtyn4EcVk");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            "demo",
                            style: TextStyle(
                              fontSize: 20,
                              color: const Color.fromRGBO(0, 122, 255, 1),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _launchUrl(
                                "http://buymeacoffee.com/scrollr/e/351273");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(0, 122, 255, 1),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            "get scrollr",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 100),

                    // Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "if it helped you, please consider to    ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          InkWell(
            onTap: () => _launchUrl("https://buymeacoffee.com/scrollr"),
            child: Image.asset(
              "bmc.png",
              height: 50,
              width: 100,
            ),
          ),
          const Text(
            "  cheers.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white70,
        ),
      ),
    );
  }
}
