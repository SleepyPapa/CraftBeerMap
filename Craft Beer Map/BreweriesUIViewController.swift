//
//  BreweriesUIViewController.swift
//  Craft Beer Map
//
//  Created by Gregory Lavery on 03/08/2015.
//  Copyright (c) 2015 Gregory Lavery. All rights reserved.
//

import UIKit
import CoreData

class BreweriesUIViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    let textCellIdentifier = "BreweriesCell"
    var brewers = [Brewer]()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var brewersData:[(brewerName: String, brewerDescription: String, brewerLocation: String)] = []

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) 
        let row = indexPath.row
        cell.textLabel?.text = brewersData[row].brewerName
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brewersData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueBrewer") {
            let svc = segue.destinationViewController as! BrewerDetailViewController;
            if let currentIndex  = tableView.indexPathForSelectedRow?.row {
                svc.brewerName = brewersData[currentIndex].brewerName
                svc.brewerDescription = brewersData[currentIndex].brewerDescription
                svc.brewerDetails = brewersData[currentIndex].brewerLocation
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        setUpCoreData()
        setUpTuples()
    }
    
    func setUpTuples() {
        brewersData.append((brewerName: "Swans Brewpub",
            brewerDescription: "After a beautiful renovation completed in 1989, Swans is filled with founder Michael William's remarkable art collection. You can visit a statue of Michael sitting on a bench across the street.",
            brewerLocation: "506 Pandora Ave, Victoria, BC.\n\n250 361 3310\n\nhttp://swanshotel.com/brew-pub"))
        brewersData.append((brewerName: "Spinnakers Gastro Brewpub",
            brewerDescription: "Spinnakers became Canada's first brewpub in 1984 and has been going strong ever since. Take in the amazing harbour views with great beer and food at the cradle of the Craft Beer Revolution.",
            brewerLocation: "308 Catherine Street, Victoria, BC.\n\n250.386.2739\n\nhttp://spinnakers.com"))
        brewersData.append((brewerName: "The Moon under Water Brewpub",
            brewerDescription: "Named for George Orwell's fictional 'Perfect Pub,' the Moon is a popular spot with a strong focus on German styles, include a Pilsner, Dunkel, and the beft Hefweizen in BC.",
            brewerLocation: "350B Bay St, Victoria, BC.\n\n250.380.0706\n\nhttp://moonunderwater.ca"))
        brewersData.append((brewerName: "Lighthouse Brewing",
            brewerDescription: "Lighthouse's nautical-themed lineup offers something for everyone. Loof for its beers on tap or for sale in liquor stores throughout Greater Victoria.",
            brewerLocation: "2-836 Devonshire Rd, Victoria, BC.\n\n250.383.6500\n\nhttp://lighthousebrewing.com"))
        brewersData.append((brewerName: "Hoyne Brewing",
            brewerDescription: "Sean Hoyne is a local favourite who started brewing at Swans Brewpub in 1989 and then moved over to Canoe Brewpub in 1996. He finally opened his own brewery in 2011.",
            brewerLocation: "101-2740 Bridge St, Victoria, BC.\n\n250.383.5758\n\nhttp://hoynebrewing.com"))
        brewersData.append((brewerName: "Driftwood Brewery",
            brewerDescription: "Driftwood's solid lineup is headlined by one of BC's most popular craft beers, Fat Tug IPA. The brewery is also blazing new trails with its sour/barrel aged program.",
            brewerLocation: "102-450 Hillside Ave, Victoria, BC.\n\n250.381.2739\n\nhttp://driftwoodbeer.com"))
        brewersData.append((brewerName: "Canoe Brewpub",
            brewerDescription: "Situated in the beautifully renovated City Lights building (built 1894), Canoe is a great spot to drink beer. Outside, it has Victoria's best west-facing patio right down on the water.",
            brewerLocation: "450 Swift St, Victoria, BC.\n\n250.361.1940\n\nhttp://canoebrewpub.com"))
        brewersData.append((brewerName: "Phillips Brewing",
            brewerDescription: "Since opening in 2001, this 'little brewery that could' has grown into one of BC's biggest and best. The Phillips Backyard hosts several events throughout the summer months.",
            brewerLocation: "2010 Goverment St, Victoria, BC.\n\n250.386.2739\n\nhttp://phillipsbeer.com"))
        brewersData.append((brewerName: "Vancouver Island Brewery",
            brewerDescription: "A longtime Island favourite, VIB was originally founded as Island Pacific Brewing in 1984. Look for popular brands like Piper's Pale Ale and Hermann's Dark Lager throughout Greater Victoria.",
            brewerLocation: "2330 Government Street, Victoria, BC.\n\n250.361.0005\n\nhttp://vanislandbrewery.com"))
        brewersData.sortInPlace({$0.0<$1.0})
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpCoreData(){
        
/*        if let moc = self.managedObjectContext {
            
            let newItem = NSEntityDescription.insertNewObjectForEntityForName("Brewer", inManagedObjectContext: self.managedObjectContext!) as! Brewer
            
//            Brewer.createInManagedObjectContext(moc,
//                brewerName: arrayBreweries[0],
//                brewerAddress: arrayBreweries[0],
//                brewerLocation: arrayBreweries[0],
//                brewerDescription: arrayBreweries[0],
//                brewerPhoneNumber: arrayBreweries[0],
//                brewerImage: arrayBreweries[0])
//            
        }
        save()
 */   }
    
    func save() {
/*        let error : NSError?
        if(managedObjectContext!.save() ) {
            print(error?.localizedDescription)
        }
 */   }
    
    //        let numberInArray = arrayBreweries.count
    //        for index in 0...(numberInArray-1){
    //            //1
    //            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //
    //            let managedContext = appDelegate.managedObjectContext!
    //
    //            //2
    //            let entity =  NSEntityDescription.entityForName("Brewer", inManagedObjectContext:managedContext)
    //
    //            let singleBrewer = NSManagedObject(entity: entity!,insertIntoManagedObjectContext:managedContext)
    //
    //            //3
    //            singleBrewer.setValue((arrayBreweries[index]), forKey: "brewerName")
    //            singleBrewer.setValue((arrayBreweries[index]), forKey: "brewerAddress")
    //            singleBrewer.setValue((arrayBreweries[index]), forKey: "brewerLocation")
    //            singleBrewer.setValue((arrayDescription[index]), forKey: "brewerDescription")
    //            singleBrewer.setValue((arrayBreweries[index]), forKey: "brewerPhoneNumber")
    //            singleBrewer.setValue((arrayBreweries[index]), forKey: "brewerImage")
    //
    //            //4
    //            var error: NSError?
    //            if !managedContext.save(&error) {
    //                println("Could not save \(error), \(error?.userInfo)")
    //            }
    //            //5
    //            brewers.append(singleBrewer)
    //        }
    //    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //       fetchData()
    }
    
    
    func fetchData(){
        let fetchRequest = NSFetchRequest(entityName: "Brewer")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Brewer] {
            brewers = fetchResults
        }
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
