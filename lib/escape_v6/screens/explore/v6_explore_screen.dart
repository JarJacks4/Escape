// Escape v6 — Explore tab body (Figma Make: src/screens/Explore.tsx + data/content.ts).
//
// Search + need chips over every session (kV6Exercises), the Soundscape worlds and Lucille
// guides, plus a grid of every space in the app. Photo cards Hero into the exercise detail page.
// TAB BODY: no Scaffold / V6Page (the shell draws background + tab bar).
import 'package:flutter/material.dart';

import '/escape_v6/screens/home/v6_home_widgets.dart';
import '/escape_v6/v6.dart';

const _categories = ['All', 'Sleep', 'Focus', 'Calm', 'Energy', 'Breath'];

String _unsplash(String id) =>
    'https://images.unsplash.com/$id?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&q=80&w=800';

/// Soundscape worlds (content.ts EXPLORE_ITEMS, kind "soundscape"). They open the Soundscapes module.
final _sounds = [
  (
    title: 'Night Pines',
    subtitle: 'Fog, low wind, distant owls',
    category: 'Sleep',
    image: _unsplash('photo-1669669530583-f64e801e94ed'),
  ),
  (
    title: 'Still Water',
    subtitle: 'Slow tide at dusk',
    category: 'Calm',
    image: _unsplash('photo-1510297895683-0f27794412d5'),
  ),
  (
    title: 'Rain on Glass',
    subtitle: 'Steady rain for deep work',
    category: 'Focus',
    image: _unsplash('photo-1643287146701-93c795880dda'),
  ),
  (
    title: 'Dune Rise',
    subtitle: 'Warm pulse to wake the body',
    category: 'Energy',
    image: _unsplash('photo-1542401886-65d6c61db217'),
  ),
  (
    title: 'Star Ridge',
    subtitle: 'Alpine air, open sky',
    category: 'Sleep',
    image: _unsplash('photo-1477840539360-4a1d23071046'),
  ),
];

/// Lucille guides (content.ts kind "guide"): open text chat seeded with the prompt.
const _guides = [
  (
    title: "When your mind won't switch off",
    subtitle: 'A conversation with Lucille',
    category: 'Sleep',
    prompt: "I can't switch my head off tonight",
  ),
  (
    title: 'Before a big moment',
    subtitle: 'Steady nerves, clear head',
    category: 'Focus',
    prompt: 'I have a big presentation and I need to focus',
  ),
  (
    title: 'Heavy days',
    subtitle: "Gentle words when it's grey",
    category: 'Calm',
    prompt: "I'm feeling a bit flat today",
  ),
];

Set<String> _catsFor(V6Exercise e) {
  final t = e.tags.toSet();
  return {
    if (e.category == 'Sleep' || t.contains('sleep') || e.palette == V6PaletteId.sleep) 'Sleep',
    if (e.category == 'Focus' || t.contains('focus')) 'Focus',
    if (t.contains('calm') || t.contains('anxious') || e.category == 'Nature' || e.category == 'Grounding') 'Calm',
    if (e.category == 'Energy' || t.contains('energy') || e.palette == V6PaletteId.energized) 'Energy',
    if (e.kind == V6ExerciseKind.breath || t.contains('breathe')) 'Breath',
  };
}

class V6ExploreScreen extends StatefulWidget {
  const V6ExploreScreen({super.key});

  @override
  State<V6ExploreScreen> createState() => _V6ExploreScreenState();
}

class _V6ExploreScreenState extends State<V6ExploreScreen> {
  final _q = TextEditingController();
  final _focus = FocusNode();
  String _cat = 'All';

  @override
  void dispose() {
    _q.dispose();
    _focus.dispose();
    super.dispose();
  }

  String get _query => _q.text.trim();

  /// Every word of the query must appear somewhere in [hay].
  bool _matches(String hay) {
    final q = _query.toLowerCase();
    if (q.isEmpty) return true;
    final h = hay.toLowerCase();
    return q.split(RegExp(r'\s+')).every(h.contains);
  }

