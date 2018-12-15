//
//  ViewMainView.swift
//  Utility_Calculator
//
//  Created by LIN LIU on 15/12/18.
//  Copyright © 2018 LinLiu. All rights reserved.
//

import UIKit

class MainView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        self.setViewFrameSize()
        
        self.setBackgroundColor()
        
    }
  

    
    func setViewFrameSize(){
        self.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        print("width Pixel:\(UIScreen.main.bounds.size.width)")
        print("height Pixel:\(UIScreen.main.bounds.size.height)")
        
        let nWidth = UIScreen.main.nativeBounds.width
        let nHeight = UIScreen.main.nativeBounds.height
        print("\n Native Width:\(nWidth) \n Native Height:\(nHeight)")
    }
    
    func setBackgroundColor(){
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.bounds
        let leftColor = UIColor(red: (255 / 255.0), green: (213 / 255.0), blue: (228 / 255.0), alpha: 1)
        let rightColor = UIColor(red: (245 / 255.0), green: (227 / 255.0), blue: (217/255.0), alpha: 1)
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.layer.addSublayer(gradientLayer)
    }
    
    //    func addDropDown(){
    //        var btn = UIButton()
    //        btn.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.width, height: 25.0)
    //        btn.backgroundColor = UIColor.green
    //        btn.setTitle("Select", for: .normal)
    //        //btn.addTarget(self, action:"sth", forControlEvents:TouchUpInside)
    //        self.addSubview(btn)
    //    }
}
