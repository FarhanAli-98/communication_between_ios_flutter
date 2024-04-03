import 'package:flutter/material.dart';

const playerSwiftUiView = 'NativeView';

class SwiftUiKit extends StatelessWidget {
  const SwiftUiKit({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 50, width: 50, child: UiKitView(viewType: playerSwiftUiView));
  }
}
