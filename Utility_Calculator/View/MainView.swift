//
//  ViewMainView.swift
//  Utility_Calculator
//
//  Created by LIN LIU on 15/12/18.
//  Copyright © 2018 LinLiu. All rights reserved.
//
import UIKit

class MainView: UIView {
    var resultLabel = UILabel()
    var processLabel = UILabel()
    var pendingLabel = UILabel()
    
    var mainViewGradientLayer1  = CalculatorGradiantLayer()
    var mainViewGradientLayer2  = CalculatorGradiantLayer()
    var mainViewGradientLayer3  = CalculatorGradiantLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViewFrameSize()
        
        self.defineBackgroundColor()
        
        self.setDefautBackgroundColor()
        
        self.addResultLabel()
        
        self.addDisplayLabel()
        
        self.addPendingLabel()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setViewFrameSize(){
        self.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
    
    
    func defineBackgroundColor(){
        mainViewGradientLayer1.setLayerProps(parent: self.bounds, leftColor: ColorConfig.mainViewBackgroundColorLeft1.cgColor, rightColor: ColorConfig.mainViewBackgroundColorRight1.cgColor, leftLocation: 0.0, rightLocation: 1.0, leftStartPoint: 0, rightStartPoint: 0, leftEndPoint: 1, rightEndPoint: 0)
        
        mainViewGradientLayer2.setLayerProps(parent: self.bounds, leftColor: ColorConfig.mainViewBackgroundColorLeft2.cgColor, rightColor: ColorConfig.mainViewBackgroundColorRight2.cgColor, leftLocation: 0.0, rightLocation: 1.0, leftStartPoint: 0, rightStartPoint: 0, leftEndPoint: 1, rightEndPoint: 0)
        
        mainViewGradientLayer3.setLayerProps(parent: self.bounds, leftColor: ColorConfig.mainViewBackgroundColorRight3.cgColor, rightColor: ColorConfig.mainViewBackgroundColorRight3.cgColor, leftLocation: 0.0, rightLocation: 1.0, leftStartPoint: 0, rightStartPoint: 0, leftEndPoint: 1, rightEndPoint: 0)
    }
    
    
    func setDefautBackgroundColor(){
        self.layer.addSublayer(mainViewGradientLayer1)
    }
    
    
    func addResultLabel(){
        resultLabel.frame = CGRect(x: SizeConfig.mainWidth / 10 * 1, y: SizeConfig.mainHeight / 10 * 2.3 / 20 * 19, width: SizeConfig.resultLabelWidth, height: SizeConfig.resultLabelHeight)
        resultLabel.textAlignment = .right
        resultLabel.text = "0"
        if self.frame.size.height <= 600{
            resultLabel.font = UIFont.systemFont(ofSize: 50)
        }else{
            resultLabel.font = UIFont.systemFont(ofSize: 70)
        }
        resultLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(resultLabel)
    }
    
    
    func addDisplayLabel(){
        processLabel .frame = CGRect(x: SizeConfig.mainWidth / 10 * 0.75, y: SizeConfig.mainHeight / 10 * 2.3 / 20 * 4.5, width: SizeConfig.processLabelWidth, height: SizeConfig.processLabelHeight)
        processLabel.textAlignment = .left
        processLabel.layer.cornerRadius = 5
        processLabel.clipsToBounds = true
        processLabel.text = ""
        if self.frame.size.height <= 600{
            processLabel.font = UIFont.systemFont(ofSize: 25)
        }else{
            processLabel.font = UIFont.systemFont(ofSize: 35)
        }
        processLabel.backgroundColor = ColorConfig.mainViewProcessLableColor1
        processLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(processLabel)
    }
    
    
    func addPendingLabel(){
        pendingLabel.text = "0"
    }
}

