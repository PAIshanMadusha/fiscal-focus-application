import 'dart:convert';
import 'package:fiscal_focus_app/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeService {
  //key for String Income in shared preferences
  static const String _incomeKey = 'income';

  //Save the income to shared preferences
  Future<void> saveIcome(Income income, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      List<String>? existingIncomes = pref.getStringList(_incomeKey);

      //Covert the existing Incomes to a list of Income objects
      List<Income> existingIncomesObjets = [];

      if (existingIncomes != null) {
        existingIncomesObjets = existingIncomes
            .map((e) => Income.formJSON(json.decode(e)))
            .toList();
      }
      //Add the new income to the List
      existingIncomesObjets.add(income);

      //Covert the list of income objects back to a list of strings
      List<String> updatedIncome =
          existingIncomesObjets.map((e) => json.encode(e.toJSON())).toList();

      //Save the updated list of income to shared preferences
      await pref.setStringList(_incomeKey, updatedIncome);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income Added Successfully"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error $error"),
          ),
        );
      }
    }
  }

  //Load income from shared preferences
  Future<List<Income>> loadIncomes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingIncomes = pref.getStringList(_incomeKey);

    //Convert the existing incomes to a list of income objects
    List<Income> loadedIncomes = [];
    if (existingIncomes != null) {
      loadedIncomes =
          existingIncomes.map((e) => Income.formJSON(jsonDecode(e))).toList();
    }
    return loadedIncomes;
  }

  //Delete income by dragging start to end
  Future<void> deleteIncome(int id, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? existingIncomes = pref.getStringList(_incomeKey);

      //convet to the income object
      List<Income> existingIncomesObjets = [];
      if (existingIncomes != null) {
        existingIncomesObjets = existingIncomes
            .map((e) => Income.formJSON(json.decode(e)))
            .toList();
      }
      //Remove the income
      existingIncomesObjets.removeWhere((element) => element.id == id);
      //convert list of income object back to a list of string
      List<String> updatedIncome =
          existingIncomesObjets.map((e) => json.encode(e.toJSON())).toList();
      //Save the update list in shared preferences
      await pref.setStringList(_incomeKey, updatedIncome);
      //Show snack
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income Deleted Successfully"),
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
