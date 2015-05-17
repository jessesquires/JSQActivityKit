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

///  An Instagram sharing activity.
public class InstagramActivity: UIActivity, UIDocumentInteractionControllerDelegate {

    // MARK: Typealiases

    ///  A closure that presents a document interaction controller.
    ///
    ///  :returns: The document interaction controller to present.
    public typealias DocumentInteractionControllerPresenter = (UIDocumentInteractionController) -> Void

    // MARK: Properties

    ///  The display title for the activity.
    public let title: String

    ///  The closure with which the activity presents a document interaction controller.
    public let presenter: DocumentInteractionControllerPresenter

    private var documentInteractionController: UIDocumentInteractionController?

    private var imageData: NSData?

    private var caption: String?

    // MARK: Initialization

    ///  Constructs a new `InstagramActivity` instance with the specified title and presenter.
    ///
    ///  :param: title     The title to display for the activity. The default value is `"Instagram"`.
    ///  :param: presenter The closure to call to present the document interaction controller.
    ///
    ///  :returns: A new `InstagramActivity` instance.
    public init(title: String = "Instagram", presenter: DocumentInteractionControllerPresenter) {
        self.title = title
        self.presenter = presenter
    }

    // MARK: UIActivity overrides

    ///  :nodoc:
    public override class func activityCategory() -> UIActivityCategory {
        return .Share
    }

    ///  :nodoc:
    public override func activityTitle() -> String? {
        return title
    }

    ///  :nodoc:
    public override func activityType() -> String? {
        return "com.instagram.exclusivegram"
    }

    ///  :nodoc:
    public override func activityImage() -> UIImage? {
        return UIImage(named: "instagram", inBundle: NSBundle(forClass: InstagramActivity.self), compatibleWithTraitCollection: nil)
    }

    ///  :nodoc:
    public override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        return UIApplication.sharedApplication().canOpenURL(NSURL(string: "instagram://app")!)
            && activityItems.filter { $0 is UIImage || $0 is NSData }.count != 0
    }

    ///  :nodoc:
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

    ///  :nodoc:
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

    // MARK: Document interaction controller delegate

    ///  :nodoc:
    public func documentInteractionControllerDidDismissOpenInMenu(controller: UIDocumentInteractionController) {
        activityDidFinish(true)
    }
    
}
