import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import 'widgets/product_card.dart';
import 'widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    final double horizontalPadding = screenWidth * 0.04;
    final double verticalPadding = screenHeight * 0.02;
    final double logoHeight = screenHeight * 0.035;
    final double iconSize = screenWidth * 0.05;
    final double titleFontSize = screenWidth * 0.04;
    final double searchFontSize = screenWidth * 0.038;
    final double bannerHeight = screenHeight * 0.18;
    final double productCardHeight = screenHeight * 0.28;
    final double groceryImageHeight = screenHeight * 0.1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: verticalPadding * 1.5), // Responsive top padding
            Center(
              child: Image.asset(
                "assets/images/logo.png", // carrot logo
                height: logoHeight,
              ),
            ),
            SizedBox(height: verticalPadding * 0.5),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.black54, size: iconSize),
                  const SizedBox(width: 4),
                  Text(
                    "Dhaka, Banassre",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize),
                  ),
                ],
              ),
            ),
            SizedBox(height: verticalPadding),
            Container(
              margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding * 0.75, vertical: verticalPadding * 0.75),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey, size: iconSize * 1.2),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    "Search Store",
                    style: TextStyle(color: Colors.grey, fontSize: searchFontSize),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(horizontalPadding),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/Banner.png',
                        fit: BoxFit.cover,
                        height: bannerHeight,
                        width: double.infinity,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  "Fresh Vegetables",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5,
                                        color: Colors.black54,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),



            SectionTitle(title: "Exclusive Offer", onSeeAll: () {}),
            SizedBox(
              height: productCardHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.exclusiveOffers.length,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding * 0.5),
                itemBuilder: (context, index) =>
                    ProductCard(product: vm.exclusiveOffers[index]),
              ),
            ),

            // Best Selling
            SectionTitle(title: "Best Selling", onSeeAll: () {}),
            SizedBox(
              height: productCardHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.bestSelling.length,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding * 0.5),
                itemBuilder: (context, index) =>
                    ProductCard(product: vm.bestSelling[index]),
              ),
            ),

            // Groceries
            SectionTitle(title: "Groceries", onSeeAll: () {}),
            SizedBox(
              height: groceryImageHeight * 1.5, // Adjusted for text below image
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.groceries.length,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding * 0.5),
                itemBuilder: (context, index) {
                  final grocery = vm.groceries[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              grocery.image,
                              height: groceryImageHeight,
                            ),
                            SizedBox(height: verticalPadding * 0.25),

                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: verticalPadding), // Bottom padding
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedFontSize: screenWidth * 0.03, // Responsive font size
        unselectedFontSize: screenWidth * 0.028, // Responsive font size
        iconSize: iconSize * 1.1, // Responsive icon size
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
