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

public class InstagramActivity: UIActivity, UIDocumentInteractionControllerDelegate {

    // MARK: Typealiases

    public typealias DocumentInteractionControllerPresenter = (UIDocumentInteractionController) -> Void

    // MARK: Properties

    public let title: String

    public let presenter: DocumentInteractionControllerPresenter

    private var documentInteractionController: UIDocumentInteractionController?

    private var imageData: NSData?

    private var caption: String?

    // MARK: Initialization

    public init(title: String = "Instagram", presenter: DocumentInteractionControllerPresenter) {
        self.title = title
        self.presenter = presenter
    }

    // MARK: UIActivity overrides



    // MARK: Document interaction controller delegate

    public func documentInteractionControllerDidDismissOpenInMenu(controller: UIDocumentInteractionController) {
        activityDidFinish(true)
    }
    
}

extension InstagramActivity {

    public override class func activityCategory() -> UIActivityCategory {
        return .Share
    }

    public override func activityTitle() -> String? {
        return title
    }

    public override func activityType() -> String? {
        return "com.instagram.exclusivegram"
    }

    public override func activityImage() -> UIImage? {
        return UIImage(named: "instagram", inBundle: NSBundle(forClass: InstagramActivity.self), compatibleWithTraitCollection: nil)
    }

    public override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        return UIApplication.sharedApplication().canOpenURL(NSURL(string: "instagram://app")!)
            && activityItems.filter { $0 is UIImage || $0 is NSData }.count != 0
    }

    public override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for item in activityItems {
            if let image = item as? UIImage {
                imageData = UIImageJPEGRepresentation(image, 1.0)
            }
            else if let data = item as? NSData {
                imageData = UIImageJPEGRepresentation(UIImage(data: data, scale: 1.0), 1.0)
            }
            else if let text = item as? String {
                caption = text
            }
        }
    }

    public override func performActivity() {
        let path = NSTemporaryDirectory().stringByAppendingPathComponent("instagram.igo")
        if !NSFileManager.defaultManager().createFileAtPath(path, contents: imageData, attributes: nil) {
            activityDidFinish(false)
            return
        }

        documentInteractionController = UIDocumentInteractionController(URL: NSURL(fileURLWithPath: path)!)
        documentInteractionController?.UTI = activityType()
        documentInteractionController?.delegate = self
        if let caption = caption {
            documentInteractionController?.annotation = [ "InstagramCaption" : caption ]
        }

        if let documentInteractionController = documentInteractionController {
            presenter(documentInteractionController)
        }
    }

}
