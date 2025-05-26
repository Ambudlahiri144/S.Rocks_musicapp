import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart'; // Assuming this path is correct
import 'service_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart'; // Assuming this path is correct

// MODIFIED: Converted to StatefulWidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // MODIFIED: Added state for the selected tab index
  int _selectedIndex = 0; // Default to the first tab (Home)

  // MODIFIED: Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 28, 1),
      appBar: null, // Keeping the custom top section, no standard AppBar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MODIFIED: The top section is now wrapped in a Stack
            Stack(
              children: [
                // Layer 1: The Gradient Background Container
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    // Apply rounded corners only to top and bottom
                    top: Radius.circular(22.0),
                    bottom: Radius.circular(22.0),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(169, 1, 64, 1), // Start color
                          Color.fromRGBO(85, 1, 32, 1), // End color
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        SafeArea(
                          bottom: false,
                          child: _buildSearchBarRow(),
                        ),
                        _buildPromoCard(),
                      ],
                    ),
                  ),
                ),
                // MODIFIED: Layer 2 - CD Image (Left Edge)
                Positioned(
                  left: -30, // Align to the left edge of the Stack
                  bottom: 16, // Position from the bottom
                  child: Image.asset(
                    'lib/assets/icons/cd.png',
                    width: 121, // Replace with your actual CD image path
                    height: 121, // Adjust size as needed
                    // You might want to add errorBuilder if the asset might be missing
                  ),
                ),
                // MODIFIED: Layer 3 - Piano Keys Image (Right Edge)
                Positioned(
                  right: -45, // Align to the right edge of the Stack
                  bottom: 16, // Position from the bottom
                  child: Image.asset(
                    'lib/assets/icons/piano.png', // Replace with your actual piano keys image path
                    width: 135, // Replace with your actual CD image path
                    height: 135, // Adjust size as needed
                    // You might want to add errorBuilder if the asset might be missing
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 10, 0),
              child: Text(
                'Hire hand-picked Pros for popular music services',
                style: TextStyle(fontSize: 16),
              ),
            ),
            _buildServiceList(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent, // Background color of the bar
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(19, 200, 200, 198), // Color of the border
              width: 1.0,          // Thickness of the border
            ),
          ),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/icons/home.png',
                width: 24,
                height: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/icons/news.png',
                width: 24,
                height: 24,
              ),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/icons/track.png',
                width: 24,
                height: 24,
              ),
              label: 'TrackBox',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/icons/mail.png',
                width: 24,
                height: 24,
              ),
              label: 'Projects',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          // MODIFIED: Set original BottomNavigationBar background to transparent
          // as the Container now handles the background color.
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[600],
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedFontSize: 15,
          unselectedFontSize: 12,
          elevation: 0, // Optional: Remove default shadow if any from BottomNavigationBar
        ),
      ),
    );
  }

  Widget _buildSearchBarRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 4, 8),
      child: SizedBox(
        height: 48.0,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Search "Punjabi Lyrics"',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'lib/assets/icons/search.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      'lib/assets/icons/mic.png',
                      width: 30,
                      height: 21.02,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(47, 47, 57, 1),
                  contentPadding: const EdgeInsets.all(0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: ClipOval(
                child: Image.asset(
                  'lib/assets/icons/profile.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCard() {
    // Promo card is now simpler as images are outside
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
          16.0, 16.0, 16.0, 32.0), // Added more bottom margin
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      decoration: BoxDecoration(
        color: Colors
            .transparent, // Background is handled by the parent gradient container
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Claim your',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          Text(
            'Free Demo',
            style: GoogleFonts.lobster(
              // Use Lobster font
              fontSize: 40,

              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          const Text('for custom Music Production',
              style: TextStyle(color: Colors.white)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Book Now',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceList() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (viewModel.services.isEmpty) {
          return const Center(child: Text('No services found.'));
        }
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.services.length,
          itemBuilder: (context, index) {
            final service = viewModel.services[index];
            const double tileHeight = 70.0;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: tileHeight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ServiceDetailScreen(serviceTitle: service.title),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (service.backgroundImage.isNotEmpty)
                          Image.asset(
                            'lib/assets/icons/${service.backgroundImage}.png', // Assuming path from your previous code
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image,
                                  color: Colors.grey);
                            },
                          )
                        else
                          const Placeholder(
                              color: Color.fromARGB(255, 71, 71, 71)),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(32, 33, 38, 1)
                                .withOpacity(0.8),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/assets/icons/${service.icon}.png',
                                width: 47,
                                height: 47,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      service.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      service.description,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                'lib/assets/icons/arrow.png', // Replace with your actual asset path
                                width: 33, // Adjust size as needed
                                height: 33,
                                color: Colors
                                    .white, // Optional: if you want to tint a single-color icon
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
