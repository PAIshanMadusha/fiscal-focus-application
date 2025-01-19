import 'package:flutter/material.dart';

enum IncomeCategory {
  freelance,
  passive,
  salery,
  sales,
}

//Images
final Map<IncomeCategory, String> incomeCategoryIamges = {
  IncomeCategory.freelance: "assets/images/worker.png",
  IncomeCategory.passive: "assets/images/benefit.png",
  IncomeCategory.salery: "assets/images/salary.png",
  IncomeCategory.sales: "assets/images/barchart.png",
};

//Colors
final Map<IncomeCategory, Color> incomeCategoryColor = {
  IncomeCategory.freelance: const Color.fromARGB(252, 0, 20, 204),
  IncomeCategory.passive: const Color.fromARGB(221, 255, 0, 200),
  IncomeCategory.salery: const Color.fromARGB(255, 238, 255, 0),
  IncomeCategory.sales: const Color.fromARGB(255, 23, 192, 1),
};

class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
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
  factory Income.formJSON(Map<String, dynamic> json) {
    return Income(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      category: IncomeCategory.values[json['category']],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      description: json['description'],
    );
  }
}
