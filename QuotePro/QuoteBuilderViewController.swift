//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Graeme Harrison on 2016-02-17.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {

    @IBOutlet var quoteView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: nil, options: nil).first! as! QuoteView
        view.frame.size = quoteView.frame.size
        quoteView.addSubview(view)
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
