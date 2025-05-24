// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class Cart {
  const Cart({
    required this.items,
    required this.status,
  });

  final List<Item> items;
  final CartStatus status;

  
  double get cost => items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.price * element.quantity);

  Cart copyWith({
    List<Item>? items,
    CartStatus? status,
  }) {
    return Cart(
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }
}

enum CartStatus {
  PENDING,
  CONFIRMED,
  CANCELLED,
}

@immutable
class Item {
  const Item({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  final String id;
  final String title;
  final String description;
  final double price;
  final int quantity;

  final String imageUrl;
}
