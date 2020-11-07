import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavs ? productsData.favouriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      /*itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (c)=>products[i],*/
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
            /* products[i].id,
          products[i].title,
          products[i].imageUrl,*/
            ),
      ),
    );
  }
}
