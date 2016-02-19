//
//  QuoteView.swift
//  QuotePro
//
//  Created by Graeme Harrison on 2016-02-17.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit

class QuoteView: UIView {
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func setPicture(image: UIImage) {
        self.imageView.image = image
    }
    
    func setLabel(quote: String, author: String) {
        self.quoteLabel.text = quote
        self.authorLabel.text = author
    }
    
    class func getPresetQuoteAuthorAndPhoto(presetQuote: String, presetAuthor: String, presetPhotoURL: String, frameSize: CGSize, onComplete: ((QuoteView) -> Void)) {
        let view = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: nil, options: nil).first! as! QuoteView
        view.frame.size.width = frameSize.width
        view.frame.size.height = frameSize.width
        view.setLabel(presetQuote, author: presetAuthor)
        
        PhotoWebService.sharedLoader.imageForUrl("\(presetPhotoURL)", completionHandler:{(image: UIImage?, url: String) in
            view.setPicture(image!)
            onComplete(view)
        })
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    //    override func drawRect(rect: CGRect) {
    //    }
    
}
