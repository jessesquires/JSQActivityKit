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

class ViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Selected \(tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text)...")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        

    }

}
