class Coin {
  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high_24h,
    required this.low_24h,
    required this.priceChange_24h,
    required this.priceChangePercentage_24h,
    required this.marketCapChange_24h,
    required this.marketCapChangePercentage_24h,
    required this.circulatingSupply,
    required this.totalSupply,
    this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    this.roi,
    required this.lastUpdated,
  });
  late final String id;
  late final String symbol;
  late final String name;
  late final String image;
  late final double currentPrice;
  late final double marketCap;
  late final double marketCapRank;
  late final double? fullyDilutedValuation;
  late final double totalVolume;
  late final double high_24h;
  late final double low_24h;
  late final double priceChange_24h;
  late final double priceChangePercentage_24h;
  late final double marketCapChange_24h;
  late final double marketCapChangePercentage_24h;
  late final double circulatingSupply;
  late final double totalSupply;
  late final double? maxSupply;
  late final double ath;
  late final double athChangePercentage;
  late final String athDate;
  late final double atl;
  late final double atlChangePercentage;
  late final String atlDate;
  late final Null roi;
  late final String lastUpdated;

  Coin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = double.parse(json['current_price'].toString());
    marketCap = double.parse(json['market_cap'].toString());
    marketCapRank = double.parse(json['market_cap_rank'].toString());
    fullyDilutedValuation =
        double.parse((json['fully_diluted_valuation'] ?? 0).toString());
    totalVolume = double.parse(json['total_volume'].toString());
    high_24h = double.parse(json['high_24h'].toString());
    low_24h = double.parse(json['low_24h'].toString());
    priceChange_24h = double.parse(json['price_change_24h'].toString());
    priceChangePercentage_24h =
        double.parse(json['price_change_percentage_24h'].toString());
    marketCapChange_24h =
        double.parse(json['market_cap_change_24h'].toString());
    marketCapChangePercentage_24h =
        double.parse(json['market_cap_change_percentage_24h'].toString());
    circulatingSupply = double.parse(json['circulating_supply'].toString());
    totalSupply = double.parse((json['total_supply'] ?? 0).toString());
    maxSupply = (json['max_supply'] != null)
        ? double.parse(json['max_supply'].toString())
        : null;
    ath = double.parse(json['ath'].toString());
    athChangePercentage =
        double.parse(json['ath_change_percentage'].toString());
    athDate = json['ath_date'];
    atl = double.parse(json['atl'].toString());
    atlChangePercentage =
        double.parse(json['atl_change_percentage'].toString());
    atlDate = json['atl_date'];
    roi = null;
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['symbol'] = symbol;
    _data['name'] = name;
    _data['image'] = image;
    _data['current_price'] = currentPrice;
    _data['market_cap'] = marketCap;
    _data['market_cap_rank'] = marketCapRank;
    _data['fully_diluted_valuation'] = fullyDilutedValuation;
    _data['total_volume'] = totalVolume;
    _data['high_24h'] = high_24h;
    _data['low_24h'] = low_24h;
    _data['price_change_24h'] = priceChange_24h;
    _data['price_change_percentage_24h'] = priceChangePercentage_24h;
    _data['market_cap_change_24h'] = marketCapChange_24h;
    _data['market_cap_change_percentage_24h'] = marketCapChangePercentage_24h;
    _data['circulating_supply'] = circulatingSupply;
    _data['total_supply'] = totalSupply;
    _data['max_supply'] = maxSupply;
    _data['ath'] = ath;
    _data['ath_change_percentage'] = athChangePercentage;
    _data['ath_date'] = athDate;
    _data['atl'] = atl;
    _data['atl_change_percentage'] = atlChangePercentage;
    _data['atl_date'] = atlDate;
    _data['roi'] = roi;
    _data['last_updated'] = lastUpdated;
    return _data;
  }
}
