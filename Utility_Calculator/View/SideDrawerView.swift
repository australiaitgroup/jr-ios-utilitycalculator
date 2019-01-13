//
//  SideDrawerView.swift
//  Utility_Calculator
//
//  Created by LIN LIU on 5/1/19.
//  Copyright © 2019 LinLiu. All rights reserved.
//

import UIKit

class SideDrawerView: UIView {
    var button10 = UIButton(),button11 = UIButton(),button12 = UIButton(), button7 = UIButton(), button8 = UIButton(), button9 = UIButton(),button4 = UIButton(), button5 = UIButton(), button6 = UIButton(), button1 = UIButton(), button2 = UIButton(), button3 = UIButton(), unaryButtons:[UIButton] = [],colorButtons:[UIButton] = []
    
    var sideDrawerViewGradientLayer1  = CalculatorGradiantLayer()
    var sideDrawerViewGradientLayer2  = CalculatorGradiantLayer()
    var sideDrawerViewGradientLayer3  = CalculatorGradiantLayer()
    
    private var buttonFontSize: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViewFrameSize()
        
        self.defineBackgroundColor()
        
        self.setDefautBackgroundColor()
        
        self.addUnaryButtons()
        
        self.addColorButtons()
        
        self.groupButtons()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setViewFrameSize(){
        self.frame = CGRect(x: -(SizeConfig.mainWidth - 2 * SizeConfig.marginWidth - SizeConfig.buttonWidth), y: SizeConfig.mainHeight / 10 * 3.3 + SizeConfig.marginHeight, width: SizeConfig.mainWidth - 2 * SizeConfig.marginWidth - SizeConfig.buttonWidth, height: SizeConfig.marginHeight * 4.12)
    }
    
    
    func defineBackgroundColor(){
        sideDrawerViewGradientLayer1.setLayerProps(parent: self.bounds, leftColor: ColorConfig.mainViewBackgroundColorLeft1.cgColor, rightColor: ColorConfig.mainViewBackgroundColorRight1.cgColor, leftLocation: 0.0, rightLocation: 1.2, leftStartPoint: 0, rightStartPoint: 0, leftEndPoint: 1, rightEndPoint: 0)
        
        sideDrawerViewGradientLayer2.setLayerProps(parent: self.bounds, leftColor: ColorConfig.mainViewBackgroundColorLeft1.cgColor, rightColor: ColorConfig.mainViewBackgroundColorRight1.cgColor, leftLocation: 0.0, rightLocation: 1.2, leftStartPoint: 0, rightStartPoint: 0, leftEndPoint: 1, rightEndPoint: 0)
        
        sideDrawerViewGradientLayer3.setLayerProps(parent: self.bounds, leftColor: ColorConfig.mainViewBackgroundColorLeft1.cgColor, rightColor: ColorConfig.mainViewBackgroundColorRight1.cgColor, leftLocation: 0.0, rightLocation: 1.2, leftStartPoint: 0, rightStartPoint: 0, leftEndPoint: 1, rightEndPoint: 0)
    }
    
    
    func setDefautBackgroundColor(){
        self.backgroundColor = ColorConfig.mainViewBackgroundColorLeft1
    }
    
    
    func groupButtons(){
        unaryButtons = [button10, button11, button12, button7, button8, button9, button4, button5, button6]
        
        colorButtons = [button1, button2, button3]
    }
    
    
    func addUnaryButtons(){
        if self.frame.size.height <= 255{
            buttonFontSize = 16
        }
        else if self.frame.size.height <= 300{
            buttonFontSize = 18
        }
        else if self.frame.size.height <= 390{
            buttonFontSize = 20
        }else{
            buttonFontSize = 22
        }
        
        button12 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth,title: "±", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
        
        button11 = Buttons.init(x: SizeConfig.marginWidth * 7, y:  SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "√", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
        
        button10 = Buttons.init(x: SizeConfig.marginWidth * 13, y:  SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "x²", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
        
        button7 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth,title: "x³", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
        
        button8 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "⟦x⟧", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
        
        button9 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "⟧x⟦", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
        
        button4 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 2 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "cos", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
        
        button5 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight * 2 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "sin", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
        
        button6 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight * 2 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "tan", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewNumberButtonBackgroundColor1, titleColor: UIColor.black, manager: self)
    }
    
    
    func addColorButtons(){
        button1 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorLeft1, titleColor: UIColor.black, manager: self)
        button1.tag = 1
        
        button2 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorRight2, titleColor: UIColor.black, manager: self)
        button2.tag = 2
        
        button3 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: .gray , titleColor: UIColor.black, manager: self)
        button3.tag = 3
    }
}
