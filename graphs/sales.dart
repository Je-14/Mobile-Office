class Sales {
  late final int qty;
  late final String item;
  Sales(this.qty, this.item);

  Sales.fromMap(Map<String, dynamic> map)
      : assert(map['qty'] != null),
        assert(map['item'] != null),
        qty = map['qty'],
        item = map['item'];
  @override
  String toString() => "Record<$qty:$item>";
}
