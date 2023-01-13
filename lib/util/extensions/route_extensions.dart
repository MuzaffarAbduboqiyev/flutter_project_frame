import 'package:flutter/material.dart';

extension RouteExtensions on BuildContext {
  Future<bool> replace({
    required String screenName,
    Object? arguments,
  }) async {
    await Navigator.pushReplacementNamed(
      this,
      screenName,
      arguments: arguments,
    );
    return true;
  }

  Future<Object?> go({
    required String screenName,
    Object? arguments,
  }) async {
    final response = await Navigator.pushNamed(
      this,
      screenName,
      arguments: arguments,
    );
    return response;
  }

  Future goAndBack({
    required String screenName,
    required String backScreenName,
    Object? arguments,
  }) async {
    final response = await Navigator.pushNamedAndRemoveUntil(
      this,
      screenName,
      ModalRoute.withName(backScreenName),
      arguments: arguments,
    );

    return response;
  }

  back<T>({
    required T result,
  }) {
    Navigator.pop<T>(
      this,
      result,
    );
  }
}
