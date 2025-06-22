import 'package:crafty/app/asset_path.dart';
import 'package:crafty/features/auth/ui/screen/login_screen.dart';
import 'package:crafty/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty/features/common/ui/widgets/c_app_bar.dart';
import 'package:crafty/features/common/ui/widgets/coustom_carousel_slider.dart';

import 'package:crafty/features/common/ui/widgets/product_card.dart';
import 'package:crafty/features/home/ui/widgets/appbar_iconbutton.dart';
import 'package:crafty/features/common/ui/widgets/product_category_item.dart';
import 'package:crafty/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: SvgPicture.asset(AssetPath.navAppLogoSvg),
        actions: [
          AppBarIconButton(
            iconData: Icons.person,
            onTap: () {
              Get.toNamed(LoginScreen.name);
            },
          ),
          AppBarIconButton(iconData: Icons.call, onTap: () {}),
          AppBarIconButton(iconData: Icons.notifications, onTap: () {}),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              ProductSearcBar(),
              const SizedBox(height: 8),
              CustomCarouselSlider(type: SliderType.home),
              const SizedBox(height: 8),
              _buildSectionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                  Get.offAllNamed(MainBottomNavScreen.name);
                },
              ),
              _getCategoryList(),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _getPopularProducts(),
              _buildSectionHeader(title: 'Special', onTapSeeAll: () {}),
              _getSpecialProducts(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _getNewProducts(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        TextButton(onPressed: onTapSeeAll, child: Text('See all')),
      ],
    );
  }

  Widget _getCategoryList() {
    return SizedBox(
      height: 100,
      // width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 7,

        itemBuilder: (context, index) {
          return ProductCategoryItem();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }

  Widget _getPopularProducts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [1, 2, 3, 4]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ProductCard(),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _getSpecialProducts() {
    return SizedBox(
      height: 185,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
        itemCount: 10,
      ),
    );
  }

  Widget _getNewProducts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [1, 2, 3, 4]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ProductCard(),
              ),
            )
            .toList(),
      ),
    );
  }
}
