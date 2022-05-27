import 'package:sqflite/sqflite.dart';

class KlipTransaction {
  late String transferType;
  late String from;
  late String to;
  late DateTime transactionTime;
  late String way;
  double? amount;
  double? fee;
  int? status;

  KlipTransaction({
    required this.transferType,
    required this.from,
    required this.to,
    required this.transactionTime,
    required this.way,
    this.amount,
    this.fee,
    this.status
  });

  KlipTransaction.fromJson(Map<String, dynamic> json) {
    transferType = json['transferType'];
    from = json['from'];
    to = json['to'];
    transactionTime = DateTime.parse(json['time']);
    way = json['way'];
    json['transferType'] == 'nft' ? amount = null : amount = json['value'];
    json['transferType'] == 'nft' ? fee = null : fee = json['fee'];
    json['transferType'] == 'nft' ? status = null : status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transferType'] = transferType;
    data['from'] = from;
    data['to'] = to;
    data['transactionTime'] = transactionTime.toString();
    data['way'] = way;

    if (transferType == 'klay') {
      data['amount'] = amount;
      data['fee'] = fee;
      data['status'] = status;
    }

    return data;
  }
}
