import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_with_api/models/product_model.dart';
import 'package:store_with_api/services/update_product.dart';
import 'package:store_with_api/widgets/custom_button.dart';
import 'package:store_with_api/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;
  bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'Description',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'Price',
                  onChanged: (data) {
                    price = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id!,
        title: productName == Null ? product.title.toString() : productName!,
        price: price == Null ? product.price.toString() : price!,
        description: desc == Null ? product.description.toString() : desc!,
        image: image == Null ? product.image.toString() : image!,
        category: product.category.toString());
    isLoading = false;
  }
}
