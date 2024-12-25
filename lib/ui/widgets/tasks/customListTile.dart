import 'package:flutter/material.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.check,
    required this.name,
    required this.resetStateFun,
  });

  final bool check;
  final String name;
  final void Function() resetStateFun;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        contentPadding:
            const EdgeInsets.only(left: 0.0, right: 0, top: 0, bottom: 0),
        title: Text(name,
            style: check == false
                ? TextStyleFonts.BodyText.apply(
                    color: Theme.of(context).colorScheme.onPrimary)
                : TextStyleFonts.CTAText.apply(
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
        trailing: InkWell(
          onTap: resetStateFun,
          child: Icon(
              check == true
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Theme.of(context).colorScheme.secondary),
        ));
  }
}
