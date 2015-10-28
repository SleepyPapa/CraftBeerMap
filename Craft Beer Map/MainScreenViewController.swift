//
//  MainScreenViewController.swift
//  CraftBeerMap
//
//  Created by Daddy on 2015-10-27.
//  Copyright © 2015 Gregory Lavery. All rights reserved.
//
import CloudKit
import UIKit

class MainScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    let container = CKContainer.defaultContainer()
    var publicDB: CKDatabase?
    var currentRecord: CKRecord?
    var searchActive : Bool = false
    let textCellIdentifier = "SimpleCell"
    var NewsData:[(NewsName: String, NewsDetail: String, NewsImage: String, NewsDate: NSDate)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfoFromCloudKit()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
    }
    
    func getInfoFromCloudKit(){
        let container = CKContainer.defaultContainer()
        let publicDB = container.publicCloudDatabase
        //        let privateDB = container.privateCloudDatabase
        let newsPredicate = NSPredicate(format: "NewsName BEGINSWITH %@",
            "")
        // 3
        let query = CKQuery(recordType: "News",
            predicate:  newsPredicate)
        // 4
        publicDB.performQuery(query, inZoneWithID: nil) {
            results, error in
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    //                            self.delegate?.errorUpdating(error)
                    return
                }
            } else {
                self.NewsData.removeAll()
                for record in results!{
                    let tempNewsName = record.objectForKey("NewsName") as! String
                    let tempNewsDetail = record.objectForKey("NewsDetail") as! String
                    let tempNewsImage = record.objectForKey("NewsImage") as! String
//                    let tempNewsDate = record.objectForKey("NewsDate") as! NSDate
                    
                    self.NewsData.append((NewsName:tempNewsName,
                        NewsDetail:tempNewsDetail,
                        NewsImage:tempNewsImage,
                        NewsDate:NSDate()))
                }
                self.NewsData.sortInPlace({$0.0<$1.0})
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                    return
                }
            }
        }
 /*       func modelUpdated() {
            tableView.reloadData()
        }
        func errorUpdating(error: NSError) {
            let message = error.localizedDescription
            let alert = UIAlertView(title: "Error Loading Establishments",
                message: message, delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
*/        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier)
        cell!.textLabel?.text = NewsData[indexPath.row].NewsName
        cell!.detailTextLabel?.text = NewsData[indexPath.row].NewsDetail
        return cell!
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
