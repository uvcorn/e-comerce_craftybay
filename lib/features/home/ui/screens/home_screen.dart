import 'package:crafty/app/asset_path.dart';
import 'package:crafty/features/auth/ui/screen/login_screen.dart';
import 'package:crafty/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty/features/common/ui/widgets/product_card';
import 'package:crafty/features/home/ui/widgets/appbar_iconbutton.dart';
import 'package:crafty/features/home/ui/widgets/home_carousel_slider.dart';
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
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              ProductSearcBar(),
              const SizedBox(height: 8),
              HomeCarouselSlider(),
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
              _getCategoryList(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _getCategoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPopularProducts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 8,
        direction: Axis.horizontal,
        children: [1, 2, 3, 4].map<Widget>((e) => ProductCard()).toList(),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: SvgPicture.asset(AssetPath.navAppLogoSvg),
      actions: [
        AppBarIconButton(
          iconData: Icons.person,
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.name);
          },
        ),
        AppBarIconButton(iconData: Icons.call, onTap: () {}),
        AppBarIconButton(iconData: Icons.notifications, onTap: () {}),
      ],
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
}
