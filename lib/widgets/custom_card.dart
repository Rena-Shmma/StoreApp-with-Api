import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_with_api/screens/update_product_page.dart';

import '../models/product_model.dart';

class CustomCard extends StatelessWidget {
  ProductModel product;

  CustomCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 220,
            height: 130,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40,
                spreadRadius: 0,
                offset: Offset(10, 10),
                color: Colors.grey.withOpacity(0.2),
              )
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!.substring(0, 8),
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(top: 100, left: 50, child: Text('hello')),
          Positioned(
              right: 32,
              top: -65,
              child: Image.network(
                product.image.toString(),
                height: 100,
                width: 100,
              ))
        ],
      ),
    );
  }
}
