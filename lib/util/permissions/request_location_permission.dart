import 'package:flutter_core/model/response_model/network_response_model.dart';
import 'package:geolocator/geolocator.dart';

import '../../model/location_model/location_model.dart';

Future<DataResponseModel<LocationModel>> getUserLocation() async {
  final response = await Geolocator.checkPermission();
  final locationPermission = response == LocationPermission.always ||
      response == LocationPermission.whileInUse;

  if (locationPermission == false) {
    await Geolocator.requestPermission();
  }

  if (locationPermission) {
    final userPosition = await Geolocator.getCurrentPosition();
    return DataResponseModel.success(
      model: LocationModel(
        lat: userPosition.latitude,
        lng: userPosition.longitude,
        address: "",
      ),
    );
  } else {
    await Geolocator.openAppSettings();
    return DataResponseModel.error(
      errorType: ResponseErrorType.canceledError,
      responseMessage: "",
    );
  }
}
