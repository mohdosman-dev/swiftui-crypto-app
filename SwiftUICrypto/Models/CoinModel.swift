//
//  CoinModel.swift
//  SwiftUICrypto
//
//  Created by Mohammed Osman on 07/03/2023.
//

import Foundation

// CoinGeco API
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=sar&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Model:
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
 "current_price": 84286,
 "market_cap": 1628543321035,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 1771026630161,
 "total_volume": 70809638622,
 "high_24h": 84734,
 "low_24h": 83919,
 "price_change_24h": 203.99,
 "price_change_percentage_24h": 0.24261,
 "market_cap_change_24h": 4768377210,
 "market_cap_change_percentage_24h": 0.29366,
 "circulating_supply": 19310500,
 "total_supply": 21000000,
 "max_supply": 21000000,
 "ath": 258938,
 "ath_change_percentage": -67.42927,
 "ath_date": "2021-11-10T14:24:11.849Z",
 "atl": 646.04,
 "atl_change_percentage": 12954.62022,
 "atl_date": "2015-01-14T00:00:00.000Z",
 "roi": null,
 "last_updated": "2023-03-07T06:16:28.784Z",
 "sparkline_in_7d": {
 "price": [
 23398.968362613083,
 23696.081721592756,
 23539.61281971209,
 22473.944938112774
 ]
 },
 "price_change_percentage_24h_in_currency": 0.24260913749590307
 }
 */

// MARK: - CoinModel
struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHolding: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHolding
    }
    
    var currentHoldingValue: Double {
        return (currentHolding ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}


extension CoinModel {
    func copyWith(
        currentHolding: Double?
    ) -> CoinModel {
        return CoinModel(
            id: self.id,
            symbol: self.symbol,
            name: self.name,
            image: self.image,
            currentPrice: self.currentPrice,
            marketCap: self.marketCap,
            marketCapRank: self.marketCapRank,
            fullyDilutedValuation: self.fullyDilutedValuation,
            totalVolume: self.totalVolume,
            high24H: self.high24H,
            low24H: self.low24H,
            priceChange24H: self.priceChange24H,
            priceChangePercentage24H: self.priceChangePercentage24H,
            marketCapChange24H: self.marketCapChange24H,
            marketCapChangePercentage24H: self.marketCapChangePercentage24H,
            circulatingSupply: self.circulatingSupply,
            totalSupply: self.totalSupply,
            maxSupply: self.maxSupply,
            ath: self.ath,
            athChangePercentage: self.athChangePercentage,
            athDate: self.athDate,
            atl: self.atl,
            atlChangePercentage: self.atlChangePercentage,
            atlDate: self.atlDate,
            lastUpdated: self.lastUpdated,
            sparklineIn7D: self.sparklineIn7D,
            priceChangePercentage24HInCurrency: self.priceChangePercentage24HInCurrency,
            currentHolding:  currentHolding ?? self.currentHolding
        )
    }
}
