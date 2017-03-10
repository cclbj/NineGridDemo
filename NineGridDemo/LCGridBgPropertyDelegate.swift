//
//  LCGridBgPropertyDelegate.swift
//  NineGridDemo
//
//  Created by lcc on 2017/3/10.
//  Copyright © 2017年 early bird international. All rights reserved.
//

import UIKit

protocol GridBgDelegate {
    
    var picArray:Array<Any>?{set get};
    var currentViewHeidth:CGFloat?{set get}; //当前view的高度
    var currentViewWidth:CGFloat?{set get}; //当前view的宽度
    
    
    
}
