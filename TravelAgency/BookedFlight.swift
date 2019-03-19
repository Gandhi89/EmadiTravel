//
//  BookedFlight.swift
//  TravelAgency
//
//  Created by shivam gandhi on 2019-03-18.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//
import UIKit

class BookedFlight: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var dataHandler = Handler.sharedInstance
    @IBOutlet weak var tableView: UITableView!
    var temp : Array<String> = []
    var b : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temp = dataHandler.getBookedFlight()
        tableView.rowHeight = 90
        if(temp.count == 0){
            b = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if temp.count > 0 {
            return temp.count
        }
        else{
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if !b {
            let data = temp[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! TableCell
            
            cell.date.text = data
            
            cell.date.numberOfLines = 0
            cell.date.lineBreakMode = NSLineBreakMode.byWordWrapping
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! TableCell
            return cell
            
        }

    }
    
}
