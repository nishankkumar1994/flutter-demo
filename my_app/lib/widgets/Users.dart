class User {
  final int id;
  final String customer;
  final String phone;
  final String status;
  final String type;
  final String timestamp;

  User({
    this.id,
    this.customer,
    this.phone,
    this.status,
    this.type,
    this.timestamp
  });

  User.fromJson(Map json)
      : id = json['id'],
        customer = json['customer'],
        status = json['status'],
        type = json['type'],
        timestamp = json['timestamp'],
        phone = json['phone'];

  // Map toJson() {
  //   return {'id': id, 'customer': customer, 'phone': phone, 'status': status, 'type': type, 'timestamp': timestamp};
  // }
  Map toMap() {
    var map = new Map<String, dynamic>();
    // map["id"] = id;
    map["customer"] = customer;
    map["status"] = status;
    map["type"] = type;
    map["timestamp"] = timestamp;
    map["phone"] = phone;
 
    return map;
  }
}
