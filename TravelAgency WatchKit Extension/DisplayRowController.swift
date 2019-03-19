//
//  DisplayRowController.swift
//  TravelAgency WatchKit Extension
//
//  Created by shivam gandhi on 2019-03-17.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class DisplayRowController: NSObject{
    
    @IBOutlet weak var date: WKInterfaceLabel!
    
    @IBOutlet weak var origin: WKInterfaceLabel!
    @IBOutlet weak var destination: WKInterfaceLabel!
    @IBOutlet weak var fare: WKInterfaceLabel!
    
    @IBOutlet weak var bookButton: WKInterfaceButton!
    
    var dataHandler = HandlerWatch.sharedInstance
    
    var bookedFlights : Array<FlightWatch> = []
    @IBAction func BookFlight() {
        
        bookedFlights = dataHandler.getbookedFlight()
        var temp = dataHandler.getFlightResult()
        if bookedFlights.count == 0 {
            bookedFlights.append(temp[0])
            dataHandler.addbookedFlightt(result: temp[0])
            
            let session = WCSession.default
            if session.activationState == .activated {
                
                do{
                    
                    try session.updateApplicationContext(["data": "Traveling \(temp[0].getDestination()) from \(temp[0].getOrigin()) on \(temp[0].getDate())"])
                    
                }
                catch{
                    print("error")
                }
                
            }
        }
        else{
            var b: Bool = true
            for i in 0...bookedFlights.count-1
            {
                if(bookedFlights[i].getDate() == temp[temp.count-1].getDate() && bookedFlights[i].getRate() == temp[temp.count-1].getRate() && bookedFlights[i].getDestination() == temp[temp.count-1].getDestination() && bookedFlights[i].getOrigin() == temp[temp.count-1].getOrigin()){
                    b = false
                }
                
            }
            if(b){
                bookedFlights.append(temp[temp.count-1])
                dataHandler.addbookedFlightt(result: temp[temp.count-1])
                let session = WCSession.default
                if session.activationState == .activated {
                    
                    do{
                        
                        try session.updateApplicationContext(["data": "Traveling \(temp[temp.count-1].getDestination()) from \(temp[temp.count-1].getOrigin()) on \(temp[temp.count-1].getDate())"])
                        
                    }
                    catch{
                        print("error")
                    }
                    
                }
            }
        }
        
    }
}
