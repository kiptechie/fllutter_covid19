import 'package:flluttercovid19/utils/colors.dart';
import 'package:flluttercovid19/utils/help_card.dart';
import 'package:flluttercovid19/utils/info_card.dart';
import 'package:flluttercovid19/utils/prevention_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor.withOpacity(.03),
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
    title: Text(
      "COVID-19 App",
      style: TextStyle(color: kPrimaryColor),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/search.svg"),
        onPressed: () {},
      )
    ],
  );
}

SingleChildScrollView buildBody(context) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
            bottom: 40,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.03),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: buildWrap(context),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Preventions",
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    PreventionCards(
                      "assets/icons/hand_wash.svg",
                      "Wash Hands",
                    ),
                    PreventionCards(
                      "assets/icons/use_mask.svg",
                      "Use Masks",
                    ),
                    PreventionCards(
                      "assets/icons/Clean_Disinfect.svg",
                      "Clean Disinfect",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              HelpCard(),
            ],
          ),
        ),
      ],
    ),
  );
}

Wrap buildWrap(context) {
  return Wrap(
    runSpacing: 20,
    spacing: 20,
    children: <Widget>[
      InfoCard(
        "Confirmed Cases",
        Color(0xFFFF8C00),
        323005,
        openDetailsPage(context),
      ),
      InfoCard(
        "Total Deaths",
        Color(0xFFFF2D55),
        3230,
        openDetailsPage(context),
      ),
      InfoCard(
        "Total Recoveries",
        Color(0xFF50E3C2),
        689,
        openDetailsPage(context),
      ),
      InfoCard(
        "New Cases",
        Color(0xFF5856D6),
        75,
        openDetailsPage(context),
      ),
    ],
  );
}

Function openDetailsPage(context) {
  return () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailsPage();
        },
      ),
    );
  };
}