  void _askLucille(BuildContext context) {
    final q = _query;
    if (q.isEmpty) {
      v6Open(context, V6Routes.lucilleText);
      return;
    }
    if (detectDistress(q)) {
      showV6Support(context, V6SupportLevel.urgent);
      return;
    }
    v6Open(context, '${V6Routes.lucilleText}?seed=${Uri.encodeQueryComponent(q)}');
  }

  @override
  Widget build(BuildContext context) {
    final searching = _query.isNotEmpty;
    return V6ScrollPage(
      withNav: true,
      gap: 20,
      children: [
        _header(),
        V6HelpTarget(id: 'explore.search', child: _searchField(context)),
        V6HelpTarget(id: 'explore.chips', child: _chips()),
        if (!searching) const V6HelpTarget(id: 'explore.spaces', child: _Spaces()),
        V6HeroSafeSwitcher(
          child: KeyedSubtree(
            key: ValueKey('results-$_cat-${_query.toLowerCase()}'),
            child: _results(context),
          ),
        ),
      ],
    );
  }

  Widget _header() => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Semantics(header: true, child: const V6SmokeIn(child: V6Display('Explore', size: 34))),
            const SizedBox(height: 6),
            const V6Text('Find what your mind needs right now.', ink: V6Ink.muted),
          ]),
        ),
        const V6AutoHelp(page: 'explore'),
        const V6HelpButton(page: 'explore'),
      ]);

  Widget _searchField(BuildContext context) {
    final p = V6Theme.of(context);
    return Container(
      height: 52,
      padding: const EdgeInsets.only(left: 16, right: 4),
      decoration: BoxDecoration(
        color: p.glass[1],
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: p.glassBorder),
      ),
      child: Row(children: [
        Icon(Icons.search_rounded, size: 22, color: p.inkMuted),
        const SizedBox(width: 10),
        Expanded(
          child: Semantics(
            textField: true,
            label: 'Search sessions, sounds and guides',
            child: TextField(
              controller: _q,
              focusNode: _focus,
              textInputAction: TextInputAction.search,
              onChanged: (_) => setState(() {}),
              onSubmitted: (_) => _focus.unfocus(),
              cursorColor: p.accent,
              style: V6Type.body(15, p.ink),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: 'Try "sleep", "anxious" or "focus"',
                hintStyle: V6Type.body(15, p.inkFaint),
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          duration: V6Motion.quick,
          opacity: _query.isEmpty ? 0 : 1,
          child: IgnorePointer(
            ignoring: _query.isEmpty,
            child: V6Pressable(
              onTap: () => setState(_q.clear),
              semanticLabel: 'Clear search',
              child: SizedBox(
                width: V6Space.minTarget,
                height: V6Space.minTarget,
                child: Icon(Icons.close_rounded, size: 20, color: p.inkMuted),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _chips() => SizedBox(
        height: 48,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          itemCount: _categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, i) => Center(
            child: V6Chip(
              label: _categories[i],
              selected: _cat == _categories[i],
              onTap: () => setState(() => _cat = _categories[i]),
            ),
          ),
        ),
      );

  Widget _results(BuildContext context) {
    final all = _cat == 'All';
    final exercises = kV6Exercises
        .where((e) => (all || _catsFor(e).contains(_cat)) &&
            _matches('${e.title} ${e.summary} ${e.category} ${e.group} ${e.tags.join(' ')}'))
        .toList();
    final sounds = _sounds
        .where((x) => (all || x.category == _cat) && _matches('${x.title} ${x.subtitle} ${x.category} soundscape sound'))
        .toList();
    final guides = _guides
        .where((x) => (all || x.category == _cat) && _matches('${x.title} ${x.subtitle} ${x.category} ${x.prompt} lucille'))
        .toList();
    final distress = detectDistress(_query);

    final sections = <Widget>[];
    void add(Widget w) {
      if (sections.isNotEmpty) sections.add(const SizedBox(height: 24));
      sections.add(w);
    }

    if (distress) add(_SupportCard(onTap: () => showV6Support(context, V6SupportLevel.urgent)));

    if (exercises.isEmpty && sounds.isEmpty && guides.isEmpty) {
      add(V6Glass(
        padding: const EdgeInsets.all(26),
        child: Column(children: [
          const V6Display('Nothing here yet', size: 20, align: TextAlign.center),
          const SizedBox(height: 6),
          const V6Text('Try another word, or ask Lucille to make something for you.',
              size: 14, ink: V6Ink.muted, align: TextAlign.center),
          const SizedBox(height: 14),
          V6GhostPill(
            label: _query.isEmpty ? 'Ask Lucille' : 'Ask Lucille about “$_query”',
            icon: Icons.auto_awesome_rounded,
            onTap: () => _askLucille(context),
          ),
        ]),
      ));
    }

    if (exercises.isNotEmpty) {
      final rows = <Widget>[];
      for (var i = 0; i < exercises.length; i += 2) {
        if (i > 0) rows.add(const SizedBox(height: 12));
        rows.add(Row(children: [
          Expanded(child: _exerciseCard(context, exercises[i])),
          const SizedBox(width: 12),
          Expanded(child: i + 1 < exercises.length ? _exerciseCard(context, exercises[i + 1]) : const SizedBox()),
        ]));
      }
      add(Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        V6SectionHeader(all ? 'Sessions' : '$_cat sessions'),
        const SizedBox(height: 12),
        ...rows,
      ]));
    }

    if (sounds.isNotEmpty) {
      add(Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const V6SectionHeader('Soundscape worlds'),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            itemCount: sounds.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final x = sounds[i];
              return SizedBox(
                width: 156,
                child: V6Pressable(
                  onTap: () => v6Open(context, 'soundscapes'),
                  semanticLabel: '${x.title}. ${x.subtitle}. Opens Soundscapes',
                  child: V6Photo(
                    url: x.image,
                    height: 200,
                    radius: 22,
                    semanticLabel: x.title,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(x.category.toUpperCase(), style: V6Type.eyebrow(const Color(0xD9FFFFFF))),
                          const SizedBox(height: 4),
                          Text(x.title, style: V6Type.displayStyle(19, Colors.white)),
                          const SizedBox(height: 2),
                          Text(x.subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: V6Type.body(12, const Color(0xD9FFFFFF), height: 1.3)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]));
    }

    if (guides.isNotEmpty) {
      final p = V6Theme.of(context);
      add(Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const V6SectionHeader('Talk it through'),
        const SizedBox(height: 12),
        V6Glass(
          padding: const EdgeInsets.all(6),
          child: Column(children: [
            for (var i = 0; i < guides.length; i++)
              DecoratedBox(
                decoration: BoxDecoration(border: i == 0 ? null : Border(top: BorderSide(color: p.glassBorder))),
                child: V6Pressable(
                  onTap: () => v6Open(
                      context, '${V6Routes.lucilleText}?seed=${Uri.encodeQueryComponent(guides[i].prompt)}'),
                  semanticLabel: '${guides[i].title}. ${guides[i].subtitle}',
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 64),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(children: [
                        V6TintBadge(icon: Icons.auto_awesome_rounded, color: p.accent, size: 42, radius: 14),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            V6Text(guides[i].title, size: 15, weight: FontWeight.w600, maxLines: 2, height: 1.3),
                            const SizedBox(height: 2),
                            V6Text(guides[i].subtitle, size: 13, ink: V6Ink.faint, maxLines: 1),
                          ]),
                        ),
                        Icon(Icons.chevron_right_rounded, color: p.inkFaint),
                      ]),
                    ),
                  ),
                ),
              ),
          ]),
        ),
      ]));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: sections);
  }

  Widget _exerciseCard(BuildContext context, V6Exercise e) => V6ExerciseCard(
        exercise: e,
        height: 180,
        eyebrow: e.group,
        onTap: () {
          _focus.unfocus();
          v6Open(context, '${V6Routes.exercise}?id=${e.id}');
        },
      );
}

