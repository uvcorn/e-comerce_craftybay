import 'package:crafty/app/app_colors.dart';
import 'package:crafty/app/asset_path.dart';
import 'package:crafty/app/constant.dart';
import 'package:crafty/features/common/ui/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(8),
            child: Image.asset(AssetPath.blueShoe, fit: BoxFit.scaleDown),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 4,
                right: 12,
                bottom: 16,
                top: 4,
              ),
              child: Column(
                spacing: 6,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nike 1204HST - new shoe of 2025',
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.6,
                                color: Colors.black87,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              'Color: Blue  Size:XL',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${Constant.takaSign}100",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.themeColor,
                        ),
                      ),
                      IncDecButton(onChange: (int value) {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
