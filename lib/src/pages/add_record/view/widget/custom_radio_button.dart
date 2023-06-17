import 'package:flutter/material.dart';
import '../../../../infrastructure/theme/my_theme.dart';
import '../../../shared/model/enum_record_type.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton(
      {super.key,
      required this.recordType,
      required this.groupTypeValue,
      required this.onChoice,
      required this.label});

  final String label;
  final RecordTypeEnum recordType;
  final RecordTypeEnum groupTypeValue;
  final void Function(RecordTypeEnum recordType) onChoice;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration radioBoxDecoration = (groupTypeValue == recordType)
        ? MainTheme.activeRadioButtonDecoration
        : MainTheme.deActiveRadioButtonDecoration;
    final TextStyle radioTextStyle = (groupTypeValue == recordType)
        ? MainTheme.activeRadioButtonTextStyle
        : MainTheme.deActiveRadioButtonTextStyle;
    return InkWell(
      onTap: () {
        onChoice(recordType);
      },
      child: DecoratedBox(
        decoration: radioBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Center(
            child: Text(
              label,
              style: radioTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