class _SupportCard extends StatelessWidget {
  const _SupportCard({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => V6Glass(
        padding: const EdgeInsets.all(18),
        child: Semantics(
          liveRegion: true,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const V6Text("You don't have to hold this alone.", size: 16, weight: FontWeight.w600),
            const SizedBox(height: 4),
            const V6Text('Real people are ready to listen, right now, any time.', size: 14, ink: V6Ink.muted),
            const SizedBox(height: 14),
            V6PrimaryPill(label: 'Talk to someone now', icon: Icons.call_rounded, onTap: onTap),
          ]),
        ),
      );
}

// ───────────────────────── spaces ─────────────────────────

const _spaces = [
  (title: 'Mind', sub: 'Meditate · breathe · focus', icon: Icons.self_improvement_rounded, route: V6Routes.mind),
  (title: 'Body', sub: 'Yoga · Tai Chi · move', icon: Icons.accessibility_new_rounded, route: V6Routes.body),
  (title: 'Reset', sub: '1–5 minute tools', icon: Icons.air_rounded, route: V6Routes.reset),
  (title: 'Soundscapes', sub: 'AI sound for any mood', icon: Icons.graphic_eq_rounded, route: 'soundscapes'),
  (title: 'Journal', sub: 'Write or speak it out', icon: Icons.edit_note_rounded, route: 'journal'),
  (title: 'Mood Scan', sub: 'Read how you feel', icon: Icons.blur_on_rounded, route: 'moodScan'),
];

