import 'dart:convert';
import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenceService {
  
  //Key for String expences in shared preferences
  static const String _expenceKey = 'expences';

  //Save the Expence to shared preferences
  Future<void> saveExpences(Expence expence, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingExpences = pref.getStringList(_expenceKey);

      //Covert the existing Expences to a list of Expence objects
      List<Expence> existingExpencesObjects = [];

      if (existingExpences != null) {
        existingExpencesObjects = existingExpences
            .map((e) => Expence.formJSON(json.decode(e)))
            .toList();
      }
      //Add the new expence to the List
      existingExpencesObjects.add(expence);

      //Covert the list of expence objects back to a list of strings
      List<String> updatedExpences =
          existingExpencesObjects.map((e) => json.encode(e.toJSON())).toList();

      //Save the updated list of expence to shared preferences
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

    //Convert the existing incomes to a list of income objects
    List<Expence> loadedExpences = [];
    if (existingExpences != null) {
      loadedExpences = existingExpences
          .map(
            (e) => Expence.formJSON(
              json.decode(e),
            ),
          )
          .toList();
    }
    return loadedExpences;
  }

  //Delete the Expense by dragging start to end
  Future<void> deleteExpense(int id, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingExpenses = pref.getStringList(_expenceKey);

      //Covert to the expense object
      List<Expence> existingExpensesObject = [];
      if (existingExpenses != null) {
        existingExpensesObject = existingExpenses
            .map((e) => Expence.formJSON(json.decode(e)))
            .toList();
      }
      //Remove the expences
      existingExpensesObject.removeWhere((element) => element.id == id);
      //Covert the lis of expence object back to a list of string
      List<String> updatedExpences =
          existingExpensesObject.map((e) => json.encode(e.toJSON())).toList();
      //Save the updated list in shared preferences
      await pref.setStringList(_expenceKey, updatedExpences);
      //Show SnackBar
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Expense Deleted Succesfully!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error $error"),
        ),
      );
    }
  }
}
