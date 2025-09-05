import 'package:flutter/material.dart';

/// App Color Palette
///
/// This file contains all the colors used throughout the application.
/// Using a centralized color system ensures consistency and makes it easy
/// to update the app's theme in the future.
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF1976D2); // Dark Blue
  static const Color primaryDark = Color(0xFF0D47A1); // Darker Blue
  static const Color primaryLight = Color(0xFF42A5F5); // Lighter Blue

  // Neutral Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyDark = Color(0xFF424242);

  // Background Colors
  static const Color background = Color(0xFFFAFAFA); // Light greyish-white
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Dark grey/black
  static const Color textSecondary = Color(0xFF757575); // Medium grey
  static const Color textHint = Color(0xFFBDBDBD); // Light grey

  // Status Colors
  static const Color success = Color(0xFF4CAF50); // Green
  static const Color error = Color(0xFFF44336); // Red
  static const Color warning = Color(0xFFFF9800); // Orange
  static const Color info = Color(0xFF2196F3); // Blue

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = grey;
  static const Color buttonDisabled = Color(0xFFE0E0E0);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderFocus = primary;
  static const Color borderError = error;

  // Icon Colors
  static const Color iconPrimary = textPrimary;
  static const Color iconSecondary = textSecondary;
  static const Color iconDisabled = textHint;

  // Divider Colors
  static const Color divider = Color(0xFFE0E0E0);
  static const Color dividerLight = Color(0xFFF0F0F0);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000); // 10% black opacity
  static const Color shadowLight = Color(0x0D000000); // 5% black opacity

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [background, surface],
  );

  // Material Color Swatches
  static const MaterialColor primarySwatch =
      MaterialColor(0xFF1976D2, <int, Color>{
        50: Color(0xFFE3F2FD),
        100: Color(0xFFBBDEFB),
        200: Color(0xFF90CAF9),
        300: Color(0xFF64B5F6),
        400: Color(0xFF42A5F5),
        500: Color(0xFF2196F3),
        600: Color(0xFF1E88E5),
        700: Color(0xFF1976D2),
        800: Color(0xFF1565C0),
        900: Color(0xFF0D47A1),
      });

  static const MaterialColor greySwatch =
      MaterialColor(0xFF9E9E9E, <int, Color>{
        50: Color(0xFFFAFAFA),
        100: Color(0xFFF5F5F5),
        200: Color(0xFFEEEEEE),
        300: Color(0xFFE0E0E0),
        400: Color(0xFFBDBDBD),
        500: Color(0xFF9E9E9E),
        600: Color(0xFF757575),
        700: Color(0xFF616161),
        800: Color(0xFF424242),
        900: Color(0xFF212121),
      });
}

/// Extension to easily access colors with opacity
extension AppColorsExtension on AppColors {
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}
