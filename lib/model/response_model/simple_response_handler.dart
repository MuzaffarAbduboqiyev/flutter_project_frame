
import 'package:flutter_core/model/response_model/error_handler.dart';
import 'package:flutter_core/model/response_model/network_response_model.dart';

SimpleResponseModel simpleResponseHandler({
  required NetworkResponseModel response,
}) {
  try {
    if (response.status && response.response != null) {
      if (response.response?.data.containsKey("status") &&
          response.response?.data["status"]) {
        return SimpleResponseModel.success();
      } else {
        return getSimpleResponseErrorHandler(response);
      }
    } else {
      return SimpleResponseModel.error(
        errorType: response.errorType,
        responseMessage: response.errorMessage,
      );
    }
  } catch (error) {
    return SimpleResponseModel.error(
      errorType: ResponseErrorType.parseError,
      responseMessage: error.toString(),
    );
  }
}
