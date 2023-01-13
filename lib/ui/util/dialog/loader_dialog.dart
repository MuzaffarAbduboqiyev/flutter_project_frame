import 'package:flutter_core/util/service/helper_service/translator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

showErrorDialog({required String? errorMessage}) {
  hideLoadingDialog();
  EasyLoading.showError(
    errorMessage ?? translate("error.unknown_error"),
    duration: const Duration(
      seconds: 5,
    ),
  );
}

showSuccessDialog({required String? successMessage}) {
  hideLoadingDialog();
  EasyLoading.instance.successWidget = null;
  EasyLoading.showSuccess(
    successMessage ?? "",
    duration: const Duration(
      seconds: 5,
    ),
  );
}

hideLoadingDialog() {
  if (EasyLoading.isShow) {
    EasyLoading.dismiss();
  }
}

showLoadingDialog() {
  if (EasyLoading.isShow == false) {
    EasyLoading.show();
  } else {
    hideLoadingDialog();
    EasyLoading.show();
  }
}
