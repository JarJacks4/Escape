// Marketplace starter picks from Lucille, plus "My Collection" (what a person has added).
//
// Everything here is free and opens a real screen in the app. Adding an item saves it to the
// person's collection on this device (per account); My Collection lists them and opens them.
// To add a pick, append a MarketItem to `kMarketItems`.

import 'dart:convert';

import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/soundscapes/soundscapes_launcher.dart';

class MarketItem {
  const MarketItem(this.id, this.category, this.title, this.blurb, this.minutes, this.icon, this.color, this.open);

  final String id;
  final String category;
  final String title;
  final String blurb;
  final int minutes; // 0 = open-ended
  final IconData icon;
  final Color color;
  final Future<void> Function(BuildContext context) open;

  String get meta => minutes > 0 ? '$category • $minutes min' : category;
}

Future<void> _go(BuildContext c, String route, [Map<String, String> q = const {}]) async =>
    c.pushNamed(route, queryParameters: q);

final List<MarketItem> kMarketItems = [
  MarketItem('calm_evening', 'Soundscapes', 'Calm Evening', 'Slow pads and soft textures to wind the day down.', 0,
      Icons.graphic_eq_rounded, const Color(0xFF5C6BC0), (c) => SoundscapesLauncher.openOrFallback(c)),
  MarketItem('focus_flow', 'Focus', 'Focus Flow', 'A steady sound bed for deep work and study.', 25,
      Icons.center_focus_strong_rounded, const Color(0xFF26A69A), (c) => _go(c, IncreaseFocusGoalWidget.routeName)),
  MarketItem('deep_sleep', 'Sleep', 'Deep Sleep Ritual', 'A gentle path from awake to asleep.', 30,
      Icons.nights_stay_rounded, const Color(0xFF3949AB), (c) => _go(c, DeepSleepGoalWidget.routeName)),
  MarketItem('insomnia', 'Sleep', 'Insomnia Relief', 'For nights when your mind will not switch off.', 20,
      Icons.bedtime_rounded, const Color(0xFF5E35B1), (c) => _go(c, InsomniaGoalWidget.routeName)),
  MarketItem('power_nap', 'Sleep', 'Power Nap', 'A short recharge with a soft wake-up.', 15,
      Icons.battery_charging_full_rounded, const Color(0xFF8E24AA), (c) => _go(c, SmallNapGoalWidget.routeName)),
  MarketItem('anxiety_relief', 'Calm', 'Anxiety Relief', 'Binaural sound to ease a racing mind.', 10,
      Icons.spa_rounded, const Color(0xFF00897B), (c) => _go(c, AnxietyReliefGoalWidget.routeName)),
  MarketItem('overthinking', 'Calm', 'Calm Overthinking', 'Quiet the loop of racing thoughts.', 12,
      Icons.psychology_rounded, const Color(0xFF7CB342), (c) => _go(c, ADHDAndOverthinkingGoalWidget.routeName)),
  MarketItem('box_breathing', 'Breathing', 'Box Breathing', 'Four counts in, hold, out, hold. Steady and simple.', 4,
      Icons.crop_square_rounded, const Color(0xFF039BE5), (c) => _go(c, BoxBreathingGoalPageWidget.routeName)),
  MarketItem('basic_breathing', 'Breathing', 'Basic Breathing', 'Three easy breaths to begin. No experience needed.', 5,
      Icons.air_rounded, const Color(0xFF29B6F6), (c) => _go(c, BasicBreathingGoalPageWidget.routeName)),
  MarketItem('gratitude', 'Journal', 'Gratitude Journal', 'Three small things worth noticing today.', 5,
      Icons.favorite_rounded, const Color(0xFFEC407A), (c) => _go(c, JournalHomeV2Widget.routeName, {'mode': 'gratitude'})),
  MarketItem('free_write', 'Journal', 'Free Write', 'Put it all on the page. Lucille reflects it back.', 10,
      Icons.edit_note_rounded, const Color(0xFFFF7043), (c) => _go(c, JournalHomeV2Widget.routeName, {'mode': 'free'})),
  MarketItem('morning_move', 'Movement', 'Morning Movement', 'Yoga, Pilates, Tai Chi or Exercise: 10 moves each.', 10,
      Icons.self_improvement_rounded, const Color(0xFFFFA726), (c) => _go(c, BodyPageVersion5Widget.routeName)),
  MarketItem('quick_reset', 'Reset', 'Quick Reset', 'A few minutes to clear your head between tasks.', 3,
      Icons.restart_alt_rounded, const Color(0xFF26C6DA), (c) => _go(c, ResetPageCopyWidget.routeName)),
  MarketItem('mood_scan', 'Check-in', 'Mood Scan', 'Read your pulse, name the feeling, get a soundscape.', 2,
      Icons.favorite_border_rounded, const Color(0xFFEF5350), (c) => SoundscapesLauncher.openMoodScan(c)),
  MarketItem('talk_lucille', 'Lucille', 'Talk with Lucille', 'Tell Lucille how you feel and get shortcuts that help.', 0,
      Icons.chat_bubble_rounded, const Color(0xFFAB47BC), (c) => _go(c, ChatWithLucilleVersion5Widget.routeName)),
];

