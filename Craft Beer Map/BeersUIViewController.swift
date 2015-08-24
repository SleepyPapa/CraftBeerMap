//
//  BeersUIViewController.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 03/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit
import CoreData

class BeersUIViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let textCellIdentifier = "BeersCell"
    let arrayBeers = ["Blue Buck", "Sea Dog", "Amber Ale"]
    let arrayBrewer = ["Phillips Brewing Company\n2010 Government Street\nVictoria, BC V8T 4PI\n info@phillipsbeer.com\n(250)380-1912", "Vancouver Island BreweryPhillips Brewing Company\n100 Any Street\nVictoria, BC V8T 4PI\n info@vancouverislandbeer.com\n(250)380-1111", "Hoynes"]
    let arrayDescriptions = ["Blue Buck, some background text about the taste of the beer and anything else from the website.", "Sea Dog", "Amber Ale"]
    var beers = [NSManagedObject] ()
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
//        let beer = beers[indexPath.row]
        //        cell.textLabel!.text = beer.valueForKey("beerName") as? String
        cell.textLabel!.text = arrayBeers[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBeers.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showBeerDetail") {
            var svc = segue.destinationViewController as! BeerDetailViewController;
            if let currentIndex  = tableView.indexPathForSelectedRow()?.row {
                svc.beerDescription = arrayDescriptions[currentIndex]
                svc.beerBrewer = arrayBrewer[currentIndex]
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
 /*
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity =  NSEntityDescription.entityForName("Beer", inManagedObjectContext:managedContext)
        
        let beer = NSManagedObject(entity: entity!,insertIntoManagedObjectContext:managedContext)
        
        //3
        beer.setValue("Blue Buck", forKey: "BeerName")
        beer.setValue("Phillips", forKey: "brewerName")
        beer.setValue("Blue Buck is a beer with fantastic body and great after taste.", forKey: "beerDescription")
        beer.setValue("Blue-Buck-Poster-full-size-2.jpg", forKey: "beerLabel")
        
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        //5
        beers.append(beer)
        // Do any additional setup after loading the view.
*/    }
/*
    override func viewDidAppear(animated: Bool){
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Beer")
        
        //3
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            beers = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
    }
 */
    
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
