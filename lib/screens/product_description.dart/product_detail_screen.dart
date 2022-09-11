import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/grocery.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import '../../widgets/item_counter.dart';
import 'favorite_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final GroceryItem groceryItem;
  final String heroSuffix;

  const ProductDetailsScreen(this.groceryItem, {required this.heroSuffix});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            getImageHeaderWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        widget.groceryItem.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: AppText(
                        text: widget.groceryItem.description!,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff7C7C7C),
                        textAlign: null,
                      ),
                      trailing: FavoriteToggleIcon(),
                    ),
                    // Spacer(),
                    Row(
                      children: [
                        ItemCounterWidget(
                          onAmountChanged: (newAmount) {
                            setState(() {
                              amount = newAmount;
                            });
                          },
                        ),
                        Spacer(),
                        Text(
                          "\$${getTotalPrice().toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Divider(thickness: 1),
                    getProductDataRowWidget("Product Details",
                        customWidget: SizedBox.shrink()),
                    Divider(thickness: 1),
                    getProductDataRowWidget("Nutritions",
                        customWidget: nutritionWidget()),
                    Divider(thickness: 1),
                    getProductDataRowWidget(
                      "Review",
                      customWidget: ratingWidget(),
                    ),
                    Spacer(),
                    AppButton(
                      label: "Add To Basket",
                      onPressed: () {},
                      trailingWidget: SizedBox.shrink(),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageHeaderWidget() {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(
            colors: [
              const Color(0xFF3366FF).withOpacity(0.1),
              const Color(0xFF3366FF).withOpacity(0.09),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Hero(
        tag: "GroceryItem:${widget.groceryItem.name}-${widget.heroSuffix}",
        child: Image(
          image: AssetImage(widget.groceryItem.imagePath!),
        ),
      ),
    );
  }

  Widget getProductDataRowWidget(String label, {required Widget customWidget}) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        children: [
          AppText(
            text: label,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            textAlign: null,
          ),
          Spacer(),
          // ignore: unnecessary_null_comparison
          if (customWidget != null) ...[
            customWidget,
            const SizedBox(
              width: 20,
            )
          ],
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget nutritionWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xffEBEBEB),
        borderRadius: BorderRadius.circular(5),
      ),
      child: AppText(
        text: "100gm",
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xff7C7C7C),
        textAlign: null,
      ),
    );
  }

  Widget ratingWidget() {
    Widget starIcon() {
      return Icon(
        Icons.star,
        color: Color(0xffF3603F),
        size: 20,
      );
    }

    return Row(
      children: [
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
      ],
    );
  }

  double getTotalPrice() {
    return amount * widget.groceryItem.price!;
  }
}
