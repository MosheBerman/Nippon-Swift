//
//  MenuTableViewController.swift
//  Nippon
//
//  Created by Moshe on 10/19/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import UIKit
import iAd

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        let nib: UINib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        
        self.tableView.registerNib(nib, forCellReuseIdentifier: "reuseIdentifier")
        self.tableView.tableHeaderView = MenuHeaderView()
        
        
        let statusBarHeight = CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame)
        self.tableView.contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length + statusBarHeight, 0, 0, 0)
        
        let color:UIColor = UIColor(red: 0.76, green: 0.14, blue: 0.11, alpha: 1.00)
        
        self.tableView.backgroundColor = color
        
        self.canDisplayBannerAds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        
        var count: Int = self.dataSource().count
        
        if count == 0
        {
            NSLog("No data from datasource..")
        }

        return count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        var count: Int = 0
        
        if section < self.dataSource().count
        {
            count = self.dataSource()[section].count
        }
        
        return count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as MenuTableViewCell

        cell.primaryLabel?.text = self.dataSource()[indexPath.section][indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title : String? = nil;
        
        return title
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        var header : UITableViewHeaderFooterView = view as UITableViewHeaderFooterView
        
        header.textLabel.textColor = UIColor.whiteColor()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    func dataSource() -> Array<Array<String>> {
    
        var data = [
            ["Start a New Game", "Continue Where You Left Off"],
            ["High Scores", "Achievements"],
            ["How To Play", "Invite Some Friends to Play", "Leave a Rating on the App Store"],
        ]
        
        return data
    }

}
