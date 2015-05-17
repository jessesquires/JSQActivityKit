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

public class InstagramActivity: UIActivity {

    // MARK: Properties

    public let title: String

    // MARK: Initialization

    public init(title: String = "Share on Instagram") {
        self.title = title
    }

    // MARK: UIActivity overrides

    public override class func activityCategory() -> UIActivityCategory {
        return .Share
    }

    public override func activityTitle() -> String? {
        return title
    }

    public override func activityType() -> String? {
        return toString(InstagramActivity.self)
    }

    public override func activityImage() -> UIImage? {
        return UIImage(named: "instagram", inBundle: NSBundle(forClass: InstagramActivity.self), compatibleWithTraitCollection: nil)
    }

    public override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        return true
    }

    public override func prepareWithActivityItems(activityItems: [AnyObject]) {

    }

    public override func performActivity() {
        var completed = false
        
        activityDidFinish(completed)
    }
    
}
