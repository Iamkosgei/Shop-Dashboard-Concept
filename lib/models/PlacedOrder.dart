class PlacedOrder {
  String name;
  String amount;
  int status;

  PlacedOrder({this.name, this.amount, this.status});

  PlacedOrder.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['status'] = this.status;
    return data;
  }
}
