import 'package:flutter/material.dart';
import 'package:my_first_project/utils/input_validators.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState(); // Fixed state class name reference
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
        child: SingleChildScrollView( // Added to prevent keyboard overflow
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Part 2: Form with custom validators
                  Padding(
                    padding: const EdgeInsets.all(190),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: autoValidationMode,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Full Name',
                            ),
                            validator: (value) => Validators.required(value, "Full Name"),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            decoration: const InputDecoration(labelText: 'Email'),
                            autofocus: false,
                            validator: Validators.email,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                            ),
                            validator: Validators.nigerianPhone,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            validator: Validators.password,
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
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
                              child: const Text('Submit'),
                            ),
                          ),
                    
                          SizedBox(height: 40),
                    
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Pops this screen off and goes back
                            },
                            child: const Text('Back to Landing Page'),
                          )
                    
                        ],
                      ),
                    ),
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