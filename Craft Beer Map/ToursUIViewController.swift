//
//  ToursUIViewController.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 03/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class ToursUIViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    let textCellIdentifier = "ToursCell"
    let arrayTours = ["Pickle Tours", "Pub Crawlers", "Evening Out"]
    var toursData:[(toursName: String, toursLocation: String, toursInformation: String)] = []
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) 
        let row = indexPath.row
        cell.textLabel?.text = toursData[row].toursName
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toursData.count
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
    func setUpTuples(){
        toursData.append((toursName: "Pickle Tours",
            toursLocation: "Pickle Tours",
            toursInformation: "http://www.victoriaharbourferry.com/tours-services/pickle-pub-crawls"))
        toursData.append((toursName: "Pub Crawlers",
            toursLocation: "Pub Crawlers",
            toursInformation: "http://PubCrawlers.com"))
        toursData.append((toursName: "Evening Out",
            toursLocation: "Evening Out",
            toursInformation: "http://eveningout.ca"))
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueTours") {
            let svc = segue.destinationViewController as! ToursDetailViewController;
            if let currentIndex  = tableView.indexPathForSelectedRow?.row {
                svc.toursInformation = toursData[currentIndex].toursInformation
                svc.toursLocation = toursData[currentIndex].toursLocation
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
