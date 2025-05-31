import 'package:flutter/material.dart';
import 'package:password_app/design/password_app_colors.dart';
import 'package:password_app/design/password_app_radius.dart';
import 'package:password_app/widgets/currency_formatter.dart';
import 'package:password_app/widgets/summary_card.dart';

import '../config/app_routes.dart';
import '../widgets/app_bar_title.dart';

late ButtonStyle categoriesButtonStyle;
late ButtonStyle recentTransactionsButtonStyle;

class HomePage extends StatefulWidget {

  final String storeName;

  const HomePage({super.key, required this.storeName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentDetailsPage = const BottomWidget();

  var disabledButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.white24,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
  var enabledButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: PasswordAppColors.secondaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  @override
  void initState() {
    super.initState();
    categoriesButtonStyle = enabledButtonStyle;
    recentTransactionsButtonStyle = disabledButtonStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: PasswordAppRadius.medium,
            topRight: PasswordAppRadius.medium,
          ),
        ),
        toolbarHeight: 70,
        title:  AppbarTitle(storeName: widget.storeName,),
      ),
      body: Column(
        children: [
          const TopBodyWidget(),
          MidBodyWidget(
            recentTransactionsOnPressed: () {
              setState(() {
                currentDetailsPage = const RecentTransactionsWidget();
                categoriesButtonStyle = disabledButtonStyle;
                recentTransactionsButtonStyle = enabledButtonStyle;
              });
            },
            categoriesOnPressed: () {
              setState(() {
                currentDetailsPage = const BottomWidget();
                categoriesButtonStyle = enabledButtonStyle;
                recentTransactionsButtonStyle = disabledButtonStyle;
              });
            },
          ),
          Expanded(child: currentDetailsPage),
        ],
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.newPage);
                },

                style: TextButton.styleFrom(alignment: Alignment.topRight),
                child: const Text(
                  'View all',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const CategoryDetail(
                pathImage: 'assets/images/photo.jpg',
                upOrDown: UpOrDown.up,
              ),
              const SizedBox(height: 16),
              const CategoryDetail(
                pathImage: 'assets/images/photo.jpg',
                upOrDown: UpOrDown.down,
              ),
              const SizedBox(height: 16),
              const CategoryDetail(
                pathImage: 'assets/images/photo.jpg',
                upOrDown: UpOrDown.up,
              ),
              const SizedBox(height: 16),
              const CategoryDetail(
                pathImage: 'assets/images/photo.jpg',
                upOrDown: UpOrDown.up,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum UpOrDown { up, down }

class CategoryDetail extends StatelessWidget {
  final UpOrDown upOrDown;
  final String pathImage;

  const CategoryDetail({
    super.key,
    required this.pathImage,
    required this.upOrDown,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              height: 79,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PasswordAppColors.secondaryColor,
              ),
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(pathImage)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food & drink',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '+ \$ 123.23 Today',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                      ),
                    ),
                    CurrencyFormatter(
                      amount: 391254.01,
                      padding: EdgeInsets.only(top: 4, right: 2),
                      amountStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PasswordAppColors.purpleColor,
                        fontSize: 20,
                      ),
                      amountStyleSmall: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PasswordAppColors.purpleColor,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 60,
              margin: const EdgeInsets.only(bottom: 70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    upOrDown == UpOrDown.up
                        ? Colors.greenAccent
                        : Colors.redAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.expand_less_rounded, color: Colors.green[900]),
                  Text(
                    '12%',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color:
                          upOrDown == UpOrDown.up
                              ? Colors.green[900]
                              : Colors.red[900],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MidBodyWidget extends StatelessWidget {
  final void Function()? categoriesOnPressed;
  final void Function()? recentTransactionsOnPressed;

  const MidBodyWidget({
    super.key,
    required this.categoriesOnPressed,
    required this.recentTransactionsOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: PasswordAppRadius.medium,
          bottomRight: PasswordAppRadius.medium,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: categoriesOnPressed,
              style: categoriesButtonStyle,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: recentTransactionsOnPressed,
              style: recentTransactionsButtonStyle,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Recent transactions',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBodyWidget extends StatelessWidget {
  const TopBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      transform: Matrix4.translationValues(0.0, -10.0, 0.0),
      decoration: const BoxDecoration(
        color: PasswordAppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: PasswordAppRadius.medium,
          bottomRight: PasswordAppRadius.medium,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25.0),
          Text('Your budget', style: Theme.of(context).textTheme.displaySmall),
          CurrencyFormatter(
            padding: const EdgeInsets.only(top: 8, right: 4),
            amount: 231200.28,
            amountStyle: Theme.of(context).textTheme.displayLarge,
            amountStyleSmall: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 42.0),
          SummaryCardItem(
            amount: 230000,
            title: 'Incomes',
            action: () => print('Hola'),
            typeSummaryCard: TypeSummaryCard.incomes,
          ),
          const SizedBox(height: 8.0),
          SummaryCardItem(
            amount: 1200.18,
            title: 'Spending',
            action: () => print('Hola 2'),
            typeSummaryCard: TypeSummaryCard.spending,
          ),
        ],
      ),
    );
  }
}

class RecentTransactionsWidget extends StatelessWidget {
  const RecentTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Recent transactions');
  }
}
