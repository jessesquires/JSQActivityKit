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

public class SafariActivity: UIActivity {

    // MARK: Properties

    public let title: String

    private var url: NSURL?

    // MARK: Initialization

    public init(title: String = "Open In Safari") {
        self.title = title
    }

    // MARK: UIActivity overrides

    public override class func activityCategory() -> UIActivityCategory {
        return .Action
    }

    public override func activityTitle() -> String? {
        return title
    }

    public override func activityType() -> String? {
        return toString(SafariActivity.self)
    }

    public override func activityImage() -> UIImage? {
        return UIImage(named: "safari", inBundle: NSBundle(forClass: SafariActivity.self), compatibleWithTraitCollection: nil)
    }

    public override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        return activityItems.filter { item -> Bool in
            if let url = item as? NSURL {
                return UIApplication.sharedApplication().canOpenURL(url)
            }
            return false
            }.count != 0
    }

    public override func prepareWithActivityItems(activityItems: [AnyObject]) {
        url = activityItems.filter { $0 is NSURL }.first as? NSURL
    }

    public override func performActivity() {
        var completed = false

        if let url = url {
            completed = UIApplication.sharedApplication().openURL(url)
        }

        activityDidFinish(completed)
    }
    
}
