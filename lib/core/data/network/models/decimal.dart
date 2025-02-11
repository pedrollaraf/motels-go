class Decimal {
  final String formattedValue;
  final double doubleValue;

  const Decimal({
    this.formattedValue = "",
    this.doubleValue = 0.0,
  });

  Decimal copyWith({
    String? formattedValue,
    double? doubleValue,
  }) {
    return Decimal(
      formattedValue: formattedValue ?? this.formattedValue,
      doubleValue: doubleValue ?? this.doubleValue,
    );
  }
}
