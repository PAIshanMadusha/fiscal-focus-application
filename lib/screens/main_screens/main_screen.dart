import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:fiscal_focus_app/screens/main_screens/add_new_screen.dart';
import 'package:fiscal_focus_app/screens/main_screens/budget_screen.dart';
import 'package:fiscal_focus_app/screens/main_screens/home_screen.dart';
import 'package:fiscal_focus_app/screens/main_screens/profile_screen.dart';
import 'package:fiscal_focus_app/screens/main_screens/transaction_screen.dart';
import 'package:fiscal_focus_app/services/expence_service.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 2;

  void fetchAllExpences() async {
    List <Expence> loadedExpences = await ExpenceService().loadExpences();
    setState(() {
      expenceList = loadedExpences;
    }); 
  }
  //Add a New Expence
  void addNewExpences(Expence newExpence){
    ExpenceService().saveExpences(newExpence, context);

    //Update List
    setState(() {
      expenceList.add(newExpence);
    });
  }

  @override
  void initState() {
    setState(() {
      fetchAllExpences();
    });
    super.initState();
  }

  List <Expence> expenceList = [];
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      TransactionScreen(),
      AddNewScreen(
        addExpense: addNewExpences,
      ),
      BudgetScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kGreen,
        unselectedItemColor: kBlack,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
        currentIndex: _currentScreenIndex,
        onTap: (index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [kGreen, kLightYellow],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Icon(
                Icons.add,
                color: kWhite,
                size: 35,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_rounded),
            label: "Budget",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: screens[_currentScreenIndex],
    );
  }
}