/// The person's collection: ids of added items, saved per account on this device.
class MyCollection {
  static final ValueNotifier<Set<String>> items = ValueNotifier<Set<String>>({});
  static String? _loadedFor;

  static String get _key => 'my_collection_${FirebaseAuth.instance.currentUser?.uid ?? 'guest'}';

  static Future<void> load() async {
    final uid = FirebaseAuth.instance.currentUser?.uid ?? 'guest';
    if (_loadedFor == uid) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      items.value = raw == null ? <String>{} : (jsonDecode(raw) as List).map((e) => e.toString()).toSet();
    } catch (_) {
      items.value = <String>{};
    }
    _loadedFor = uid;
  }

  static Future<void> _save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, jsonEncode(items.value.toList()));
    } catch (_) {}
  }

  static Future<void> toggle(String id) async {
    final next = {...items.value};
    if (!next.add(id)) next.remove(id);
    items.value = next;
    await _save();
  }
}

class LucilleMarketplace extends StatefulWidget {
  const LucilleMarketplace({super.key});

  @override
  State<LucilleMarketplace> createState() => _LucilleMarketplaceState();
}

class _LucilleMarketplaceState extends State<LucilleMarketplace> {
  String _filter = 'All';

  @override
  void initState() {
    super.initState();
    MyCollection.load();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final cats = ['All', ...{for (final i in kMarketItems) i.category}];
    return ValueListenableBuilder<Set<String>>(
      valueListenable: MyCollection.items,
      builder: (context, owned, _) {
        final shown = kMarketItems.where((i) => _filter == 'All' || i.category == _filter).toList();
        return Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
              children: [
                Text('Marketplace',
                    style: theme.headlineMedium.override(
                        fontFamily: 'The Seasons', color: theme.info, letterSpacing: 0.0)),
                const SizedBox(height: 4),
                Text('Free starter picks from Lucille. Add the ones you like to My Collection.',
                    style: theme.bodyMedium.override(fontFamily: 'WorkSans', color: theme.info, letterSpacing: 0.0)),
                const SizedBox(height: 14),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: cats.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (_, i) => ChoiceChip(
                      label: Text(cats[i]),
                      selected: _filter == cats[i],
                      onSelected: (_) => setState(() => _filter = cats[i]),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                for (final item in shown) _ItemCard(item: item, added: owned.contains(item.id)),
              ],
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: SafeArea(
                top: false,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    backgroundColor: const Color(0xFF1C2444),
                  ),
                  onPressed: () => openMyCollection(context),
                  icon: const Icon(Icons.bookmarks_rounded),
                  label: Text('My Collection (${owned.length})'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({required this.item, required this.added, this.onRemoveOnly = false});

  final MarketItem item;
  final bool added;
  final bool onRemoveOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: item.color.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(color: item.color.withOpacity(0.15), shape: BoxShape.circle),
            child: Icon(item.icon, color: item.color, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1C2444))),
                const SizedBox(height: 2),
                Text(item.blurb, style: const TextStyle(fontSize: 13, color: Color(0xFF4A5170))),
                const SizedBox(height: 4),
                Text(item.meta,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: item.color)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!onRemoveOnly)
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(84, 36),
                    backgroundColor: added ? item.color.withOpacity(0.12) : null,
                  ),
                  onPressed: () async {
                    HapticFeedback.selectionClick();
                    await MyCollection.toggle(item.id);
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        content: Text(added ? 'Removed from My Collection' : 'Added to My Collection'),
                        duration: const Duration(seconds: 2),
                      ));
                  },
                  child: Text(added ? 'Added ✓' : 'Add'),
                ),
              const SizedBox(height: 6),
              TextButton(
                style: TextButton.styleFrom(minimumSize: const Size(84, 32), padding: EdgeInsets.zero),
                onPressed: () => item.open(context),
                child: const Text('Open'),
              ),
              if (onRemoveOnly)
                TextButton(
                  style: TextButton.styleFrom(minimumSize: const Size(84, 32), padding: EdgeInsets.zero),
                  onPressed: () => MyCollection.toggle(item.id),
                  child: const Text('Remove'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

void openMyCollection(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyCollectionPage()));
}

