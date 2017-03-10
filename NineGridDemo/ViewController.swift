//
//  ViewController.swift
//  NineGridDemo
//
//  Created by lcc on 2017/3/10.
//  Copyright © 2017年 early bird international. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var testArray:Array = ["first"];
        var gridView:LCGridView = LCGridView.init(testArray,frame: CGRect.init(x: 0, y: 0, width: 150, height: LCGridView.getCurViewHeight(array: testArray, width: 150)));
        
        self.view.addSubview(gridView);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

