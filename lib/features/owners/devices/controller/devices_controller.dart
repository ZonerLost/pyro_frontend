import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/device_models.dart';

class DevicesController extends GetxController {
  bool isLoading = false;
  String error = '';

  final TextEditingController searchCtrl = TextEditingController();

  final List<AddressLocation> _all = [];
  List<AddressLocation> _filtered = [];

  List<AddressLocation> get locations => List.unmodifiable(_filtered);

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    try {
      isLoading = true;
      error = '';
      update();

      _all
        ..clear()
        ..addAll(_mock());

      _filtered = List.of(_all);
    } catch (_) {
      error = 'Failed to load devices.';
    } finally {
      isLoading = false;
      update();
    }
  }

  void onSearchChanged(String q) {
    final query = q.trim().toLowerCase();
    if (query.isEmpty) {
      _filtered = List.of(_all);
      update();
      return;
    }

    _filtered = _all
        .map((loc) {
          final devices = loc.devices
              .where(
                (d) =>
                    d.name.toLowerCase().contains(query) ||
                    d.brand.toLowerCase().contains(query) ||
                    d.model.toLowerCase().contains(query),
              )
              .toList();

          return AddressLocation(
            id: loc.id,
            title: loc.title,
            subtitle: loc.subtitle,
            devices: devices,
          );
        })
        .where((loc) => loc.devices.isNotEmpty)
        .toList();

    update();
  }

  void deleteDevice(String locationId, String deviceId) {
    final idx = _all.indexWhere((l) => l.id == locationId);
    if (idx == -1) return;

    final updatedDevices = _all[idx].devices
        .where((d) => d.id != deviceId)
        .toList();

    _all[idx] = AddressLocation(
      id: _all[idx].id,
      title: _all[idx].title,
      subtitle: _all[idx].subtitle,
      devices: updatedDevices,
    );

    onSearchChanged(searchCtrl.text);
  }

  List<AddressLocation> _mock() {
    return const [
      AddressLocation(
        id: 'loc1',
        title: 'Home Address',
        subtitle: 'Office 45, Wilson road , California, USA',
        devices: [
          DeviceModel(
            id: 'd1',
            name: 'Electric Doors',
            brand: 'Samsung',
            model: 'DF-3345',
            serial: '4564GH5Y6654',
            createdLabel: 'Added on December 5, 2025',
          ),
          DeviceModel(
            id: 'd2',
            name: 'Electric Doors',
            brand: 'Samsung',
            model: 'DF-3345',
            serial: '4564GH5Y6654',
            createdLabel: 'Added on December 5, 2025',
          ),
        ],
      ),
      AddressLocation(
        id: 'loc2',
        title: 'Office Addres',
        subtitle: 'Office 45, Wilson road , California, USA',
        devices: [
          DeviceModel(
            id: 'd3',
            name: 'Electric Doors',
            brand: 'Samsung',
            model: 'DF-3345',
            serial: '4564GH5Y6654',
            createdLabel: 'Added on December 5, 2025',
          ),
        ],
      ),
    ];
  }

  @override
  void onClose() {
    searchCtrl.dispose();
    super.onClose();
  }
}
