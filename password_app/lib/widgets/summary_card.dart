import 'package:flutter/material.dart';
import 'package:password_app/design/password_app_radius.dart';
import 'package:password_app/widgets/currency_formatter.dart';

enum TypeSummaryCard { incomes, spending }

class SummaryCardItem extends StatelessWidget {
  final String title;
  final double amount;
  final Function()? action;
  final TypeSummaryCard typeSummaryCard;

  const SummaryCardItem({
    super.key,
    required this.title,
    required this.amount,
    required this.action,
    required this.typeSummaryCard,
  });

  @override
  Widget build(BuildContext context) {
    var incomesIcon = const Icon(Icons.arrow_upward, color: Colors.cyan);
    var spendingIcon = const Icon(
      Icons.arrow_downward,
      color: Colors.deepOrangeAccent,
    );

    return Container(
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: const BorderRadius.all(PasswordAppRadius.medium),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(PasswordAppRadius.small),
            ),
            child:
                typeSummaryCard == TypeSummaryCard.incomes
                    ? incomesIcon
                    : spendingIcon,
          ),
          Expanded(
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CurrencyFormatter(
                  amount: amount,
                  amountStyle: Theme.of(context).textTheme.displayMedium,
                  amountStyleSmall: Theme.of(context).textTheme.displaySmall,
                ),
                const Text(
                  'From January 1 to January 31',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'MontserratBold',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(PasswordAppRadius.small),
              border: Border.all(color: Colors.white),
            ),
            child: IconButton(
              onPressed: action,
              color: Colors.white,
              icon: const Icon(Icons.chevron_right_rounded),
            ),
          ),
        ],
      ),
    );
  }
}