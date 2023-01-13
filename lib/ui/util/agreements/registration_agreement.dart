import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/util/extensions/text_style_extensions.dart';
import 'package:flutter_core/util/extensions/theme_extensions.dart';

import '../../../util/service/helper_service/translator.dart';

class RegistrationAgreement extends StatelessWidget {
  final Function downloadAgreement;
  final Function changeAgreementStatus;
  final bool agreementStatus;

  const RegistrationAgreement({
    required this.downloadAgreement,
    required this.changeAgreementStatus,
    required this.agreementStatus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      value: agreementStatus,
      title: Transform.translate(
        offset: const Offset(-10, 0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: translate("auth.registration.agreement_first"),
                style: context.currentTheme().textTheme.labelMedium,
              ),
              TextSpan(
                text: translate("auth.registration.agreement_second"),
                style: context.customUnderlineStyle(
                  textSize: 14,
                  color: Colors.red,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => downloadAgreement.call(),
              ),
            ],
          ),
        ),
      ),
      onChanged: (bool? userAgreementState) => changeAgreementStatus.call(),
    );
  }
}
