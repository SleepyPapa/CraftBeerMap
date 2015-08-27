//
//  TapHousesUIViewController.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 03/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class TapHousesUIViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!

    
    let textCellIdentifier = "TapHouseCell"
    let arrayTapHouses = ["Yates Street Tap House", "Bard and Banker", "Irish Times"]
    let arrayDescription = ["Yates Street Tap House", "Bard and Banker", "Irish Times"]
    var tapHouseData:[(tapHouseName: String, tapHouseLocation: String, tapHouseDescription: String, tapHouseImage: String)] = []
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = tapHouseData[row].tapHouseName
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tapHouseData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpTuples()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueTapHouse") {
            var svc = segue.destinationViewController as! TapHouseDetailViewController;
            if let currentIndex  = tableView.indexPathForSelectedRow()?.row {
                svc.tapHouseLocation = tapHouseData[currentIndex].tapHouseLocation
                svc.tapHouseDescription = tapHouseData[currentIndex].tapHouseDescription
                svc.tapHouseImage = tapHouseData[currentIndex].tapHouseImage
            }
        }
    }
    
    func setUpTuples(){
        tapHouseData.append(tapHouseName: "Yates Street TapHouse",
            tapHouseLocation: "Yates Street TapHouse\nYates St, Victoria, BC.\n250.111.1111\nhttp://yatestaphouse.com",
            tapHouseDescription: "Information on Yates Street TapHouse.",
            tapHouseImage: "taphouse2.jpg")
        tapHouseData.append(tapHouseName: "Bard and Banker",
            tapHouseLocation: "Bard and Banker",
            tapHouseDescription: "http://bardandbanker.com.",
            tapHouseImage: "bard.png")
        tapHouseData.append(tapHouseName: "Irish Times",
            tapHouseLocation: "Irish Times\n1200 Government St, Victoria, BC.\n250.383.7775\nhttp://irishtimespub.ca",
            tapHouseDescription: "Information on Irish Times.",
            tapHouseImage: "irishtimes.png")
        tapHouseData.append(tapHouseName: "Canoe BrewPub",
            tapHouseLocation: "450 Swift St, Victoria, BC.\n\n250.361.1940\n\nhttp://canoebrewpub.com",
            tapHouseDescription: "Information on Canoe.",
            tapHouseImage: "canoe.png")
        tapHouseData.sort({$0.0<$1.0})
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
