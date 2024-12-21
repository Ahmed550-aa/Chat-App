import 'package:flutter/material.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/presentation/widgets/CustomSearchBar.dart';
import 'package:whats_app/presentation/widgets/call_list.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CallState createState() => _CallState();
}

class _CallState extends State<Call> {
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomSearchBar(
        controller: _searchTextController,
        isSearching: _isSearching,
        onSearch: _startSearch,
        onClear: _clearSearch,
      ),
      body: const CallList(),
    );
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
