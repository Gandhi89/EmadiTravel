//
//  InterfaceController.swift
//  TravelAgency WatchKit Extension
//
//  Created by shivam gandhi on 2019-03-17.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    var dataHandler = HandlerWatch.sharedInstance
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Play a "click" sound when you get the message
        WKInterfaceDevice().play(.click)
        var origin: String?
        var destination: String?
        var date: String?
        var fare: String?
        
        var resultArray : Array<FlightWatch> = dataHandler.getFlightResult()
        // output a debug message to the terminal
        print("received message : \(message)")
        // update the message with a label
        for (key, value) in message {
            let m = key
            let val = value
            if(m == "origin"){
                origin = val as? String

            }
            if(m == "destination"){
                destination = val as? String
            }
            if(m == "date"){
                date = val as? String
            }
            if(m == "rate"){
                fare = val as? String
            }
        }
            print("origin : \(origin) , destination : \(destination) , rate : \(fare) , date : \(date)")
            
            var flight = FlightWatch(origin: origin!, destination: destination!, rate: fare!, date: date!)
            var b: Bool = true
            if(resultArray.count == 0){
                resultArray.append(flight)
                dataHandler.addFlightResult(result: flight)
            }
            else{

                for i in 0...resultArray.count-1{
                    if(resultArray[i].getOrigin() == origin! && resultArray[i].getDestination() == destination!
                        && resultArray[i].getDate() == date! && resultArray[i].getRate() == fare!){
                        b = false
                    }
                    else{
                        b = true
                    }
                }

                if (b){
                    resultArray.append(flight)
                    dataHandler.addFlightResult(result: flight)
                }

            }

        }
    
}
