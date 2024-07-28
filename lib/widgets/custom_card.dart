import 'package:flutter/material.dart';
import 'package:store_app/constants/routes.dart';
import 'package:store_app/models/products_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(productsModel.id);
        Navigator.pushNamed(context, kUpdateProductPage,
            arguments: productsModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 130,
            width: 190,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 0,
                  offset: const Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsModel.title.substring(0, 6),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${productsModel.price.toString()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: -50,
            child: Image.network(
              productsModel.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
