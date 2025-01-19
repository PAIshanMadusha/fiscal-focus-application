import 'package:flutter/material.dart';

enum ExpenceCategory {
  food,
  transport,
  health,
  shopping,
  subscriptions,
}

//Images
final Map<ExpenceCategory, String> expenceCategoriesImages = {
  ExpenceCategory.food: "assets/images/fastfood.png",
  ExpenceCategory.transport: "assets/images/bus.png",
  ExpenceCategory.health: "assets/images/care.png",
  ExpenceCategory.shopping: "assets/images/shoppingbags.png",
  ExpenceCategory.subscriptions: "assets/images/subscription.png",
};

//Colors
final Map<ExpenceCategory, Color> expenceCategoriesColor = {
  ExpenceCategory.food: const Color.fromARGB(252, 0, 184, 15),
  ExpenceCategory.transport: const Color.fromARGB(255, 144, 16, 148),
  ExpenceCategory.health: const Color.fromARGB(255, 228, 36, 22),
  ExpenceCategory.shopping: const Color.fromARGB(255, 79, 13, 202),
  ExpenceCategory.subscriptions: const Color.fromARGB(255, 14, 185, 190),
};

class Expence {
  final int id;
  final String title;
  final double amount;
  final ExpenceCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expence({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });
  //Convert to Json (Serialization)
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.index,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }

  //Convert to Object Again (Deserialization)
  factory Expence.formJSON(Map<String, dynamic> json) {
    return Expence(
        id: json['id'],
        title: json['title'],
        amount: json['amount'],
        category: ExpenceCategory.values[json['category']],
        date: DateTime.parse(json['date']),
        time: DateTime.parse(json['time']),
        description: json['description'],
        );
  }
}
