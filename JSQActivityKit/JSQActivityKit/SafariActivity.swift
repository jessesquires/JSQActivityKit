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


/// A Safari action activity subclass of `UIActivity`.
public final class SafariActivity: UIActivity {

    // MARK: Properties

    private let title: String

    private var url: NSURL?

    // MARK: Initialization

    /**
    Constructs a new `SafariActivity` instance with the specified title.

    - parameter title: The title to display for the activity.

    - returns: A new `SafariActivity` instance.
    */
    public init(title: String = "Open In Safari") {
        self.title = title
    }

    // MARK: UIActivity overrides

    /// :nodoc:
    public override class func activityCategory() -> UIActivityCategory {
        return .Action
    }

    /// :nodoc:
    public override func activityTitle() -> String? {
        return title
    }

    /// :nodoc:
    public override func activityType() -> String? {
        return String(SafariActivity.self)
    }

    /// :nodoc:
    public override func activityImage() -> UIImage? {
        return UIImage(named: "safari", inBundle: NSBundle(forClass: SafariActivity.self), compatibleWithTraitCollection: nil)
    }

    /// :nodoc:
    public override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        return activityItems.filter { item -> Bool in
            guard let url = item as? NSURL else { return false }
            return UIApplication.sharedApplication().canOpenURL(url)
            }.count != 0
    }

    /// :nodoc:
    public override func prepareWithActivityItems(activityItems: [AnyObject]) {
        url = activityItems.filter { $0 is NSURL }.first as? NSURL
    }

    /// :nodoc:
    public override func performActivity() {
        var completed = false

        if let url = url {
            completed = UIApplication.sharedApplication().openURL(url)
        }
        
        activityDidFinish(completed)
    }
    
}
