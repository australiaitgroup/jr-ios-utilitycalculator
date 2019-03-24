//
//  SideDrawerView.swift
//  Utility_Calculator
//
//  Created by LIN LIU on 5/1/19.
//  Copyright © 2019 LinLiu. All rights reserved.
//

import UIKit

class SideDrawerView: UIScrollView {
    var button10 = UIButton(),button11 = UIButton(),button12 = UIButton(), button7 = UIButton(), button8 = UIButton(), button9 = UIButton(),button4 = UIButton(), button5 = UIButton(), button6 = UIButton()
    
    var unaryButtons:[UIButton] = [],colorButtons:[UIButton] = []
    
    //M: color buttons
    var buttonC1 = UIButton(), buttonC2 = UIButton(), buttonC3 = UIButton(),buttonC4 = UIButton(), buttonC5 = UIButton(), buttonC6 = UIButton(),buttonC7 = UIButton(), buttonC8 = UIButton(), buttonC9 = UIButton(),buttonC10 = UIButton(), buttonC11 = UIButton(), buttonC12 = UIButton()
    
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
        
        self.contentSize = CGSize(width: self.bounds.width, height: self.bounds.height * 1.5)
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
        
        colorButtons = [buttonC1, buttonC2, buttonC3, buttonC4, buttonC5, buttonC6, buttonC7, buttonC8, buttonC9, buttonC10, buttonC11, buttonC12 ]
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
        buttonC1 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorLeft1, titleColor: UIColor.black, manager: self)
        buttonC1.tag = 1
        
        buttonC2 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorRight2, titleColor: UIColor.black, manager: self)
        buttonC2.tag = 2
        
        buttonC3 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight * 3 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: .gray , titleColor: UIColor.black, manager: self)
        buttonC3.tag = 3
        
        
        buttonC4 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 4 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorRight4, titleColor: UIColor.black, manager: self)
        buttonC4.tag = 4
        
        buttonC5 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight * 4 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorRight5, titleColor: UIColor.black, manager: self)
        buttonC5.tag = 5
        
        buttonC6 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight * 4 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorLeft6 , titleColor: UIColor.black, manager: self)
        buttonC6.tag = 6
        
        
        buttonC7 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 5 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorRight7, titleColor: UIColor.black, manager: self)
        buttonC7.tag = 7
        
//        buttonC8 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight * 5 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorLeft8, titleColor: UIColor.black, manager: self)
//        buttonC8.tag = 8
//
//        buttonC9 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight * 5 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorLeft9 , titleColor: UIColor.black, manager: self)
//        buttonC9.tag = 9
//
//
//        buttonC10 = Buttons.init(x: SizeConfig.marginWidth, y: SizeConfig.marginHeight * 6 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorLeft10, titleColor: UIColor.black, manager: self)
//        buttonC10.tag = 10
//
//        buttonC11 = Buttons.init(x: SizeConfig.marginWidth * 7, y: SizeConfig.marginHeight * 6 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor: ColorConfig.keyPadViewBackgroundColorLeft11, titleColor: UIColor.black, manager: self)
//        buttonC11.tag = 11
//
//        buttonC12 = Buttons.init(x: SizeConfig.marginWidth * 13, y: SizeConfig.marginHeight * 6 + SizeConfig.marginWidth, width: SizeConfig.buttonWidth, height:  SizeConfig.buttonWidth, title: "", fontSize: buttonFontSize, cornerRadius: 0.5 * SizeConfig.buttonWidth, backgroundColor:ColorConfig.keyPadViewBackgroundColorLeft12, titleColor: UIColor.black, manager: self)
//        buttonC12.tag = 12
    }
}
