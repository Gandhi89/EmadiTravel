//
//  BookedFlightInterfaceController.swift
//  TravelAgency WatchKit Extension
//
//  Created by shivam gandhi on 2019-03-18.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class BookedFlightInterfaceController: WKInterfaceController{
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var dataHandler = HandlerWatch.sharedInstance
    var booked : Array<FlightWatch> = []
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        booked = dataHandler.getbookedFlight()
        if booked.count == 0 {
            self.tableView.setNumberOfRows(1, withRowType: "cell1")
            
            if let rowController1 = tableView.rowController(at: 0) as? BookedRowController{
                rowController1.date.setText("No Booked Flight")
                rowController1.origin.setText("NA")
                rowController1.destination.setText("NA")
            }
        }
        else{
            
            self.tableView.setNumberOfRows(booked.count, withRowType: "cell1")
            
            for (index, rowModel) in self.booked.enumerated() {
                if let rowController1 = tableView.rowController(at: index) as? BookedRowController{
                    rowController1.date.setText(rowModel.getDate())
                    rowController1.origin.setText(rowModel.getOrigin())
                    rowController1.destination.setText(rowModel.getDestination())
                }
                
            }
            
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
