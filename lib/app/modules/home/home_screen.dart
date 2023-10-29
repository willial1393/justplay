import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:justplay/app/modules/home/widgets/home_places.dart';
import 'package:justplay/app/modules/home/widgets/home_profile.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return JpScaffold(
      preventExitApp: true,
      navigationItems: [
        NavigationItem(
          label: 'Places',
          icon: Icons.place_outlined,
          screen: const HomePlaces(),
        ),
        NavigationItem(
          label: 'Account',
          icon: Icons.account_circle_outlined,
          screen: const HomeProfile(),
        ),
      ],
    );
  }
}
