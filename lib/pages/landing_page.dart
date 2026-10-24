import 'package:flutter/material.dart';




class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPage();
  
}

class _LandingPage extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 1. Full background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/background4.jpg',
                fit: BoxFit.cover,
              ),
            ),
            
            // 2. Foreground column containing your logo (now correctly inside the Stack list)
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(80),
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        'assets/images/logo_transparent.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    child: Text('Sign in',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                    )),
                    onPressed: () {

                        Navigator.of(context).pushNamed('/SignupPage', arguments: 'Hello');
                    }
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

