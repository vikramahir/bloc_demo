class CurrencyData {
  CurrencyData();

  late final double newAmount;
  late final String newCurrency;
  late final String oldCurrency;
  late final double oldAmount;

  CurrencyData.fromJson(Map<String, dynamic> json) {
    newAmount = json['new_amount'];
    newCurrency = json['new_currency'];
    oldCurrency = json['old_currency'];
    oldAmount = json['old_amount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['new_amount'] = newAmount;
    _data['new_currency'] = newCurrency;
    _data['old_currency'] = oldCurrency;
    _data['old_amount'] = oldAmount;
    return _data;
  }
}
