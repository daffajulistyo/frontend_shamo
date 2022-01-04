import 'package:flutter/material.dart';
import 'package:frontend_shamo/models/product_model.dart';
import 'package:frontend_shamo/providers/wishlist_provider.dart';
import 'package:frontend_shamo/shared/theme.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlist = Provider.of<WishlistProvider>(context);

    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.fromLTRB(12, 10, 20, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries![0].url!,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              wishlist.setProduct(product);
            },
            child: Image.asset(
              'assets/button_wishlist_active.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
