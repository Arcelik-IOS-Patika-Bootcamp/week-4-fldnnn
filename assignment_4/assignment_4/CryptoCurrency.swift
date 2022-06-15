//
//  CryptoCurrency.swift
//  assignment_4


import Foundation
 
struct Crypto: Codable {
    var asset_id: String?
    var name: String?
    var price_usd: Float?
    var id_icon: String?
}
 
struct Icon: Codable {
    var asset_id: String?
    var url: String?
}
 
class CryptoTableViewCellModel {
    var name: String?
    var shortName: String?
    var price: String?
    var iconUrl: URL?
    var iconData: Data?
     
    init(name: String?, shortName: String?,price: String?, iconUrl: URL?) {
        self.name = name
        self.iconUrl = iconUrl
        self.shortName = shortName
        self.price = price
    }
}
