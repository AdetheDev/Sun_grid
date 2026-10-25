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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // 2. Foreground content centered on screen
            Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo widget
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 120, 50, 10),
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        'assets/images/solar-sun-logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 5), 

                  Text('SunGrid',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                    ),
                  ),

                  const SizedBox(height: 5), 
                  Text('Solar service, in sync',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text('Keep every solar site in view.',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey
                    ),
                  ),

                  const SizedBox(height: 10), 
                  
                  Text('Spot systems that need attention,\ngive technicians the context to act,\nand keep service outcomes connected..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                    ),
                  ),

                  const SizedBox(height: 50), // Spacing between logo and button

                  // Navigation Button widget
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(20, 105, 83,1),
                    ),
                    child: TextButton.icon(
                      label: const Text(
                        'sign in / create account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/SignupPage', 
                          arguments: 'Hello',
                        );
                      },
                      icon: Icon(Icons.forward_rounded,
                      color: Colors.white),
                    ),
                  ),

                  SizedBox(height: 15),
                  Text('For authorized field team members.\nNew users need a company invitation code.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey
                  ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}