//
//  Handler.swift
//  TravelAgency
//
//  Created by shivam gandhi on 2019-03-17.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import Foundation

class Handler{
    
    private var flightResult : Array<Flight> = []
    private var bookedFlight : Array<String> = []
    
    class var sharedInstance : Handler {
        struct Singleton {
            static let instance = Handler()
        }
        return Singleton.instance
    }
    
    
    public func buildAPI(origin: String,destination: String, date: String)-> String{
        let URL = "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/\(origin)/\(destination)/\(date)"
        
        return URL
    }
    
    public func addFlightResult(result: Flight){
        flightResult.append(result)
    }
    
    public func getFlightResult() -> Array<Flight>{
        return self.flightResult
    }
    
    public func addBookedFlight(result: String){
        bookedFlight.append(result)
    }
    
    public func getBookedFlight() -> Array<String>{
        return self.bookedFlight
    }
}
