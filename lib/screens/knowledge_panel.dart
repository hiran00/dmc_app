import 'package:flutter/material.dart';
import 'package:disaster_management/components/custom_bottom_navbar.dart';

class KnowledgePanelPage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const KnowledgePanelPage({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9; // 90% of screen width

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Knowledge Panel'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: cardWidth,
                child: const Text(
                  'Explore this guidance to improve your\nknowledge of dos and don\'ts, safety\ntips, and early warning signs of disasters.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: cardWidth,
                child: const Text(
                  'Contents',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildDisasterCard(
                context,
                'Flood in Sri Lanka',
                'Lorem ipsum dolor sit amet consectetur adipiscing',
                'assets/knowledge_panel_icon.png',
                cardWidth,
              ),
              _buildDisasterCard(
                context,
                'Landslide in Sri Lanka',
                'Lorem ipsum dolor sit amet consectetur adipiscing',
                'assets/knowledge_panel_icon.png',
                cardWidth,
              ),
              _buildDisasterCard(
                context,
                'Tsunami in Sri Lanka',
                'Lorem ipsum dolor sit amet consectetur adipiscing',
                'assets/knowledge_panel_icon.png',
                cardWidth,
              ),
              _buildDisasterCard(
                context,
                'Cyclone in Sri Lanka',
                'Lorem ipsum dolor sit amet consectetur adipiscing',
                'assets/knowledge_panel_icon.png',
                cardWidth,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: currentIndex,
        onItemTapped: onTap,
      ),
    );
  }

  Widget _buildDisasterCard(BuildContext context, String title,
      String description, String imagePath, double width) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // Handle card tap
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
