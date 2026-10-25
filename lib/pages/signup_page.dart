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

  Widget _buildTextField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required String? Function(String?) validator,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
              width: 0.7,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            autofocus: false,
            validator: validator,
          ),
        ),
      ],
    );
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
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: autoValidationMode,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            borderRadius: BorderRadius.circular(12),
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