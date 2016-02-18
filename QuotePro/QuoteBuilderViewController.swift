//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Graeme Harrison on 2016-02-17.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit


class QuoteBuilderViewController: UIViewController {

    @IBOutlet var quoteViewContainer: UIView!
    var quoteView = QuoteView()
    var randomNum: Int = 0
    var globalQuote: String = ""
    var globalAuthor: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        getRandomQuote()
        getRandomPic()
    }

    func prepareView() {
        let view = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: nil, options: nil).first! as! QuoteView
        view.frame.size = quoteViewContainer.frame.size
        quoteViewContainer.addSubview(view)
        quoteView = view
    }
    
    @IBAction func newQuoteButton(sender: UIButton) {
        getRandomQuote()
    }
    
    @IBAction func newImageButton(sender: UIButton) {
        getRandomPic()
    }
    
    @IBAction func saveData(sender: UIButton) {
        let quoteText = globalQuote
        let authorText = globalAuthor
        let pic =  "https://unsplash.it/400/400?image=\(randomNum)"
        let dataManager = DataManager.sharedInstance
        dataManager.saveData(quoteText, author: authorText, picURL: pic)
    }
    
    func getRandomQuote() {
        let quoteService = QuoteWebService()
        quoteService.callAPI { (quote, author) -> Void in
            self.quoteView.setLabel(quote!, author: author!)
            self.globalQuote = quote!
            self.globalAuthor = author!
        }
    }
    
    func getPresetQuoteAndAuthor(presetQuote: String, presetAuthor: String) {
        self.quoteView.setLabel(presetQuote, author: presetAuthor)
    }
    
    func getRandomPic() {
        let min = 0
        let max = 1014
        let randomInt =  min + Int(arc4random_uniform(UInt32(max - min + 1)))
        randomNum = randomInt
        getPics(randomInt)
    }
    
    func getPicWithNumber(number: Int) {
        getPics(number)
    }
    
    func getPics(picNumber: Int){
        PhotoWebService.sharedLoader.imageForUrl("https://unsplash.it/400/400?image=\(picNumber)", completionHandler:{(image: UIImage?, url: String) in
            self.quoteView.setPicture(image!)
        })
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
