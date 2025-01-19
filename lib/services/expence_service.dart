import 'dart:convert';

import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenceService {
  //Expence List
  List<Expence> expencesList = [];

  //Key for String expences in shared preferences
  static const String _expenceKey = 'expences';

  Future<void> saveExpences(Expence expence, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingExpences = pref.getStringList(_expenceKey);

      List<Expence> existingExpencesObjects = [];

      if (existingExpences != null) {
        existingExpencesObjects = existingExpences
            .map((e) => Expence.formJSON(json.decode(e)))
            .toList();
      }
      existingExpencesObjects.add(expence);

      List<String> updatedExpences =
          existingExpencesObjects.map((e) => json.encode(e.toJSON())).toList();

      await pref.setStringList(_expenceKey, updatedExpences);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Expence Added Successfully"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error $error"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //Load the expences form shared prefernces
  Future<List<Expence>> loadExpences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingExpences = pref.getStringList(_expenceKey);

    List<Expence> loadedExpences = [];
    if (existingExpences != null) {
      loadedExpences = existingExpences
          .map(
            (e) => Expence.formJSON(
              json.decode(e),
            ),
          ).toList();
    }
    return loadedExpences;
  }
}
