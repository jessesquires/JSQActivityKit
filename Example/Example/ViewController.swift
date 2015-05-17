//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://www.jessesquires.com/JSQActivityKit
//
//
//  GitHub
//  https://github.com/jessesquires/JSQActivityKit
//
//
//  License
//  Copyright (c) 2015 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import UIKit

import JSQActivityKit


class ViewController: UITableViewController {

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Selected \(tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)...")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        switch indexPath.row {
        case 0:
            let controller = activityViewController([ NSURL(string: "http://jessesquires.com")! ], activities: [ SafariActivity() ])
            presentViewController(controller, animated: true, completion: nil)

        case 1:
            let controller = activityViewController([ UIImage() ], activities: [ InstagramActivity() ])
            presentViewController(controller, animated: true, completion: nil)

        default:
            break
        }

    }

    private func activityViewController(items: [AnyObject], activities: [UIActivity]) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: activities)

        controller.completionWithItemsHandler = { (type: String!, completed: Bool, returnedItems: [AnyObject]!, error: NSError!) -> Void in
            println("Type = \(type)")
            println("Completed = \(completed)")
            println("ReturnedItems = \(returnedItems)")
            println("Error = \(error)")
        }
        
        return controller
    }
    
}
