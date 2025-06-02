import 'package:crafty/app/asset_path.dart';
import 'package:crafty/features/auth/ui/screen/login_screen.dart';
import 'package:crafty/features/home/ui/widgets/appbar_iconbutton.dart';
import 'package:crafty/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:crafty/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String name = '/home';
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
              _sectionHeader(title: 'Catagories', onTapSeeAll: () {}),
              _sectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _sectionHeader(title: 'Special', onTapSeeAll: () {}),
              _sectionHeader(title: 'New', onTapSeeAll: () {}),
            ],
          ),
        ),
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

  Widget _sectionHeader({
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
}
