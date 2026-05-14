class EnergyModel {
  final String icon;
  final String label;
  final double consumption;
  final double maxConsumption;
  final String unit;

  EnergyModel({
    required this.icon,
    required this.label,
    required this.consumption,
    required this.maxConsumption,
    required this.unit,
  });

  double get percent => consumption / maxConsumption;

  String get displayValue => '${consumption.toInt()} $unit';
}