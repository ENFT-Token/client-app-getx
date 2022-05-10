class Klip {
  late String address;
  late double balance;
  late List<String> nftTokens;
  late List<Map<String, dynamic>> nfts;

  Klip({address, balance, nftTokens, nfts, klaytnPrice}) {
    this.address = address;
    this.balance = balance;
    this.nftTokens = nftTokens;
    this.nfts = nfts;
  }

  Klip.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    balance = json['balance'];
    nftTokens = json['nftTokens'];
    nfts = json['nfts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['balance'] = balance;
    data['nftTokens'] = nftTokens;
    data['nfts'] = nfts;
    return data;
  }
}
