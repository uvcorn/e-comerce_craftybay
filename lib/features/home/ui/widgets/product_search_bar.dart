import 'package:flutter/material.dart';

class ProductSearcBar extends StatelessWidget {
  const ProductSearcBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (String? value) {
        //TOD0: sEARCH product
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        fillColor: const Color.fromRGBO(238, 238, 238, 1),
        filled: true,
        hintText: 'Search',
        border: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
