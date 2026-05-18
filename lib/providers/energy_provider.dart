import 'package:flutter/material.dart';
import '../models/energy_model.dart';

class EnergyProvider with ChangeNotifier {
  final List<EnergyModel> _energyData = [
    EnergyModel(
      icon: '⚡',
      label: 'Electricity',
      consumption: 342,
      maxConsumption: 500,
      unit: 'kWh',
    ),
    EnergyModel(
      icon: '💧',
      label: 'Water',
      consumption: 128,
      maxConsumption: 200,
      unit: 'L',
    ),
    EnergyModel(
      icon: '☀️',
      label: 'Solar',
      consumption: 87,
      maxConsumption: 150,
      unit: 'kWh',
    ),
    EnergyModel(
      icon: '🌿',
      label: 'CO₂',
      consumption: 210,
      maxConsumption: 400,
      unit: 'kg',
    ),
  ];

  List<EnergyModel> get energyData => _energyData;

  double get totalConsumption => _energyData
      .map((e) => e.consumption)
      .reduce((a, b) => a + b);

  double get totalSavings => 28.0;

  double get co2Avoided => 42.0;

  double get solarOutput => _energyData
      .firstWhere((e) => e.label == 'Solar')
      .consumption;

  void updateConsumption(String label, double newValue) {
    final index = _energyData.indexWhere((e) => e.label == label);
    if (index != -1) {
      _energyData[index] = EnergyModel(
        icon: _energyData[index].icon,
        label: _energyData[index].label,
        consumption: newValue,
        maxConsumption: _energyData[index].maxConsumption,
        unit: _energyData[index].unit,
      );
      notifyListeners();
    }
  }
}