import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_with_api/models/product_model.dart';
import 'package:store_with_api/services/get_all_product_service.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Colors.white,
          title: Text(
            'New Trend',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 65),
            child: FutureBuilder<List<ProductModel>>(
                future: AllProductsService().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products = snapshot.data!;
                    return GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100),
                      itemBuilder: (context, index) {
                        return Center(
                            child: CustomCard(
                          product: products[index],
                        ));
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
