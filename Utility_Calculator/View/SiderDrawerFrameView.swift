//
//  SiderDrawerFrameView.swift
//  Utility_Calculator
//
//  Created by LIN LIU on 24/3/19.
//  Copyright © 2019 LinLiu. All rights reserved.
//

import UIKit


class SideDrawerFrameView: UIView {

    private var buttonFontSize: CGFloat = 0.0
    
    var sideDrawerView = SideDrawerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViewFrameSize()
        
        self.defineBackgroundColor()
    
    }



    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    func setViewFrameSize(){
        self.frame = CGRect(x: -(SizeConfig.mainWidth - 2 * SizeConfig.marginWidth - SizeConfig.buttonWidth), y: SizeConfig.mainHeight / 10 * 3.3 + SizeConfig.marginHeight, width: SizeConfig.mainWidth - 2 * SizeConfig.marginWidth - SizeConfig.buttonWidth, height: SizeConfig.marginHeight * 4.12)
    }
    
    func defineBackgroundColor(){
        self.backgroundColor = .white
    }
}
