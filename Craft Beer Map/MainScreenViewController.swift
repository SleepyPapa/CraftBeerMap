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
    let basicCellIdentifier = "SimpleCell"
    let imageCellIdentifier = "ImageCell"
    var NewsData:[(NewsName: String, NewsDetail: String, NewsImage: String, NewsDate: NSDate)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfoFromCloudKit()
        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()
        addFirstEntryToNews()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        //        tableView.estimatedRowHeight = 160.0
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if isLandscapeOrientation() {
            return hasImageAtIndexPath(indexPath) ? 140.0 : 120.0
        } else {
            return hasImageAtIndexPath(indexPath) ? 235.0 : 155.0
        }
    }
    
    func isLandscapeOrientation() -> Bool {
        return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)
    }
    
    func getInfoFromCloudKit(){
        let container = CKContainer.defaultContainer()
        let publicDB = container.publicCloudDatabase
        //        let privateDB = container.privateCloudDatabase
        let newsPredicate = NSPredicate(value: true) //return everything
        
        let query = CKQuery(recordType: "News", predicate:  newsPredicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        publicDB.performQuery(query, inZoneWithID: nil) {
            results, error in
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    //                            self.delegate?.errorUpdating(error)
                    return
                }
            } else {
                self.NewsData.removeAll()
                self.addFirstEntryToNews()
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
                //                self.NewsData.sortInPlace({$0.0<$1.0})
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                    return
                }
            }
        }
        
    }
    
    func addFirstEntryToNews(){
        let tempNewsName = "Welcome to Victoria Beers!"
        let tempNewsDetail = "Let our experts guide you around the beers that have been produced in this beautiful part of the world. Let 'The Swig' give you a few recommendations to try and use the Maps section for a few suggested pub crawls in this wonderful city! Cheers!"
        let tempNewsImage = "wp-content/uploads/2012/11/finallogo2-e1354055173206.png"
        let tempNewsDate = NSDate()
        
        self.NewsData.append((NewsName:tempNewsName,
            NewsDetail:tempNewsDetail,
            NewsImage:tempNewsImage,
            NewsDate:tempNewsDate))
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if hasImageAtIndexPath(indexPath) {
            return imageCellAtIndexPath(indexPath)
            
        } else {
            return basicCellAtIndexPath(indexPath)
        }
    }
    func hasImageAtIndexPath(indexPath:NSIndexPath) -> Bool {
        //        let item = items[indexPath.row]
        //        let mediaThumbnailArray = item.mediaThumbnails as! [RSSMediaThumbnail]
        //
        //        for mediaThumbnail in mediaThumbnailArray {
        //            if mediaThumbnail.url != nil {
        //                return true
        //            }
        //        }
        
        let item = NewsData[indexPath.row]
        if ((item.NewsImage==" ")||(item.NewsImage=="NONE")){
            return false //no Image set for this entry so return false
        }
        //Set to something so assuming it is a valid URL to image
        return true
    }
    
    func imageCellAtIndexPath(indexPath:NSIndexPath) -> ImageCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(imageCellIdentifier) as! ImageCell
        setImageForCell(cell, indexPath: indexPath)
        setTitleForCell(cell, indexPath: indexPath)
        setSubtitleForCell(cell, indexPath: indexPath)
        return cell
    }
    
    func setImageForCell(cell:ImageCell, indexPath:NSIndexPath) {
        let item = NewsData[indexPath.row]
        let pathName=("http://victoriabeers.com/")+item.NewsImage
        cell.customImageView.imageFromUrl(pathName)
    }
    
    func basicCellAtIndexPath(indexPath:NSIndexPath) -> BasicCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(basicCellIdentifier) as! BasicCell
        setTitleForCell(cell, indexPath: indexPath)
        setSubtitleForCell(cell, indexPath: indexPath)
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsData.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func setTitleForCell(cell:BasicCell, indexPath:NSIndexPath) {
        let item = NewsData[indexPath.row]
        cell.titleLabel.text = item.NewsName ?? "[No Title]"
    }
    
    func setSubtitleForCell(cell:BasicCell, indexPath:NSIndexPath) {
        let item = NewsData[indexPath.row]
        let subtitle: NSString? = item.NewsDetail ?? "[No Detail]"
        
        if let subtitle = subtitle {
            
            // Some subtitles are really long, so only display the first 200 characters
            if subtitle.length > 250 {
                cell.subtitleLabel.text = "\(subtitle.substringToIndex(250))..."
                
            } else {
                cell.subtitleLabel.text = subtitle as String
            }
            
        } else {
            cell.subtitleLabel.text = ""
        }
    }
    
    
}
