import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter extends StatelessWidget {
  final double amount;
  final EdgeInsets? padding;
  final TextStyle? amountStyle;
  final TextStyle? amountStyleSmall;

  const CurrencyFormatter({
    super.key,
    this.padding,
    required this.amount,
    required this.amountStyle,
    required this.amountStyleSmall,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      symbol: '',
      locale: 'es',
      decimalDigits: 2,
      customPattern: '#,### \u00a4',
    );

    final String convertMoneyToString = formatter.format(amount);

    final List<String> splitConvertedValues = convertMoneyToString.split(',');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: padding ?? const EdgeInsets.only(top: 2.0, right: 5.0),
          child: Text('\$', style: amountStyleSmall),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: splitConvertedValues[0], style: amountStyle),
              TextSpan(
                text: ',${splitConvertedValues[1]}',
                style: amountStyleSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
