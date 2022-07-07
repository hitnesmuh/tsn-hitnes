import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tsn_technical_hitnes/models/product_model.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:tsn_technical_hitnes/ui/pages/detail_product_page.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard(
    this.product, {
    Key? key,
  }) : super(key: key);

  get defaultMargin => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProductPage(product),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(
          left: 24,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: kGreyColor.withOpacity(0.2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 140,
              height: 200,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                  image: NetworkImage(
                    product.imageUrl,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp. ',
                      decimalDigits: 0,
                    ).format(product.price),
                    style: blackTextstyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
