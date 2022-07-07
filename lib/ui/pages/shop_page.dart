import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/cubit/product_cubit.dart';
import 'package:tsn_technical_hitnes/models/product_model.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:tsn_technical_hitnes/ui/pages/detail_product_page.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_text_form_field.dart';
import 'package:tsn_technical_hitnes/ui/widget/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatefulWidget {
  ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController searchController = TextEditingController(text: '');

  @override
  void initState() {
    context.read<ProductCubit>().fetchProducts();
    super.initState();
  }

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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/keranjang');
              },
              child: Container(
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
            ),
          ],
        ),
      );
    }

    Widget searchProducts() {
      return CustomTextFormField(
        hintText: 'Cari Produk',
        controller: searchController,
      );
    }

    Widget productsShop(List<ProductModel> products) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: products.map((ProductModel product) {
              return ProductCard(product);
            }).toList(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductSuccess) {
            return ListView(
              children: [
                header(),
                searchProducts(),
                productsShop(state.products),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
