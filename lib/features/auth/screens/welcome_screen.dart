// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(),
//               // Logo Circle
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.grey[200],
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Logo',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               // App Name
//               const Text(
//                 'Name',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Lorem ipsum text
//               const Text(
//                 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.\nMaecenas hendrerit luctus libero ac\nvulputate.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.grey,
//                   height: 1.5,
//                 ),
//               ),
//               const Spacer(),
//               // Get Started Button
//               ElevatedButton(
//                 onPressed: () => Get.toNamed('/create-account'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 56),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   "Let's get started",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Already have account
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'I already have an account',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   IconButton(
//                     onPressed: () => Get.toNamed('/login'),
//                     icon: const Icon(
//                       Icons.arrow_forward_rounded,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:e_commerce/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Circle
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Logo",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              
              // Name text
              Text(
                "Name",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              
              // Lorem ipsum text
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas hendrerit luctus libero ac vulputate.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              
              // Spacer to push button to bottom
              Spacer(),
              
              // Let's get started button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/create-account'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3D7BF9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Let's get started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              
              // I already have an account link
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I already have an account",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF3D7BF9),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    onPressed: () => Get.toNamed('/login'),
                  ),
                ],
              ),
              
              // Page indicator
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xFF3D7BF9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    width: 8,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    width: 8,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}