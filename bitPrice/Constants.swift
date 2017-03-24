//
//  Constants.swift
//  bitPrice
//
//  Created by 小林 泰 on 2017/03/24.
//  Copyright © 2017年 TokyoIceHockeyChannel. All rights reserved.
//

import Foundation

let BASE_URL = "https://coincheck.com"
let DESC_URL = "/api/ticker"

typealias DownloadComplete = () -> ()

let PRICE_URL = "\(BASE_URL)\(DESC_URL)"
