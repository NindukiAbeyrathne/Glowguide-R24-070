import 'package:flutter/material.dart';
import '../authentication/login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Beauty Blend!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
                height: 40), // Adjust spacing between welcome text and cards
            // Four small cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Card 01
                GestureDetector(
                  onTap: () {
                    // Navigate to the corresponding page
                    // Add your navigation logic here
                  },
                  child: _buildCard(
                    'Randika Akki',
                    'images/randika_akki.jpg', // Replace with actual image path
                  ),
                ),
                // Card 02
                GestureDetector(
                  onTap: () {
                    // Navigate to the corresponding page
                    // Add your navigation logic here
                  },
                  child: _buildCard(
                    'Makeup',
                    'images/makeup.jpg', // Replace with actual image path
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Adjust spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Card 03
                GestureDetector(
                  onTap: () {
                    // Navigate to the corresponding page
                    // Add your navigation logic here
                  },
                  child: _buildCard(
                    'Hair Treatments & Skin Care',
                    'images/hair_treatments_skin_care.jpg', // Replace with actual image path
                  ),
                ),
                // Card 04
                GestureDetector(
                  onTap: () {
                    // Navigate to the corresponding page
                    // Add your navigation logic here
                  },
                  child: _buildCard(
                    'Customer Feedback',
                    'images/customer_feedback.jpg', // Replace with actual image path
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each card widget
  Widget _buildCard(String title, String imagePath) {
    return Card(
      elevation: 4, // Add a slight elevation for shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            imagePath,
            height: 100,
            width: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
