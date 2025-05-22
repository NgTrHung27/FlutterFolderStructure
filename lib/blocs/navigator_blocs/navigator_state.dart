import 'package:advanced_flutter/blocs/navigator_blocs/navigator_types.dart';
import 'package:equatable/equatable.dart';

class NavigatorState extends Equatable {
  final NavigatorType navigatorType;
  final bool reload;
  final bool isExpriedToken;

  const NavigatorState({
    required this.navigatorType,
    required this.reload,
    this.isExpriedToken = false,
  });

  NavigatorState update({
    NavigatorType? navigatorType,
    bool? reload,
    bool? isExpriedToken,
  }) {
    return NavigatorState(
      navigatorType: navigatorType ?? this.navigatorType,
      reload: reload ?? this.reload,
      isExpriedToken: isExpriedToken ?? this.isExpriedToken,
    );
  }

  @override
  List<Object> get props => [
        navigatorType,
        reload,
        isExpriedToken,
      ];
}
