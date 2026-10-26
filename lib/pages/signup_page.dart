import 'package:flutter/material.dart';
import 'package:my_first_project/utils/input_validators.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();

}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var autoValidationMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 1. Centered Form Content
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: autoValidationMode,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(
                              'assets/images/solar-sun-logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        Center(
                          child: Text('Welcome Back',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        SizedBox(height: 5),

                        Center(
                          child: Text('Sign in with your company account to continue.',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        Text('Work Email',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold
                        )),

                        const SizedBox(height: 5),
                        
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.2),
                              width: 0.7
                            )
                          ),
                          padding: EdgeInsets.fromLTRB(15, 0, 10,10),                          
                          child: TextFormField(
                            decoration: const InputDecoration(hintText: 'you@company.com',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            autofocus: false,
                            validator: Validators.email,
                          ),
                        ),

                        const SizedBox(height: 9),

                        Text('Password',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold
                        )),

                        const SizedBox(height: 5),

                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.2),
                              width: 0.7
                            )
                          ),
                          padding: EdgeInsets.fromLTRB(15, 0, 10,10),                          
                          child: TextFormField(
                            decoration: const InputDecoration(hintText: 'Enter your password',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            autofocus: false,
                            obscureText: true,
                            validator: Validators.password,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Center(
                          child: SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  autoValidationMode = AutovalidateMode.onUserInteraction;
                                });
                          
                                if (_formKey.currentState!.validate()) {
                                  // All fields valid: proceed with submission logic
                                }
                              },
                              child: const Text('Sign in'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 2. Home Button locked to the Top Left corner
            Positioned(
              top: 10,
              left: 10,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Goes back to previous screen
                },
                icon: const Icon(Icons.arrow_back, size: 16),
                label: const Text('Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}