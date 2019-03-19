//
//  Flight.swift
//  TravelAgency
//
//  Created by shivam gandhi on 2019-03-17.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import Foundation
class Flight{
    
    private var origin: String?
    private var destination: String?
    private var rate: String?
    private var date: String?
    
    init(origin: String,destination: String,rate: String,date: String) {
        self.origin = origin
        self.destination = destination
        self.rate = rate
        self.date = date
    }
    
    func getOrigin()->String{
        return self.origin!
    }
    func getDestination()->String{
        return self.destination!
    }
    func getRate()->String{
        return self.rate!
    }
    func getDate()->String{
        return self.date!
    }
}
