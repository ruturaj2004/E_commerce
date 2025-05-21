
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final searchController = TextEditingController();
  
  final List<CategoryItem> categories = [
    CategoryItem('E-Wallet', Icons.account_balance_wallet, Colors.red),
    CategoryItem('Design Templates', Icons.palette, Colors.orange),
    CategoryItem('Software', Icons.computer, Colors.blue),
    CategoryItem('Music', Icons.music_note, Colors.purple),
    CategoryItem('Online Courses', Icons.school, Colors.green),
    CategoryItem('Stock Photos', Icons.photo_library, Colors.cyan),
    CategoryItem('Weather', Icons.cloud, Colors.lightBlue),
    CategoryItem('Game Center', Icons.sports_esports, Colors.indigo),
    CategoryItem('Plugins', Icons.extension, Colors.deepPurple),
    CategoryItem('Digital Art', Icons.brush, Colors.pink),
  ];
  
  void onCategoryTap(int index) {
    Get.snackbar(
      'Category Selected',
      'You selected ${categories[index].name}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void onRecommendedTap(int index) {
    Get.snackbar(
      'Recommended Item',
      'You selected recommended item $index',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void onSponsoredTap() {
    Get.snackbar(
      'Sponsored Content',
      'You selected sponsored content',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

class CategoryItem {
  final String name;
  final IconData icon;
  final Color color;
  
  CategoryItem(this.name, this.icon, this.color);
}

class HomeScreen2 extends StatelessWidget {
  HomeScreen2({Key? key}) : super(key: key);
  
  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address and search header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF7BB5FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    // Address row
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Address here',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Search bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: controller.searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search here',
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Banner container
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Banner Area',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Categories grid
              Container(
                height: 180,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    return GestureDetector(
                      onTap: () => controller.onCategoryTap(index),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Category icon
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: category.color.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              category.icon,
                              color: category.color,
                              size: 24,
                            ),
                          ),
                          const SizedBox(height: 6),
                          // Category name
                          Text(
                            category.name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Recommended section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommended',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Recommended grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.3,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.onRecommendedTap(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    [Icons.movie, Icons.shopping_cart, Icons.fastfood, Icons.local_offer][index],
                                    size: 32,
                                    color: [Colors.red, Colors.blue, Colors.orange, Colors.green][index],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    ['Entertainment', 'Shopping', 'Food', 'Deals'][index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Sponsored section
                    const Text(
                      'Sponsored',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Sponsored banner
                    GestureDetector(
                      onTap: controller.onSponsoredTap,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.star,
                                color: Colors.purple,
                                size: 32,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Special Offer',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Limited time promotion',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}