// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/cart/domain/cart.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        children: [
          Image.network(item.imageUrl),
          Text(item.title),
          //space
          SizedBox(
            height: 20,
          ),
          Text(item.description),
        ],
      ),
    );
  }
}
