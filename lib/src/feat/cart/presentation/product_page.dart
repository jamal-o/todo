// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo/src/feat/cart/domain/cart.dart';
import 'package:todo/src/feat/cart/presentation/product_provider.dart';
import 'package:todo/src/feat/cart/presentation/widgets/product_card.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(productProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Page"),
        ),
        body: items.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ProductCard(
                  key: ValueKey<String>(item.id),
                  item: item,
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
