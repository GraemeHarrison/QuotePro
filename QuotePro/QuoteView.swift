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
    
    
    func randomNum() {
        let min = 0
        let max = 1014
        let randomInt =  min + Int(arc4random_uniform(UInt32(max - min + 1)))
        getPics(randomInt)
    }
    
    func getQuotes(){
        let quoteService = QuoteWebService()
        quoteService.callAPI { (quote, author) -> Void in
            
            self.setLabel(quote!, author: author!)
        }
    }
    
    func getPics(picNumber: Int){
        PhotoWebService.sharedLoader.imageForUrl("https://unsplash.it/400/400?image=\(picNumber)", completionHandler:{(image: UIImage?, url: String) in
            self.imageView.image = image
        })
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
