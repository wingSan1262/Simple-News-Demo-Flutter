import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color colorButton;
  final Color colorText;
  final String buttonText;
  final bool isLoading;
  final double textSize;

  CommonButton({
    required this.onPressed,
    required this.buttonText,
    this.colorButton = Colors.black,
    this.colorText = Colors.white,
    this.isLoading = false,
    this.textSize = 14.0, // Default text size
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: isLoading
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(colorText),
              strokeWidth: 2,
            ),
          ),
          SizedBox(width: 8), // Add some spacing between the loading indicator and the text
          Text(buttonText, style: TextStyle(color: colorText, fontSize: textSize)),
        ],
      )
          : Text(buttonText, style: TextStyle(color: Colors.white, fontSize: textSize)),
    );
  }
}