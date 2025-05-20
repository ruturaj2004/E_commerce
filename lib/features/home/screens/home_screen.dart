import 'package:flutter/material.dart';

import '../../../utils/themes/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('Home Screen'  , style: AppTextStyle.hintStyle,),
      ),
    );
  }
}