import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:fiscal_focus_app/models/income_model.dart';
import 'package:fiscal_focus_app/services/expence_service.dart';
import 'package:fiscal_focus_app/services/income_service.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:fiscal_focus_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewScreen extends StatefulWidget {
  final Function(Expence) addExpense;
  final Function(Income) addIncome;
  const AddNewScreen({
    super.key,
    required this.addExpense,
    required this.addIncome,
  });

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selectedMode = 0;

  IncomeCategory _incomeCategory = IncomeCategory.salery;
  ExpenceCategory _expenceCategory = ExpenceCategory.food;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMode == 0 ? kGreen : kRed,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMode = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _selectedMode == 0 ? kGreen : kWhite,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 58,
                              vertical: 20,
                            ),
                            child: Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: _selectedMode == 0 ? kWhite : kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMode = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _selectedMode == 1 ? kRed : kWhite,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 58,
                              vertical: 20,
                            ),
                            child: Text(
                              "Expence",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: _selectedMode == 1 ? kWhite : kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How Much?",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: kWhite,
                        ),
                      ),
                      TextField(
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: kWhite),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: kWhite,
                              width: 2,
                            ),
                          ),
                          // ignore: deprecated_member_use
                          fillColor: kWhite.withOpacity(0.3),
                          filled: true,
                          hintText: "0",
                          hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.64,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _selectedMode == 0
                          ? Color.fromARGB(255, 111, 255, 15)
                          : Color.fromARGB(255, 252, 47, 81),
                      _selectedMode == 1
                          ? Color.fromARGB(255, 252, 252, 113)
                          : Color.fromARGB(255, 252, 252, 113),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding * 2),
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          dropdownColor: _selectedMode == 0 ? kGreen : kRed,
                          iconEnabledColor: kWhite,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kWhite,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: kWhite,
                                  width: 3,
                                )),
                          ),
                          items: _selectedMode == 0
                              ? IncomeCategory.values.map((category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(
                                      category.name,
                                      style: TextStyle(
                                        color: kWhite,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                }).toList()
                              : ExpenceCategory.values.map((category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(
                                      category.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: kWhite,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          value: _selectedMode == 0
                              ? _incomeCategory
                              : _expenceCategory,
                          onChanged: (value) {
                            setState(() {
                              _selectedMode == 0
                                  ? _incomeCategory = value as IncomeCategory
                                  : _expenceCategory = value as ExpenceCategory;
                            });
                          },
                        ),
                        SizedBox(
                          height: kSizedBoxValue,
                        ),
                        //Title
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kWhite,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: kWhite,
                                  width: 3,
                                )),
                            hintText: "Title",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kSizedBoxValue,
                        ),
                        //Description
                        TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kWhite,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: kWhite,
                                  width: 3,
                                )),
                            hintText: "Description",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kSizedBoxValue,
                        ),
                        //Amount
                        TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kWhite,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: kWhite,
                                  width: 3,
                                )),
                            hintText: "Amount",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kSizedBoxValue,
                        ),
                        //Date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2026),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedDate = value;
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: kGrey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding,
                                    vertical: kDefaultPadding,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: kWhite,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Select Date",
                                        style: TextStyle(
                                            color: kWhite,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(_selectedDate),
                              style: TextStyle(
                                color: kGrey,
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: kSizedBoxValue,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedTime = DateTime(
                                        _selectedDate.year,
                                        _selectedDate.month,
                                        _selectedDate.day,
                                        _selectedTime.hour,
                                        _selectedTime.minute,
                                      );
                                    });
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: kGrey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding,
                                    vertical: kDefaultPadding,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timer_outlined,
                                        color: kWhite,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Select Time",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: kWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.jm().format(_selectedTime),
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                                color: kGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: kSizedBoxValue,
                        ),
                        Divider(
                          color: kWhite,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: kSizedBoxValue,
                        ),
                        //Add Button
                        GestureDetector(
                          onTap: () async {
                            if (_selectedMode == 0) {
                              //Save Income
                              List<Income> loadedIncomes =
                                  await IncomeService().loadIncomes();

                              Income income = Income(
                                id: loadedIncomes.length + 1,
                                title: _titleController.text,
                                amount: _amountController.text.isEmpty
                                    ? 0
                                    : double.parse(_amountController.text),
                                category: _incomeCategory,
                                date: _selectedDate,
                                time: _selectedTime,
                                description: _descriptionController.text,
                              );
                              //Add Income
                              widget.addIncome(income);

                              //Clear Fields
                              _titleController.clear();
                              _amountController.clear();
                              _descriptionController.clear();

                            } else {
                              //Save Data
                              List<Expence> loadedExpences =
                                  await ExpenceService().loadExpences();
                              Expence expence = Expence(
                                id: loadedExpences.length + 1,
                                title: _titleController.text,
                                amount: _amountController.text.isEmpty
                                    ? 0
                                    : double.parse(_amountController.text),
                                category: _expenceCategory,
                                date: _selectedDate,
                                time: _selectedTime,
                                description: _descriptionController.text,
                              );
                              //Add Expense
                              widget.addExpense(expence);

                              //Clear Fields
                              _titleController.clear();
                              _amountController.clear();
                              _descriptionController.clear();
                            }
                          },
                          child: CustomButton(
                            buttonName: "Add",
                            buttonColor: kLightYellow,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
