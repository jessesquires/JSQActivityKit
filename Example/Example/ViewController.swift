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

        var items = [AnyObject]()
        var activities = [UIActivity]()

        switch indexPath.row {
        case 0:
            items.append(NSURL(string: "http://jessesquires.com")!)
            activities.append(SafariActivity())
        case 1:
            items.append(UIImage(named: "kitten.jpeg")!)
            items.append("#Kittens of Instagram.\nhttp://placekitten.com/g/600/600")
            activities.append(InstagramActivity(presenter: { (controller: UIDocumentInteractionController) -> Void in
                controller.presentOpenInMenuFromRect(tableView.cellForRowAtIndexPath(indexPath)!.frame, inView: tableView, animated: true)
            }))

        default: break
        }

        let controller = UIActivityViewController(activityItems: items, applicationActivities: activities)
        controller.popoverPresentationController?.sourceView = tableView
        controller.popoverPresentationController?.sourceRect = tableView.cellForRowAtIndexPath(indexPath)!.frame

        controller.completionWithItemsHandler = { (type: String!, completed: Bool, returnedItems: [AnyObject]!, error: NSError!) -> Void in
            println("Type = \(type)")
            println("Completed = \(completed)")
            println("ReturnedItems = \(returnedItems)")
            println("Error = \(error)")
        }

        presentViewController(controller, animated: true, completion: nil)

    }
}
