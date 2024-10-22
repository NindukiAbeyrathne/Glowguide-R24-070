import 'package:flutter/material.dart';

void main() {
  runApp(SalonRegistrationApp());
}

class SalonRegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salon Registration',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SalonRegistrationForm(),
    );
  }
}

class SalonRegistrationForm extends StatefulWidget {
  @override
  _SalonRegistrationFormState createState() => _SalonRegistrationFormState();
}

class _SalonRegistrationFormState extends State<SalonRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers for form fields
  final TextEditingController _salonNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salon Registration Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Salon Name
              TextFormField(
                controller: _salonNameController,
                decoration: InputDecoration(labelText: 'Salon Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the salon name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Owner's Name
              TextFormField(
                controller: _ownerNameController,
                decoration: InputDecoration(labelText: 'Owner\'s Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the owner\'s name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Contact Number
              TextFormField(
                controller: _contactNumberController,
                decoration: InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the contact number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Address
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Password
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration Successful')),
                    );
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
