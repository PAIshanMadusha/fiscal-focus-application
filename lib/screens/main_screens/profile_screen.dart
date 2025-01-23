import 'package:fiscal_focus_app/screens/onboarding_screens.dart';
import 'package:fiscal_focus_app/services/expence_service.dart';
import 'package:fiscal_focus_app/services/income_service.dart';
import 'package:fiscal_focus_app/services/user_service.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:fiscal_focus_app/widgets/profile_item_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "";
  String userEmail = "";
  @override
  void initState() {
    UserService.getUserData().then((value) {
      if (value["userName"] != null && value["email"] != null) {
        setState(() {
          userName = value["userName"]!;
          userEmail = value["email"]!;
        });
      }
    });
    super.initState();
  }

  //Logout
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: kWhite,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Are you sure you want to logout?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kBlack,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: kSizedBoxValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                        kRed,
                      )),
                      onPressed: () async {
                        //Clear use Data
                        await UserService.clearUserData();
                        //Clear Incomes & Expenses
                        if (context.mounted) {
                          await IncomeService().deleteAllIncomes(context);
                          await ExpenceService().deleteAllExpenses(context);

                          //Navigate to OnboardScreens
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnboardingScreens(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          kLightGrey,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                            color: kWhite, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: kTextFieldColor,
                          width: 4,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/ishan.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: kSizedBoxValue,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            userName.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kLightGrey,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        Text(
                          userEmail.toLowerCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kLightGrey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kLightYellow,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: 32,
                          color: kGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: kSizedBoxValue * 2,
                ),
                ProfileItemCard(
                  title: "My Wallet",
                  icon: Icons.wallet,
                  box: kMainColor,
                ),
                ProfileItemCard(
                  title: "Setting",
                  icon: Icons.settings,
                  box: kGreen,
                ),
                ProfileItemCard(
                  title: "Export Data",
                  icon: Icons.download,
                  box: kOrange,
                ),
                GestureDetector(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  child: ProfileItemCard(
                    title: "Logout",
                    icon: Icons.logout,
                    box: kRed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
