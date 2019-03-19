//
//  ViewController.swift
//  TravelAgency
//
//  Created by shivam gandhi on 2019-03-17.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import WatchConnectivity

class ViewController: UIViewController,WCSessionDelegate  {
    
    
    
    @IBOutlet weak var origin: UITextField!
    
    @IBOutlet weak var destination: UITextField!
    
    @IBOutlet weak var dates: UITextField!
    
    var dataHandler = Handler.sharedInstance
    
    var supported: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func bookedFlight(_ sender: UIButton) {
        
    }
    @IBAction func searchFlight(_ sender: UIButton) {
        
        if (origin != nil && destination != nil && dates != nil){
            let URL = dataHandler.buildAPI(origin: origin.text!, destination: destination.text!, date: dates.text!)
            
            let headers = [
                "X-RapidAPI-Key": "37e7ff4d68msh848c984300158d4p1f9645jsnfbf6753d84b5"
            ]
            Alamofire.request(URL,headers: headers).responseJSON {
                
                response in
                
                guard let apiData = response.result.value else {
                    print("Error getting data from the URL")
                    return
                }
                
                let jsonResponse = JSON(apiData)
                
                
                let quotes = jsonResponse["Quotes"].array
                let places = jsonResponse["Places"].array
                
                let origin = places![1]["IataCode"]
                
                let destination = places![0]["IataCode"]
                
                let date = quotes![0]["OutboundLeg"]["DepartureDate"]
                
                let fare = quotes![0]["MinPrice"]
                
                if (WCSession.isSupported()) {
                    self.supported = true
                    let session = WCSession.default
                    session.delegate = self
                    session.activate()
                }
                if(self.supported){
                    // let message = ["message":"fare is \(fare)$"]
                    let message = ["rate":"\(fare)","origin":"\(origin)","destination":"\(destination)","date":"\(date)"]
                    WCSession.default.sendMessage(message, replyHandler: nil)
                }
            }
        }
        else{
            origin.text = ""
            destination.text = ""
            dates.text = ""
        }
        
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
    }
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        let receivedGlobal = applicationContext["data"] as? String
        dataHandler.addBookedFlight(result: receivedGlobal!)
        origin.text = "\(String(describing: receivedGlobal))"
    }
}

