//
//  MasterViewController.swift
//  QuotePro
//
//  Created by Graeme Harrison on 2016-02-17.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {
    
    @IBOutlet var addButton: UIBarButtonItem!
    
    var detailViewController: DetailViewController? = nil
    //    var managedObjectContext: NSManagedObjectContext? = nil
    var objects = [AnyObject]()
    var quoteBuilder = QuoteBuilderViewController()
    var quoteView = QuoteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let appDelegate : AppDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
        //        self.managedObjectContext = appDelegate.managedObjectContext
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        objects = DataManager.sharedInstance.fetchData()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Snapshot
    
    func snapshot(view: UIView) -> (UIImage) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates:true)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    // MARK: Activity View Controller
    
    func share(image: UIImage) {
        let objectsToShare = [image]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    
    // MARK: - Segues
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        if segue.identifier == "showDetail" {
    //            if let indexPath = self.tableView.indexPathForSelectedRow {
    //                let object = objects[indexPath.row] as! Quote
    //                let controller = segue.destinationViewController as! DetailViewController
    //                controller.detailItem = object
    //            }
    //        }
    //    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! QuoteTableViewCell
        let quoteObject = objects[indexPath.row] as! Quote
        QuoteView.getPresetQuoteAuthorAndPhoto(quoteObject.quote!, presetAuthor: quoteObject.author!, presetPhotoURL: quoteObject.photoURL!, onComplete: {(quoteView) in
            let image = self.snapshot(quoteView)
            self.share(image)
        })
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! QuoteTableViewCell
        
        let quoteObject = objects[indexPath.row] as! Quote
        cell.quoteLabel.text = quoteObject.quote
        cell.authorLabel.text = quoteObject.author
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}