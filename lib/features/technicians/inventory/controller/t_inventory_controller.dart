import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/t_inventory_models.dart';

class TInventoryController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  // Bottomsheet fields
  final TextEditingController nameController = TextEditingController();

  final List<TInventoryPart> _allParts = [
    TInventoryPart(
      id: 'p1',
      name: 'Electric Motor',
      addedOn: DateTime(2025, 12, 5),
      tags: ['Job Title', 'Job Title', 'Job Title'],
    ),
    TInventoryPart(
      id: 'p2',
      name: 'Electric Motor',
      addedOn: DateTime(2025, 12, 5),
      tags: ['Job Title', 'Job Title', 'Job Title'],
    ),
    TInventoryPart(
      id: 'p3',
      name: 'Electric Motor',
      addedOn: DateTime(2025, 12, 5),
      tags: ['Job Title', 'Job Title', 'Job Title'],
    ),
  ];

  List<TInventoryPart> parts = [];

  @override
  void onInit() {
    super.onInit();
    parts = List.from(_allParts);
    searchController.addListener(_onSearch);
  }

  void _onSearch() {
    final q = searchController.text.trim().toLowerCase();
    if (q.isEmpty) {
      parts = List.from(_allParts);
    } else {
      parts = _allParts.where((p) => p.name.toLowerCase().contains(q)).toList();
    }
    update();
  }

  void deletePart(String id) {
    _allParts.removeWhere((e) => e.id == id);
    parts.removeWhere((e) => e.id == id);
    update();
  }

  void openAddPartSheet() {
    nameController.text = '';
    update();
  }

  void confirmAddPart() {
    final name = nameController.text.trim();
    if (name.isEmpty) return;

    final newPart = TInventoryPart(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      addedOn: DateTime.now(),
      tags: ['Job Title', 'Job Title', 'Job Title'],
    );

    _allParts.insert(0, newPart);
    parts = List.from(_allParts);
    update();
    Get.back(); // close sheet
  }

  @override
  void onClose() {
    searchController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
