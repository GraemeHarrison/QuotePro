//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Graeme Harrison on 2016-02-17.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit

protocol QuoteViewProtocol {
    func setLabel(quote: String, author: String)
}

class QuoteBuilderViewController: UIViewController {

    @IBOutlet var quoteViewContainer: UIView!
    var quoteView = QuoteView()
    var quoteViewDelegate = QuoteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        getQuotes()
        getPics()
    }

    func prepareView() {
        let view = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: nil, options: nil).first! as! QuoteView
        view.frame.size = quoteViewContainer.frame.size
        quoteViewContainer.addSubview(view)
        quoteView = view
    }
    
    @IBAction func newQuoteButton(sender: UIButton) {
        quoteView.getQuotes()
    }
    
    @IBAction func newImageButton(sender: UIButton) {
        getPics()
    }
    
    func getQuotes() {
//        let quoteService = QuoteWebService()
//        quoteService.callAPI { (quote, author) -> Void in
//        self.quoteViewDelegate.setLabel(quote!, author: author!)
//        }
        quoteView.getQuotes()
    }
    
    func getPics() {
       quoteView.randomNum()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
