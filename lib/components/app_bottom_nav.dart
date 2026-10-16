import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/internationalization.dart';
import '/index.dart';
import '/soundscapes/soundscapes_launcher.dart';

/// The app's bottom tab bar for pages that live outside the main tabs (Body, Mind, …),
/// so people can always get back to Home, Lucille, Explore, Sound or Market.
/// Looks the same as the bar in NavBarPage (main.dart); tapping a tab goes to that tab.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, this.currentTab = 'ExplorePageVersion5FINAL'});

  /// The tab this page belongs to, highlighted in the bar.
  final String currentTab;

  static const _tabs = [
    'HomeVersion5',
    'LucilleHome',
    'ExplorePageVersion5FINAL',
    'AISoundscapesFINAL',
    'MarketplaceVersion5',
  ];

  void _onTap(BuildContext context, int i) {
    HapticFeedback.lightImpact();
    switch (_tabs[i]) {
      case 'HomeVersion5':
        context.goNamed(HomeVersion5Widget.routeName);
        break;
      case 'LucilleHome':
        context.goNamed(LucilleHomeWidget.routeName);
        break;
      case 'ExplorePageVersion5FINAL':
        context.goNamed(ExplorePageVersion5FINALWidget.routeName);
        break;
      case 'AISoundscapesFINAL':
        SoundscapesLauncher.openOrFallback(context);
        break;
      case 'MarketplaceVersion5':
        context.goNamed(MarketplaceVersion5Widget.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = _tabs.indexOf(currentTab);
    return BottomNavigationBar(
      currentIndex: index < 0 ? 0 : index,
      onTap: (i) => _onTap(context, i),
      backgroundColor: const Color(0xBDEDF1F7),
      selectedItemColor: FlutterFlowTheme.of(context).accent1,
      unselectedItemColor: const Color(0xA55A5C60),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined, size: 24.0),
          label: FFLocalizations.of(context).getText('vq4xsokl' /* Home */),
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(FFIcons.ksparkleStarAi, size: 24.0),
          label: FFLocalizations.of(context).getText('uw8vfq28' /* Lucille */),
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore, size: 24.0),
          label: FFLocalizations.of(context).getText('hfk8faw6' /* Explore */),
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(FFIcons.kmusic1),
          activeIcon: const Icon(Icons.surround_sound),
          label: FFLocalizations.of(context).getText('s8tgji9v' /* Sound */),
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(FFIcons.kmarket, size: 24.0),
          label: FFLocalizations.of(context).getText('6kelildm' /* Market */),
          tooltip: '',
        ),
      ],
    );
  }
}
