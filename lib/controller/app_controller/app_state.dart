import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool isDarkMode;
  final bool hasToken;

  const AppState({
    required this.isDarkMode,
    required this.hasToken,
  });

  factory AppState.initial() => const AppState(
        isDarkMode: true,
        hasToken: false,
      );

  AppState copyWith({
    bool? isDarkMode,
    bool? hasToken,
  }) =>
      AppState(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        hasToken: hasToken ?? this.hasToken,
      );

  @override
  List<Object?> get props => [
        isDarkMode,
        hasToken,
      ];
}
