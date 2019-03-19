//
//  HandlerWatch.swift
//  TravelAgency WatchKit Extension
//
//  Created by shivam gandhi on 2019-03-17.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import Foundation

class HandlerWatch{
    
    private var flightResult : Array<FlightWatch> = []
    private var bookedFlight : Array<FlightWatch> = []
    
    class var sharedInstance : HandlerWatch {
        struct Singleton {
            static let instance = HandlerWatch()
        }
        return Singleton.instance
    }
    
    
    public func addFlightResult(result: FlightWatch){
        flightResult.append(result)
    }
    
    public func getFlightResult() -> Array<FlightWatch>{
        return self.flightResult
    }
    
    public func addbookedFlightt(result: FlightWatch){
        bookedFlight.append(result)
    }
    
    public func getbookedFlight() -> Array<FlightWatch>{
        return self.bookedFlight
    }
    
    
    
}
