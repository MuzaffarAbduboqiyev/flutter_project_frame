import 'package:equatable/equatable.dart';
import 'package:flutter_core/util/service/helper_service/type_parse.dart';

class LocationModel extends Equatable {
  final double lat;
  final double lng;
  final String address;

  const LocationModel({
    required this.lat,
    required this.lng,
    required this.address,
  });

  LocationModel copyWith({
    double? lat,
    double? lng,
    String? address,
  }) =>
      LocationModel(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        address: address ?? this.address,
      );

  factory LocationModel.fromMap({
    required double lat,
    required double lng,
    required Map<String, dynamic> response,
  }) =>
      LocationModel(
        lat: lat,
        lng: lng,
        address: parseToString(
          response,
          "address",
        ),
      );

  factory LocationModel.example() => const LocationModel(
        lat: 41.326585,
        lng: 69.255716,
        address: "",
      );

  @override
  List<Object?> get props => [
        lat,
        lng,
        address,
      ];
}
