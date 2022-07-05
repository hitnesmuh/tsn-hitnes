import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:tsn_technical_hitnes/ui/pages/detail_product_page.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_text_form_field.dart';
import 'package:tsn_technical_hitnes/ui/widget/product_card.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 20,
          bottom: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Shop',
                    style: blackTextstyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_basket.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget searchProducts() {
      return CustomTextFormField(
        hintText: 'Cari Produk',
      );
    }

    Widget productsShop() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ProductCard(
                name: 'Kaos Putih',
                price: 'Rp. 150.000',
                imageUrl: 'assets/image_white_clothes.png',
              ),
              ProductCard(
                name: 'Kaos Hijau',
                price: 'Rp. 200.000',
                imageUrl: 'assets/image_green_clothes.png',
              ),
              ProductCard(
                name: 'Kaos Biru',
                price: 'Rp. 100.000',
                imageUrl: 'assets/image_blue_clothes.png',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          header(),
          searchProducts(),
          productsShop(),
        ],
      ),
    );
  }
}
