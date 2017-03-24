//
//  ViewController.swift
//  bitPrice
//
//  Created by 小林 泰 on 2017/03/24.
//  Copyright © 2017年 TokyoIceHockeyChannel. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var bidLabel: UILabel!
    @IBOutlet weak var askLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var currentPrice: CurrentPrice!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPrice = CurrentPrice()
        print("view did load")
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        currentPrice.downloadPriceDetails{
            self.updateMainUI()
        }
        
        
        print("-------------printing OK?--------------")
        print(currentPrice.lastPrice)
        print(currentPrice.askPrice)
        print("-------------printing OK? end--------------")
        print("view did appear")
    }

    
    func updateMainUI() {
        lastLabel.text = currentPrice.lastPrice
        bidLabel.text = currentPrice.bidPrice
        askLabel.text = currentPrice.askPrice
        highLabel.text = currentPrice.highPrice
        lowLabel.text = currentPrice.lowPrice
        volumeLabel.text = currentPrice.volume
        timeLabel.text = currentPrice.date
        print("update Main UI")
    }

    @IBAction func refreshBtnPressed(_ sender: UIButton) {
        currentPrice.downloadPriceDetails {
            self.updateMainUI()
            
        }
        //currentPrice.downloadPriceDetails(completed: DownloadComplete)
        updateMainUI()
        print("refresh button pressed")
        
    }
    


}

