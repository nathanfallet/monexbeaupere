//
//  OwnedGift.swift
//  MonExBeauPere
//
//  Created by Nathan FALLET on 23/06/2020.
//  Copyright © 2020 Nathan FALLET. All rights reserved.
//

import Foundation

class OwnedGift {
    
    // Get inventory
    static var inventory: [OwnedGift] {
        // Create a list
        var gifts = [OwnedGift]()
        
        // Get data (preferences)
        let datas = UserDefaults.standard
        
        // Iterate gift
        for gift in Gift.library {
            // Get count for current gift
            let count = datas.integer(forKey: "gift_\(gift.id)")
            
            // Add it to owned gift
            if count > 0 {
                gifts.append(OwnedGift(gift, amount: count))
            }
        }
        
        // Return the final list
        return gifts
    }
    
    // Properties
    var gift: Gift
    var amount: Int
    var id: Int { gift.id }
    var name: String { gift.name }
    var value: UInt64 { gift.value }
    var kind: Kind { gift.kind }
    
    // Initializer
    init(_ gift: Gift, amount: Int) {
        self.gift = gift
        self.amount = amount
    }
    
}