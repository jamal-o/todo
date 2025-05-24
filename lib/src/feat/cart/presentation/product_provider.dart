// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/cart/domain/cart.dart';
import 'package:todo/src/feat/cart/service/cart_service.dart';

final productProvider = FutureProvider<List<Item>>((ref) async {
  return ref.read(cartServiceProvider.notifier).getItems();
});
