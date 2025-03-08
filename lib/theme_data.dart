import 'package:flutter/material.dart';
import 'app_colors.dart';

class ApplicationThem{

  static ThemeData lightThem= ThemeData(
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'poppins',
        fontSize: 30,
          color: AppColors.yellow
      ),

      bodyMedium: TextStyle(

          fontSize: 30,
          fontWeight: FontWeight.w700,
          fontFamily: 'poppins'
          ,color: AppColors.yellow
      ),
      bodySmall: TextStyle(
          fontFamily: 'poppins',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.yellow
      ),
    ),
  );

}