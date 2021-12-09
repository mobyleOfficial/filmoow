import 'package:filmoow/generated/l10n.dart';
import 'package:filmoow/presentation/common/alert_dialog/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class GenericErrorAlertDialog extends StatelessWidget {
  const GenericErrorAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomAlertDialog(
        S.of(context).genericErrorDialogPrimaryText,
        S.of(context).genericErrorDialogButtonText,
        secondaryMessage: S.of(context).genericErrorDialogSecondaryText,
        icon: Icons.error,
      );
}
