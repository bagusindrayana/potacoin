class Exchange {
  Exchange({
    required this.id,
    required this.name,
    this.yearEstablished,
    this.country,
    this.description,
    this.url,
    this.image,
    this.hasTradingIncentive,
    required this.trustScore,
    required this.trustScoreRank,
    required this.tradeVolume_24hBtc,
    required this.tradeVolume_24hBtcNormalized,
  });
  late final String id;
  late final String name;
  late final int? yearEstablished;
  late final String? country;
  late final String? description;
  late final String? url;
  late final String? image;
  late final bool? hasTradingIncentive;
  late final int trustScore;
  late final int trustScoreRank;
  late final double tradeVolume_24hBtc;
  late final double tradeVolume_24hBtcNormalized;

  Exchange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    yearEstablished = json['year_established'];
    country = json['country'];
    description = json['description'];
    url = json['url'];
    image = json['image'];
    hasTradingIncentive = json['has_trading_incentive'];
    trustScore = json['trust_score'];
    trustScoreRank = json['trust_score_rank'];
    tradeVolume_24hBtc = json['trade_volume_24h_btc'];
    tradeVolume_24hBtcNormalized = json['trade_volume_24h_btc_normalized'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['year_established'] = yearEstablished;
    _data['country'] = country;
    _data['description'] = description;
    _data['url'] = url;
    _data['image'] = image;
    _data['has_trading_incentive'] = hasTradingIncentive ?? false;
    _data['trust_score'] = trustScore;
    _data['trust_score_rank'] = trustScoreRank;
    _data['trade_volume_24h_btc'] = tradeVolume_24hBtc;
    _data['trade_volume_24h_btc_normalized'] = tradeVolume_24hBtcNormalized;
    return _data;
  }
}
