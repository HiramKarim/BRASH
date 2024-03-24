//
//  HouseModel.swift
//  BrashApp
//
//  Created by Hiram Castro on 23/03/24.
//

import Foundation

struct HouseModel: Hashable {
    let id = UUID()
    var info:String?
    var totalBeds:String?
    var totalBath:String?
    var sqftInfo:String?
    var address:String?
    var rentCost:String?
    var amountDecreased:String?
    var imageURL:String?
}
