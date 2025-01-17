import 'package:fiscal_focus_app/services/user_service.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:fiscal_focus_app/widgets/income_expence_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "";

  @override
  void initState() {
    UserService.getUserData().then((value) {
      if (value["userName"] != null) {
        setState(() {
          userName = value["userName"]!;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  gradient: LinearGradient(
                    colors: [kLightYellow, kTextFieldColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kTextFieldColor,
                      offset: Offset(1, 2)
                    ),
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: kTextFieldColor,
                                )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/ishan.jpg",
                                width: 65,
                                height: 65,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "WELCOME ${userName.toUpperCase()}",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                              color: kBlack,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              size: 38,
                              color: kBlack,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kSizedBoxValue * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IncomeExpenceCard(
                            title: "Income",
                            amount: 0.4,
                            imgUrl: "assets/images/income.png",
                            bgColor: kGreen,
                          ),
                          IncomeExpenceCard(
                            title: "Expence",
                            amount: 100,
                            imgUrl: "assets/images/spendingmoney.png",
                            bgColor: kRed,
                          ),
                        ],
                      ),
                    ],
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
