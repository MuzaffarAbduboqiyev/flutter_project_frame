import 'package:flutter_core/model/response_model/network_response_model.dart';
import 'package:flutter_core/util/service/helper_service/translator.dart';
import 'package:flutter_core/util/service/helper_service/type_parse.dart';

DataResponseModel<T> getDataResponseErrorHandler<T>(
    NetworkResponseModel response) {
  if (response.status == true && response.response != null) {
    if (response.response?.data.containsKey("error") == true) {
      if (response.response?.data["error"] is Map &&
          response.response?.data["error"].containsKey("message") == true) {
        return DataResponseModel.error(
          errorType: ResponseErrorType.dataError,
          responseMessage: parseToString(
            response.response?.data["error"],
            "message",
          ),
        );
      } else {
        return DataResponseModel.error(
          errorType: ResponseErrorType.dataError,
          responseMessage: parseToString(
            response.response?.data,
            "error",
          ),
        );
      }
    } else if (response.response?.data.containsKey("message") == true) {
      if (response.response?.data["message"].containsKey("ru") == true) {
        return DataResponseModel.error(
          errorType: ResponseErrorType.dataError,
          responseMessage: parseToString(
            response.response?.data["message"],
            "ru",
          ),
        );
      } else {
        return DataResponseModel.error(
          errorType: ResponseErrorType.dataError,
          responseMessage: parseToString(
            response.response?.data,
            "message",
          ),
        );
      }
    } else {
      return DataResponseModel.error(
        errorType: ResponseErrorType.dataError,
        responseMessage: translate("error.unknown_error"),
      );
    }
  } else {
    return DataResponseModel.error(
      errorType: response.errorType,
      responseMessage: response.errorMessage,
    );
  }
}

SimpleResponseModel getSimpleResponseErrorHandler(
    NetworkResponseModel response) {
  if (response.status == true && response.response != null) {
    if (response.response?.data.containsKey("error") == true) {
      if (response.response?.data["error"] is Map &&
          response.response?.data["error"].containsKey("message") == true) {
        return SimpleResponseModel.error(
          errorType: ResponseErrorType.dataError,
          responseMessage: parseToString(
            response.response?.data["error"],
            "message",
          ),
        );
      } else {
        return SimpleResponseModel.error(
          errorType: ResponseErrorType.dataError,
          responseMessage: parseToString(
            response.response?.data,
            "error",
          ),
        );
      }
    } else if (response.response?.data.containsKey("message") == true) {
      if (response.response?.data["message"].containsKey("ru") == true) {
        return SimpleResponseModel.error(
          errorType: ResponseErrorType.dataError,
          responseMessage: parseToString(
            response.response?.data["message"],
            "ru",
          ),
        );
      } else {
        return SimpleResponseModel.error(
          errorType: ResponseErrorType.dataError,
          responseMessage: parseToString(
            response.response?.data,
            "message",
          ),
        );
      }
    } else {
      return SimpleResponseModel.error(
        errorType: ResponseErrorType.dataError,
        responseMessage: translate("error.unknown_error"),
      );
    }
  } else {
    return SimpleResponseModel.error(
      errorType: response.errorType,
      responseMessage: response.errorMessage,
    );
  }
}
