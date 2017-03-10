//
//  LCGridView.swift
//  NineGridDemo
//
//  Created by lcc on 2017/3/10.
//  Copyright © 2017年 early bird international. All rights reserved.
//

import UIKit

let ONE_HEIGHT:CGFloat = 150;
let TWO_HEIGHT:CGFloat = 150;
let THREE_HEIGHT:CGFloat = 60;
let FOURT_HEIGHT:CGFloat = 150;
let FIVE_TOSIX_HEIGHT:CGFloat = 120;
let SEVEN_TONINE_HEIGHT:CGFloat = 150;

let GRID_INTERVAL_WIDTH:CGFloat = 4;



class LCGridView: UIView {
    
    var picArray:Array<Any>?;
    var currentViewHeidth:CGFloat?; //当前view的高度
    var currentViewWidth:CGFloat?; //当前view的宽度
    
    var gridWidth:CGFloat?;
    var gridHeight:CGFloat?;
    
   
    init(_ picArray:Array<Any>,frame:CGRect){
    
        super.init(frame: frame);
        
        self.picArray = picArray;
        
        //计算当前格子图片个宽度
        self.cfgGridProperty();
        
        self.setupUI();

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //初始化格子的宽度与高度
    func cfgGridProperty(){
        
        if picArray?.count == 0 {
            
        
            return;
        }
        
        if picArray!.count == 1  {
            
            self.gridWidth = self.frame.size.width;
            self.gridHeight = self.gridWidth;
            
        }else if picArray?.count == 2{
            
            self.gridWidth = (self.frame.size.width - GRID_INTERVAL_WIDTH) * 0.5;
            self.gridHeight = self.gridWidth;
            
        }else if picArray!.count == 3{
            
            self.gridWidth = (self.frame.size.width - GRID_INTERVAL_WIDTH * 2) / 3;
            self.gridHeight = self.gridWidth;
            
        }else if picArray!.count == 4{
            
            self.gridWidth = (self.frame.size.width - GRID_INTERVAL_WIDTH) * 0.5;
            self.gridHeight = self.gridWidth;
        
        }else if picArray!.count > 3 && picArray!.count <= 6{
            
            self.gridWidth = (self.frame.size.width - GRID_INTERVAL_WIDTH*2)/3;
            self.gridHeight = self.gridWidth;
            
        }else if picArray!.count > 6 && picArray!.count <= 9{
            
            self.gridWidth = (self.frame.size.width - GRID_INTERVAL_WIDTH*2)/3;
            self.gridHeight = self.gridWidth;
            
        }
        
    }
    
    //创建界面
    func setupUI(){
        
        var original_x:CGFloat? = 0;
        var original_y:CGFloat? = 0;
        
        //创建九宫格
        for i in 0...self.picArray!.count-1{
        
            let button:UIButton = UIButton.init(type: .custom);
            button.tag = i;
            button.addTarget(self, action: #selector(self.btnTouch(btn:)), for: .touchUpInside);
            button.backgroundColor = UIColor.green;
            
            //折行的时候
            if (self.picArray?.count == 4 ? i%2 == 0 : i%3 == 0)  && i != 0{
                
                //折行的时候当前的格子坐标
                original_x = 0;
                original_y = original_y! + self.gridHeight! + GRID_INTERVAL_WIDTH;
                
                button.frame = CGRect.init(x: original_x!, y: original_y!, width: self.gridWidth!, height: self.gridHeight!);
                
                //下次的各自坐标要添加一个宽度与间隔
                original_x = original_x! + self.gridWidth! + GRID_INTERVAL_WIDTH;
                
                
            }else{
            
                button.frame = CGRect.init(x: original_x!, y: original_y!, width: self.gridWidth!, height: gridHeight!);
                original_x = original_x! + self.gridWidth! + GRID_INTERVAL_WIDTH;
            }
            
            self.addSubview(button);
    
        }
        
    }
    
    //图片被点击
    func btnTouch(btn:UIButton){
        
        print("click at \(btn.tag)");
    }
    
    //获取当前view的高度
    static func getCurViewHeight(array:Array<Any>,width:CGFloat) -> CGFloat{
        
        if array.count == 0 {
            
            return 0;
        }
        
        if array.count == 1  {
            
            return width;
        }else if array.count == 2{
            
            return (width-GRID_INTERVAL_WIDTH) * 0.5;
        
        }else if array.count == 3{
        
            return (width-GRID_INTERVAL_WIDTH * 2)/3;
            
        }else if array.count == 4{
            
            return (width - GRID_INTERVAL_WIDTH) * 0.5;
            
        }else if array.count > 4 && array.count <= 6{
            
            return (width - GRID_INTERVAL_WIDTH * 2)/3 * 2;
        
        }else if array.count > 6 && array.count <= 9{
        
            return (width - GRID_INTERVAL_WIDTH * 2)/3 * 3;
        }
        
        
        return 0;
        
    }
    
    


}
