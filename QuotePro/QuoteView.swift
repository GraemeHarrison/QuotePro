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
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    //    override func drawRect(rect: CGRect) {
    //    }
    
}
