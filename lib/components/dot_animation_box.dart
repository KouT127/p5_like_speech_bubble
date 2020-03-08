import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

class DotAnimationState {
  const DotAnimationState({
    this.isEnableLeft,
    this.isEnableCenter,
    this.isEnableRight,
    this.shouldEnable,
  });

  final bool isEnableLeft;
  final bool isEnableCenter;
  final bool isEnableRight;

  final bool shouldEnable;

  DotAnimationState copyWidth({
    bool isEnableLeft,
    bool isEnableCenter,
    bool isEnableRight,
    bool shouldEnable,
  }) {
    return DotAnimationState(
      isEnableLeft: isEnableLeft ?? this.isEnableLeft,
      isEnableCenter: isEnableCenter ?? this.isEnableCenter,
      isEnableRight: isEnableRight ?? this.isEnableRight,
      shouldEnable: shouldEnable ?? this.shouldEnable,
    );
  }
}

class DotAnimationNotifier extends StateNotifier<DotAnimationState>
    with LocatorMixin {
  DotAnimationNotifier(value) : super(value) {
    startTimer();
  }

  factory DotAnimationNotifier.initialize() {
    return DotAnimationNotifier(DotAnimationState(
      isEnableLeft: false,
      isEnableCenter: false,
      isEnableRight: false,
      shouldEnable: true,
    ));
  }

  void startTimer() {
    Timer.periodic(Duration(milliseconds: 400), (timer) {
      if (state.shouldEnable) {
        enableNextDot();
      } else {
        disableNextDot();
      }
    });
  }

  void enableNextDot() {
    if (!state.isEnableLeft) {
      state = state.copyWidth(isEnableLeft: true);
    } else if (!this.state.isEnableCenter) {
      state = state.copyWidth(isEnableCenter: true);
    } else if (!this.state.isEnableRight) {
      state = state.copyWidth(
        isEnableRight: true,
        shouldEnable: false,
      );
    }
  }

  void disableNextDot() {
    if (this.state.isEnableLeft) {
      state = state.copyWidth(isEnableLeft: false);
    } else if (this.state.isEnableCenter) {
      state = state.copyWidth(isEnableCenter: false);
    } else if (this.state.isEnableRight) {
      state = state.copyWidth(
        isEnableRight: false,
        shouldEnable: true,
      );
    }
  }
}

class DotAnimationBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<DotAnimationNotifier, DotAnimationState>(
      create: (_) => DotAnimationNotifier.initialize(),
      child: _DotAnimationBox(),
    );
  }
}

class _DotAnimationBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 15),
        child: Transform(
          transform: Matrix4.skewX(-.3),
          child: SizedBox(
            width: 50,
            height: 35,
            child: ColoredBox(
              color: Colors.black38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(width: 8),
                  context.select(
                    (DotAnimationState state) => buildDot(state.isEnableLeft),
                  ),
                  context.select(
                    (DotAnimationState state) => buildDot(state.isEnableCenter),
                  ),
                  context.select(
                    (DotAnimationState state) => buildDot(state.isEnableRight),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDot(bool isEnable) {
    return SizedBox(
      width: 6,
      height: 6,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isEnable ? Color(0xffc11526) : Colors.transparent,
        ),
      ),
    );
  }
}
