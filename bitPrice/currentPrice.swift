//
//  currentPrice.swift
//  bitPrice
//
//  Created by 小林 泰 on 2017/03/24.
//  Copyright © 2017年 TokyoIceHockeyChannel. All rights reserved.
//

import UIKit
import Alamofire

class CurrentPrice {
    
    var _lastPrice: String!
    var _bidPrice: String!
    var _askPrice: String!
    var _highPrice: String!
    var _lowPrice: String!
    var _volume: String!
    var _date: String!
    var _timestamp: Double!
    
    var lastPrice: String {
        if _lastPrice == nil {
            _lastPrice = ""
        }
        return _lastPrice
    }
    
    var bidPrice: String {
        if _bidPrice == nil {
            _bidPrice = ""
        }
        return _bidPrice
    }
    
    var askPrice: String {
        if _askPrice == nil {
            _askPrice = ""
        }
        return _askPrice
    }
    
    var highPrice: String {
        if _highPrice == nil {
            _highPrice = ""
        }
        return _highPrice
    }
    
    var lowPrice: String {
        if _lowPrice == nil {
            _lowPrice = ""
        }
        return _lowPrice
    }
    
    var volume: String {
        if _volume == nil {
            _volume = ""
        }
        return _volume
    }
    
    var timestamp: Double {
        if _timestamp == nil {
            _timestamp = 0.0
        }
        return _timestamp
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .full
        let dateNow = NSDate(timeIntervalSince1970: timestamp)
        let currentTime = dateFormatter.string(from: dateNow as Date)
        self._date = currentTime
        
        return _date
        
    }
    
    func downloadPriceDetails(completed: @escaping DownloadComplete) {
        
        
        Alamofire.request(PRICE_URL).responseJSON{ response in
            
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let last = dict["last"] as? Int {
                    self._lastPrice = String(last)
                    print(self._lastPrice)
                }
                
                if let bid = dict["bid"] as? Int {
                    self._bidPrice = String(bid)
                    print(self._bidPrice)
                }
                
                if let ask = dict["ask"] as? Int {
                    self._askPrice = String(ask)
                    print(self._askPrice)
                }
                
                if let high = dict["high"] as? Int {
                    self._highPrice = String(high)
                    print(self._highPrice)
                }
                
                if let low = dict["low"] as? Int {
                    self._lowPrice = String(low)
                    print(self._lowPrice)
                }
                
                if let volume = dict["volume"] as? String {
                    self._volume = volume
                    print(self._volume)
                }
                
                if let timestamp = dict["timestamp"] as? Double {
                    self._timestamp = timestamp
                    print(self._timestamp)
                }
                
            }
            completed()
        }
        
        print("parsing completed")
    }
}