class _Spaces extends StatelessWidget {
  const _Spaces();

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < _spaces.length; i += 2) {
      rows.add(IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(child: _tile(context, i)),
          const SizedBox(width: 10),
          Expanded(child: i + 1 < _spaces.length ? _tile(context, i + 1) : const SizedBox()),
        ]),
      ));
      rows.add(const SizedBox(height: 10));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ...rows,
      const _MarketplaceRow(),
    ]);
  }

  Widget _tile(BuildContext context, int i) {
    final p = V6Theme.of(context);
    final x = _spaces[i];
    final Widget icon = x.route == 'moodScan'
        ? V6Watch(builder: (context, s) => V6MoodOrb(mood: s.currentMood, size: 26, pulse: false))
        : Icon(x.icon, size: 24, color: p.accent);
    return V6Glass(
      onTap: () => v6Open(context, x.route),
      semanticLabel: '${x.title}. ${x.sub}',
      padding: const EdgeInsets.all(16),
      radius: 22,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 28, child: Align(alignment: Alignment.centerLeft, child: icon)),
        const SizedBox(height: 16),
        V6Text(x.title, size: 16, weight: FontWeight.w600, maxLines: 1),
        const SizedBox(height: 2),
        V6Text(x.sub, size: 12, ink: V6Ink.faint, maxLines: 2, height: 1.3),
      ]),
    );
  }
}

class _MarketplaceRow extends StatelessWidget {
  const _MarketplaceRow();

  @override
  Widget build(BuildContext context) {
    return V6Watch(builder: (context, s) {
      final p = V6Theme.of(context);
      final coins = s.coins;
      final coinText = coins == null ? '—' : v6FormatInt(coins);
      return V6Glass(
        onTap: () => v6Open(context, V6Routes.marketplace),
        semanticLabel: 'Marketplace. ${coins == null ? '' : '$coinText Escape Coins'}',
        padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
        radius: 22,
        child: Row(children: [
          V6TintBadge(icon: Icons.storefront_rounded, color: p.accent, size: 40, radius: 14),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              V6Text('Marketplace', size: 15, weight: FontWeight.w600),
              V6Text('Add-ons, Innerverse worlds and perks', size: 12, ink: V6Ink.faint, maxLines: 1),
            ]),
          ),
          const SizedBox(width: 8),
          Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.toll_rounded, size: 16, color: p.accent),
            const SizedBox(width: 4),
            V6Fade(child: V6Text(coinText, key: ValueKey('coins-$coins'), size: 13, weight: FontWeight.w600)),
          ]),
          Icon(Icons.chevron_right_rounded, color: p.inkFaint),
        ]),
      );
    });
  }
}
