import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

class RoundedButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;

   RoundedButton({super.key, required this.title, this.loading = false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: loading ? CircularProgressIndicator(color: Colors.black,) : Center(child: Text(title),)),
      ),
    );
  }
}
