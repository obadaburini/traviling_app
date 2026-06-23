import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  final void Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _summer;
  late bool _winter;
  late bool _family;

  @override
  void initState() {
    super.initState();
    _summer = widget.currentFilters['summer'] ?? false;
    _winter = widget.currentFilters['winter'] ?? false;
    _family = widget.currentFilters['family'] ?? false;
  }

  void _applyNow() {
    widget.saveFilters({
      'summer': _summer,
      'winter': _winter,
      'family': _family,
    });
  }

  Widget _switchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلترة'),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _switchTile(
            title: 'الرحلات الصيفية فقط',
            subtitle: 'إظهار الرحلات في فصل الصيف فقط',
            value: _summer,
            onChanged: (v) {
              setState(() => _summer = v);
              _applyNow();
            },
          ),
          _switchTile(
            title: 'الرحلات الشتوية فقط',
            subtitle: 'إظهار الرحلات في فصل الشتاء فقط',
            value: _winter,
            onChanged: (v) {
              setState(() => _winter = v);
              _applyNow();
            },
          ),
          _switchTile(
            title: 'للعائلات',
            subtitle: 'إظهار الرحلات المناسبة للعائلات فقط',
            value: _family,
            onChanged: (v) {
              setState(() => _family = v);
              _applyNow();
            },
          ),
        ],
      ),
    );
  }
}
