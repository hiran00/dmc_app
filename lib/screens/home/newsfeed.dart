import 'package:flutter/material.dart';
import 'package:disaster_management/components/custom_bottom_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsfeedPage extends StatelessWidget {
  const NewsfeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Newsfeed'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            _NewsItem(
              title: 'Over 100 People are killed in flood',
              description:
                  'Lorem ipsum dolor sit amet consec Amet ut adipiscing\nipsum dosit amet consec Amet ut adipiscing',
              imagePath: 'assets/flood.jpg',
              newsUrl: 'https://example.com/news1',
            ),
            SizedBox(height: 16),
            _NewsItem(
              title: 'Over 100 People are killed in flood',
              description:
                  'Lorem ipsum dolor sit amet consec Amet ut adipiscing\nipsum dosit amet consec Amet ut adipiscing',
              imagePath: 'assets/flood.jpg',
              newsUrl: 'https://example.com/news2',
            ),
            SizedBox(height: 16),
            _NewsItem(
              imageNumber: '1/8',
              title: 'Over 100 People are killed in flood',
              description:
                  'Lorem ipsum dolor sit amet consec Amet ut adipiscing\nipsum dosit amet consec Amet ut adipiscing',
              imagePath: 'assets/flood.jpg',
              newsUrl: 'https://example.com/news3',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 2,
        onItemTapped: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/emergencyAlerts');
              break;
            case 2:
              // Already on Newsfeed page
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}

class _NewsItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String newsUrl;

  const _NewsItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(newsUrl);
        if (!await canLaunchUrl(url)) {
          print('Could not launch $newsUrl');
        } else {
          await launchUrl(url);
        }
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.grey[600],
                  ),
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
