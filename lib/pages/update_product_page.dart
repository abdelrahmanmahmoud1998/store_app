import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productname, description, image;
  dynamic price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Product Name',
                onChanged: (data) => productname = data,
              ),
              CustomTextField(
                hintText: 'Description',
                onChanged: (data) => description = data,
              ),
              CustomTextField(
                hintText: 'Price',
                inputType: TextInputType.number,
                onChanged: (data) => price = data,
              ),
              CustomTextField(
                hintText: 'Image',
                onChanged: (data) => image = data,
              ),
              CustomButton(
                text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    Navigator.pop(context);
                    print('success');
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductsModel product) async {
    await UpdateProductService().updateProductService(
      id: product.id,
      title: productname == null ? product.title : productname!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