class MyCollectionPage extends StatefulWidget {
  const MyCollectionPage({super.key});

  @override
  State<MyCollectionPage> createState() => _MyCollectionPageState();
}

class _MyCollectionPageState extends State<MyCollectionPage> {
  @override
  void initState() {
    super.initState();
    MyCollection.load();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      appBar: AppBar(
        backgroundColor: theme.primaryBackground,
        foregroundColor: theme.primaryText,
        elevation: 0,
        title: const Text('My Collection'),
      ),
      body: ValueListenableBuilder<Set<String>>(
        valueListenable: MyCollection.items,
        builder: (context, owned, _) {
          final mine = kMarketItems.where((i) => owned.contains(i.id)).toList();
          if (mine.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.bookmarks_outlined, size: 56, color: theme.secondaryText),
                    const SizedBox(height: 12),
                    Text('Nothing here yet',
                        style: theme.titleMedium.override(fontFamily: 'WorkSans', letterSpacing: 0.0)),
                    const SizedBox(height: 6),
                    Text('Add starter picks from the Marketplace and they will show up here.',
                        textAlign: TextAlign.center,
                        style: theme.bodyMedium.override(
                            fontFamily: 'WorkSans', color: theme.secondaryText, letterSpacing: 0.0)),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => context.pushNamed(MarketplaceVersion5Widget.routeName),
                      child: const Text('Browse Marketplace'),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [for (final i in mine) _ItemCard(item: i, added: true, onRemoveOnly: true)],
          );
        },
      ),
    );
  }
}

/// "My Collection" row for the side navigation.
class SideNavCollectionEntry extends StatelessWidget {
  const SideNavCollectionEntry({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          HapticFeedback.lightImpact();
          openMyCollection(context);
        },
        child: Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: const Color(0x0ED0E3F7),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: theme.accent1, width: 1.0),
          ),
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            children: [
              Container(
                width: 4.0,
                height: 26.0,
                margin: const EdgeInsetsDirectional.only(end: 12.0),
                decoration: BoxDecoration(color: theme.info, borderRadius: BorderRadius.circular(12.0)),
              ),
              Icon(Icons.bookmarks_rounded, color: theme.accent4, size: 28.0),
              const SizedBox(width: 12.0),
              Text('My Collection',
                  style: theme.titleSmall.override(
                      fontFamily: 'Inter', color: theme.primary, letterSpacing: 0.0)),
            ],
          ),
        ),
      ),
    );
  }
}
