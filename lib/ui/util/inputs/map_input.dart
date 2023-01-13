import 'package:flutter/material.dart';
import 'package:flutter_core/util/extensions/input_decoration_extensions.dart';
import 'package:flutter_core/util/extensions/text_style_extensions.dart';
import 'package:flutter_core/util/service/helper_service/translator.dart';

class MapInput extends StatelessWidget {
  final TextEditingController inputController;
  final String label;
  final Function openMap;
  final String? errorMessage;

  const MapInput({
    required this.inputController,
    required this.label,
    required this.openMap,
    this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextFormField(
        onTap: () => openMap(),
        readOnly: true,
        style: context.bodyLargeStyle(),
        minLines: 1,
        maxLines: 5,
        controller: inputController,
        decoration: context.mapInputDecoration(
          hint: label,
          errorMessage: errorMessage,
        ),
        validator: (value){
          if(value != null && value.isNotEmpty){
            return null;
          }else{
            return translate("error.validation.empty");
          }
        },
      ),
    );
  }
}
