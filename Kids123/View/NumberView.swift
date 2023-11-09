//
//  NumberView.swift
//  Kids123
//
//  Created by Denis Kozlov on 15.05.2020.
//  Copyright © 2020 Denis Kozlov. All rights reserved.
//

import UIKit

class NumberView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        drawRingFittingInsideView()
    }
    
    // MARK:- VARS
    var numberCenter = CGPoint(x: UIScreen.main.bounds.size.width/2+15, y: UIScreen.main.bounds.size.height/2 + UIScreen.main.bounds.size.height*0.045)
    var strokeColor: CGColor
    var strokeStart: CGFloat = 0
    var strokeEnd: CGFloat = 1
    var shapeLayerNum: Int
    var lineWidth: CGFloat = 50
    var switchStartDwawing = false
    var switchEndDwawing = false
    
    let bottleNeckView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1)
        view.frame.size = CGSize(width: 44, height: 44)
        view.layer.cornerRadius = 22
        return view
    }()
    
    let candyImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "CandySix")
        view.frame.size = CGSize(width: 33, height: 62)
        return view
    }()
    
    var startCenter = CGPoint()
    var midlePoint = CGPoint()
    var eargPoint = CGPoint()
    var endCenter = CGPoint()
    var pathNumber = CGMutablePath()
    var candyImage = UIImage()
    var mouth = MouthView()
    
    var pathArray = [UIBezierPath]()
    var points = [CGPoint]()
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    init(strokeColor: CGColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), strokeStart: CGFloat = 0, strokeEnd: CGFloat = 0.1, shapeLayerNum: Int = 0, lineWidth: CGFloat = 50, candy: UIImage = UIImage()) {
        
        self.strokeColor = strokeColor
        self.strokeStart = strokeStart
        self.strokeEnd = strokeEnd
        self.shapeLayerNum = shapeLayerNum
        self.lineWidth = lineWidth
        self.candyImage = candy
        
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height  + UIScreen.main.bounds.size.height*0.09))
    }
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let shapeLayerArray = [CAShapeLayer(),CAShapeLayer(),
                           CAShapeLayer(),CAShapeLayer(),
                           CAShapeLayer(),CAShapeLayer(),
                           CAShapeLayer(),CAShapeLayer(),
                           CAShapeLayer(),CAShapeLayer(),
                           CAShapeLayer(),CAShapeLayer(),
                           CAShapeLayer(),]
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    internal func drawRingFittingInsideView()->() {
        
        candyImageView.image = candyImage
        
        // MARK:- NUMBER 1
        
        if shapeLayerNum == 0 {
            
            var center = numberCenter
            center.y = numberCenter.y+30
            startCenter = CGPoint(x: center.x - 50, y: center.y - 10)
            let eargPoint = CGPoint(x: center.x, y: center.y - 40)
            endCenter = CGPoint(x: center.x, y: center.y + 180)
            
            pathNumber.move(to: startCenter)
            
            for index in stride(from: 1.5, to: 25, by: 1.5) {
                let point = CGPoint(x: startCenter.x + index.cgFloat(),
                                    y: startCenter.y - index.cgFloat()/5*3)
                pathNumber.addLine(to: point)
            }
            pathNumber.addLine(to: eargPoint)
            for index in stride(from: 1.95, to: 195, by: 1.95) {
                let point = CGPoint(x: center.x,
                                    y: center.y - 15 + index.cgFloat())
                pathNumber.addLine(to: point)
            }
            pathNumber.addLine(to: endCenter)
            
            shapeLayerArray[0].fillColor = UIColor.clear.cgColor
            shapeLayerArray[0].strokeColor = strokeColor
            shapeLayerArray[0].lineWidth = lineWidth
            shapeLayerArray[0].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[0].lineJoin = CAShapeLayerLineJoin.round
            shapeLayerArray[0].path = pathNumber
            
            // draw for animations
            shapeLayerArray[0].strokeEnd = strokeEnd
            shapeLayerArray[0].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 1")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else
            
            // MARK:- NUMBER 2
            
            if shapeLayerNum == 1 {
            
            var centerCircle = numberCenter
            centerCircle.y = numberCenter.y+40
            centerCircle.x = numberCenter.x-15
            
            let radiusCircle = 65.0
            
            let angleRadiansStart = -150 * Double.pi / 180
            let startX = Double(centerCircle.x) + radiusCircle * cos(angleRadiansStart)
            let startY = Double(centerCircle.y) + radiusCircle * sin(angleRadiansStart)
            
            let angleRadiansFLine = 50 * Double.pi / 180
            let fLineX = Double(centerCircle.x) + radiusCircle * cos(angleRadiansFLine)
            let fLineY = Double(centerCircle.y) + radiusCircle * sin(angleRadiansFLine)
            
            startCenter = CGPoint(x: startX, y: startY)
            endCenter = CGPoint(x: fLineX+35, y: fLineY+110)
            
            pathNumber.move(to: startCenter)
            
            for index in stride(from: -150.0, to: 45.0, by: 4) {
                
                let angleRadians = index * Double.pi / 180
                let x = Double(centerCircle.x) + radiusCircle * cos(angleRadians)
                let y = Double(centerCircle.y) + radiusCircle * sin(angleRadians)
                
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            midlePoint = CGPoint(x: fLineX, y: fLineY)
                
                for index in stride(from: 3, to: 90.0, by: 3) {
                
                    let x = fLineX - index/1.2
                let y = fLineY + index
                
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            eargPoint = CGPoint(x: fLineX - 90, y: fLineY + 110)
            pathNumber.addLine(to: eargPoint)
                
            for index in stride(from: 0, to: 120.0, by: 4) {
                
                let x = eargPoint.x + index.cgFloat()
                let y = eargPoint.y
                
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            pathNumber.addLine(to: endCenter)
                        
            shapeLayerArray[1].fillColor = UIColor.clear.cgColor
            shapeLayerArray[1].strokeColor = strokeColor
            shapeLayerArray[1].lineWidth = lineWidth
            shapeLayerArray[1].lineCap = .round
            shapeLayerArray[1].lineJoin = .round
            shapeLayerArray[1].path = pathNumber
                        
            // draw for animations
            shapeLayerArray[1].strokeEnd = strokeEnd
            shapeLayerArray[1].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 2")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else
            
            // MARK:- NUMBER 3
            
            if shapeLayerNum == 2 {
            
            let centerCircle = CGPoint(x: numberCenter.x-20,
                                       y: numberCenter.y+25)
            
            let radiusUpperCircle = 45.0
            let radiusDownCircle = 65.0
            
            let centerCircleDown = CGPoint(x: centerCircle.x,
                                           y: centerCircle.y + (radiusUpperCircle.cgFloat() + radiusDownCircle.cgFloat()))
            
            let angleRadiansStart = -150 * Double.pi / 180
            let startX = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadiansStart)
            let startY = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadiansStart)
            
            startCenter = CGPoint(x: startX, y: startY)
                
            let angleRadiansEarg = -85 * Double.pi / 180
            let eargX = Double(centerCircleDown.x-6) + radiusDownCircle * cos(angleRadiansEarg)
            let eargY = Double(centerCircleDown.y+4) + radiusDownCircle * sin(angleRadiansEarg)
            
            let eargPoint = CGPoint(x: eargX, y: eargY)
                
            let angleRadiansEnd = -65 * Double.pi / 180
            let endX = Double(centerCircleDown.x) + radiusDownCircle * cos(angleRadiansEnd)
            let endY = Double(centerCircleDown.y) + radiusDownCircle * sin(angleRadiansEnd)
            
            let endPoint = CGPoint(x: endX, y: endY)
            
            pathNumber.move(to: startCenter)
            
                for index in stride(from: -150.0, to: 60.0, by: 5.25) {
                
                let angleRadians = index * Double.pi / 180
                let x = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadians)
                let y = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadians)
                
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
                
            pathNumber.addArc(tangent1End: eargPoint,
                        tangent2End: endPoint,
                        radius: 2)
            
                for index in stride(from: -65.0, to: 150.0, by: 3.65) {
                
                let angleRadians = index * Double.pi / 180
                let x = Double(centerCircleDown.x) + radiusDownCircle * cos(angleRadians)
                let y = Double(centerCircleDown.y) + radiusDownCircle * sin(angleRadians)
                
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
                let angleRadiansFinal = 150.0 * Double.pi / 180
            let xEnd = Double(centerCircleDown.x) + radiusDownCircle * cos(angleRadiansFinal)
            let yEnd = Double(centerCircleDown.y) + radiusDownCircle * sin(angleRadiansFinal)
            
            endCenter = CGPoint(x: xEnd, y: yEnd)
            
            shapeLayerArray[2].fillColor = UIColor.clear.cgColor
            shapeLayerArray[2].strokeColor = strokeColor
            shapeLayerArray[2].lineWidth = lineWidth
            shapeLayerArray[2].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[2].path = pathNumber
                        
            // draw for animations
            shapeLayerArray[2].strokeEnd = strokeEnd
            shapeLayerArray[2].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 3")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
            
        } else
        
        // MARK:- NUMBER 4
        
        if shapeLayerNum == 3 {
            
            var center = numberCenter
            center.y = numberCenter.y - 40
            startCenter = CGPoint(x: center.x - 30, y: center.y + 20)
            let eargPoint = CGPoint(x: center.x - 80, y: center.y + 180)
            endCenter = CGPoint(x: center.x + 80, y: center.y + 180)
            
            pathNumber.move(to: startCenter)
            
            for index in stride(from: 3.2, to: 160.0, by: 3.2) {
                
                let x = startCenter.x - index.cgFloat()/3.2
                let y = startCenter.y + index.cgFloat()
                
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            pathNumber.addLine(to: eargPoint)
            for index in stride(from: 3.2, to: 156.8, by: 3.2) {
                
                let x = eargPoint.x + index.cgFloat()
                let y = endCenter.y
                
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            pathNumber.addLine(to: endCenter)
            
            shapeLayerArray[3].fillColor = UIColor.clear.cgColor
            shapeLayerArray[3].strokeColor = strokeColor
            shapeLayerArray[3].lineWidth = lineWidth
            shapeLayerArray[3].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[3].lineJoin = CAShapeLayerLineJoin.round
            shapeLayerArray[3].path = pathNumber
                        
            // draw for animations
            shapeLayerArray[3].strokeEnd = strokeEnd
            shapeLayerArray[3].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 4 NUM (1)")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else if shapeLayerNum == 4 {
            
            var center = numberCenter
            center.y = numberCenter.y - 40
            startCenter = CGPoint(x: center.x + 40, y: center.y + 80)
            endCenter = CGPoint(x: center.x + 40, y: center.y + 240)
            
            pathNumber.move(to: startCenter)
            
            for index in stride(from: 1.6, to: 158.4, by: 1.6) {
                           
                let x = startCenter.x
                let y = startCenter.y + index.cgFloat()
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            pathNumber.addLine(to: endCenter)
            
            shapeLayerArray[4].fillColor = UIColor.clear.cgColor
            shapeLayerArray[4].strokeColor = strokeColor
            shapeLayerArray[4].lineWidth = lineWidth
            shapeLayerArray[4].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[4].path = pathNumber
                        
            // draw for animations
            shapeLayerArray[4].strokeEnd = strokeEnd
            shapeLayerArray[4].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 4 NUM (2)")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else
        
        // MARK:- NUMBER 5
        
        if shapeLayerNum == 5 {
            var center = numberCenter
            center.y = numberCenter.y - 40
            startCenter = CGPoint(x: center.x - 70, y: center.y + 20)
            let nextPoint = CGPoint(x: center.x - 75, y: center.y + 105)
            
            let centerCircle = CGPoint(x: center.x-20,
                                       y: center.y+25)
            let radiusDownCircle = 70.0
            
            let centerCircleDown = CGPoint(x: centerCircle.x,
                                           y: centerCircle.y + (75 + radiusDownCircle.cgFloat()))
            let angleCirRadians = 150 * Double.pi / 180
            
            pathNumber.move(to: startCenter)
            
            for index in stride(from: 3.4, to: 81.6, by: 3.4) {
                           
                let x = startCenter.x - index.cgFloat()/17
                let y = startCenter.y + index.cgFloat()
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            pathNumber.addLine(to: nextPoint)
            
            for index in stride(from: -96.7, to: 150.0, by: 3.3) {
                
                let angleRadians = index * Double.pi / 180
                let x = Double(centerCircleDown.x) + radiusDownCircle * cos(angleRadians)
                let y = Double(centerCircleDown.y) + radiusDownCircle * sin(angleRadians)
                
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            endCenter = CGPoint(x: Double(centerCircleDown.x) + radiusDownCircle * cos(angleCirRadians),
                                y: Double(centerCircleDown.y) + radiusDownCircle * sin(angleCirRadians))
            
            shapeLayerArray[5].fillColor = UIColor.clear.cgColor
            shapeLayerArray[5].strokeColor = strokeColor
            shapeLayerArray[5].lineWidth = lineWidth
            shapeLayerArray[5].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[5].lineJoin = CAShapeLayerLineJoin.round
            shapeLayerArray[5].path = pathNumber
                        
            // draw for animations
            shapeLayerArray[5].strokeEnd = strokeEnd
            shapeLayerArray[5].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 5 NUM (1)")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else if shapeLayerNum == 6 {
            mouth.alpha = 0.0
            var center = numberCenter
            center.y = numberCenter.y - 40
            startCenter = CGPoint(x: center.x - 70, y: center.y + 20)
            endCenter = CGPoint(x: center.x + 40, y: center.y + 20)
            
            pathNumber.move(to: startCenter)
            
            for index in stride(from: 1.1, to: 108.9, by: 1.1) {
                           
                let x = startCenter.x + index.cgFloat()
                let y = startCenter.y
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            pathNumber.addLine(to: endCenter)
            
            shapeLayerArray[6].fillColor = UIColor.clear.cgColor
            shapeLayerArray[6].strokeColor = strokeColor
            shapeLayerArray[6].lineWidth = lineWidth
            shapeLayerArray[6].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[6].path = pathNumber
                        
            // draw for animations
            shapeLayerArray[6].strokeEnd = strokeEnd
            shapeLayerArray[6].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 5 NUM (2)")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else
        
        // MARK:- NUMBER 6
        
        if shapeLayerNum == 7 {
            
            var center = numberCenter
            center.y = numberCenter.y - 40
            startCenter = CGPoint(x: center.x - 30, y: center.y + 20)
            
            let centerCircle = CGPoint(x: center.x-20,
                                       y: center.y+25)
            let radiusDownCircle = 70.0
            
            let centerCircleDown = CGPoint(x: centerCircle.x,
                                           y: centerCircle.y + (75 + radiusDownCircle.cgFloat()))
            let angleCirRadians = -85.0 * Double.pi / 180
            
            pathNumber.move(to: startCenter)
            
            for index in stride(from: 4.48, to: 112, by: 4.48) {
                           
                let x = startCenter.x - index.cgFloat()/2.28
                let y = startCenter.y + index.cgFloat()
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            for index in stride(from: -210.0, to: 85.0, by: 3.9) {
                
                let angleRadians = -(index * Double.pi / 180)
                let x = Double(centerCircleDown.x) + radiusDownCircle * cos(angleRadians)
                let y = Double(centerCircleDown.y) + radiusDownCircle * sin(angleRadians)
                
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            endCenter = CGPoint(x: Double(centerCircleDown.x) + radiusDownCircle * cos(angleCirRadians),
                                y: Double(centerCircleDown.y) + radiusDownCircle * sin(angleCirRadians))
            
            shapeLayerArray[7].fillColor = UIColor.clear.cgColor
            shapeLayerArray[7].strokeColor = strokeColor
            shapeLayerArray[7].lineWidth = lineWidth
            shapeLayerArray[7].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[7].path = pathNumber
                        
            // draw for animations
            shapeLayerArray[7].strokeEnd = strokeEnd
            shapeLayerArray[7].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 6")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else
        
        // MARK:- NUMBER 7
        
        if shapeLayerNum == 8 {
            
            var center = numberCenter
            center.y = numberCenter.y - 40
            startCenter = CGPoint(x: center.x - 80, y: center.y + 20)
            eargPoint = CGPoint(x: center.x + 50, y: center.y + 20)
            endCenter = CGPoint(x: center.x - 50, y: center.y + 240)
            
            pathNumber.move(to: startCenter)
            
            for index in stride(from: 3.7, to: 126.3, by: 3.7) {
                           
                let x = startCenter.x + index.cgFloat()
                let y = startCenter.y
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            pathNumber.addLine(to: eargPoint)
            
            for index in stride(from: 3.48, to: 216.62, by: 3.48) {
                           
                let x = eargPoint.x - index.cgFloat()/2.2
                let y = eargPoint.y + index.cgFloat()
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            pathNumber.addLine(to: endCenter)
            
            shapeLayerArray[8].fillColor = UIColor.clear.cgColor
            shapeLayerArray[8].strokeColor = strokeColor
            shapeLayerArray[8].lineWidth = lineWidth
            shapeLayerArray[8].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[8].lineJoin = CAShapeLayerLineJoin.round
            shapeLayerArray[8].path = pathNumber
                        
            // draw for animations
            shapeLayerArray[8].strokeEnd = strokeEnd
            shapeLayerArray[8].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 7")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else
        
        // MARK:- NUMBER 8
        
        if shapeLayerNum == 9 {
                        
            let centerCircle = CGPoint(x: numberCenter.x,
                                   y: numberCenter.y+25)
                        
            let radiusUpperCircle = 45.0
            let radiusDownCircle = 65.0
                        
            let centerCircleDown = CGPoint(x: centerCircle.x,
                                           y: centerCircle.y + (radiusUpperCircle.cgFloat() + radiusDownCircle.cgFloat()))
                        
            let angleRadiansStart = 300 * Double.pi / 180
            let startX = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadiansStart)
            let startY = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadiansStart)
                        
            startCenter = CGPoint(x: startX, y: startY)
                        
            pathNumber.move(to: startCenter)
                        
            for index in stride(from: -300.0, to: -90.0, by: 6.55) {
                            
                let angleRadians = -(index * Double.pi / 180)
                let x = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadians)
                let y = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadians)
                            
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
                        
            for index in stride(from: -90.0, to: 270.0, by: 6.55) {
                            
                let angleRadians = index * Double.pi / 180
                let x = Double(centerCircleDown.x) + radiusDownCircle * cos(angleRadians)
                let y = Double(centerCircleDown.y) + radiusDownCircle * sin(angleRadians)
                            
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            for index in stride(from: 270.0, to: 350.0, by: 6.5) {
                            
                let angleRadians = -(index * Double.pi / 180)
                let x = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadians)
                let y = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadians)
                            
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            let angleCirRadians = -350.0 * Double.pi / 180
            endCenter = CGPoint(x: Double(centerCircle.x) + radiusUpperCircle * cos(angleCirRadians),
                                y: Double(centerCircle.y) + radiusUpperCircle * sin(angleCirRadians))
                        
            shapeLayerArray[9].fillColor = UIColor.clear.cgColor
            shapeLayerArray[9].strokeColor = strokeColor
            shapeLayerArray[9].lineWidth = lineWidth
            shapeLayerArray[9].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[9].path = pathNumber
                                    
            // draw for animations
            shapeLayerArray[9].strokeEnd = strokeEnd
            shapeLayerArray[9].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 8")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else
               
        // MARK:- NUMBER 9
               
        if shapeLayerNum == 10 {
            
            let center = numberCenter
                        
            let centerCircle = CGPoint(x: numberCenter.x-15,
                                       y: numberCenter.y+55)
                        
            let radiusUpperCircle = 55.0
                        
            let angleRadiansStart = 300 * Double.pi / 180
            let startX = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadiansStart)
            let startY = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadiansStart)
                        
            startCenter = CGPoint(x: startX, y: startY)
            endCenter = CGPoint(x: center.x - 10, y: center.y + 220)
                        
            pathNumber.move(to: startCenter)
                        
            for index in stride(from: -300.0, to: -25.0, by: 5) {
                            
                let angleRadians = -(index * Double.pi / 180)
                let x = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadians)
                let y = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadians)
                            
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            let angleRadiansEndCirle = 25 * Double.pi / 180
            let endCircleX = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadiansEndCirle)
            let endCircleY = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadiansEndCirle)
            let endCircle = CGPoint(x: endCircleX, y: endCircleY)
            
            for index in stride(from: 4.2, to: 15, by: 4.2) {
                           
                let x = endCircle.x + index.cgFloat()/3.5
                let y = endCircle.y - index.cgFloat()
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            pathNumber.addLine(to: CGPoint(x: center.x + 59, y: center.y + 30))
            
            for index in stride(from: 19.2, to: 190, by: 4.2) {
                           
                let x = center.x + 59 - index.cgFloat()/2.7
                let y = center.y + 30 + index.cgFloat()
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            pathNumber.addLine(to: endCenter)
            
            shapeLayerArray[10].fillColor = UIColor.clear.cgColor
            shapeLayerArray[10].strokeColor = strokeColor
            shapeLayerArray[10].lineWidth = lineWidth
            shapeLayerArray[10].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[10].lineJoin = CAShapeLayerLineJoin.round
            shapeLayerArray[10].path = pathNumber
                                    
            // draw for animations
            shapeLayerArray[10].strokeEnd = strokeEnd
            shapeLayerArray[10].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 9")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
                   
        } else
               
        // MARK:- NUMBER 10
               
        if shapeLayerNum == 11 {
                        
            let centerCircle = CGPoint(x: numberCenter.x+40,
                                       y: numberCenter.y+70)
                        
            let radiusUpperCircle = 65.0
                        
            let angleRadiansStart = -50.0 * Double.pi / 180
            let startX = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadiansStart)
            let startY = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadiansStart)
                        
            startCenter = CGPoint(x: startX, y: startY)
            endCenter = CGPoint(x: centerCircle.x + 65, y: centerCircle.y)
                        
            pathNumber.move(to: startCenter)
                        
            for index in stride(from: 50.0, to: 180.0, by: 4.48) {
                            
                let angleRadians = -(index * Double.pi / 180)
                let x = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadians)
                let y = Double(centerCircle.y) + radiusUpperCircle * sin(angleRadians)
                            
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            for index in stride(from: 5, to: 75, by: 5) {
                           
                let x = centerCircle.x - 65
                let y = centerCircle.y + index.cgFloat()
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            pathNumber.addLine(to: CGPoint(x: centerCircle.x - 65, y: centerCircle.y + 75))
            
            for index in stride(from: -180.0, to: 0.0, by: 3) {
                            
                let angleRadians = -(index * Double.pi / 180)
                let x = Double(centerCircle.x) + radiusUpperCircle * cos(angleRadians)
                let y = Double(centerCircle.y+75) + radiusUpperCircle * sin(angleRadians)
                            
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            for index in stride(from: 5, to: 75, by: 5) {
                           
                let x = centerCircle.x + 65
                let y = centerCircle.y + 75 - index.cgFloat()
                           
                pathNumber.addLine(to: CGPoint(x: x, y: y))
            }
            
            pathNumber.addLine(to: endCenter)
            
            shapeLayerArray[11].fillColor = UIColor.clear.cgColor
            shapeLayerArray[11].strokeColor = strokeColor
            shapeLayerArray[11].lineWidth = lineWidth
            shapeLayerArray[11].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[11].path = pathNumber
                                    
            // draw for animations
            shapeLayerArray[11].strokeEnd = strokeEnd
            shapeLayerArray[11].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 0")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        } else
            
        if shapeLayerNum == 12 {
            
            var center = numberCenter
            center.x = numberCenter.x-90
            center.y = numberCenter.y+30
            startCenter = CGPoint(x: center.x - 50, y: center.y - 10)
            let eargPoint = CGPoint(x: center.x, y: center.y - 40)
            endCenter = CGPoint(x: center.x, y: center.y + 180)
            
            pathNumber.move(to: startCenter)
            
            for index in stride(from: 1.25, to: 25, by: 1.25) {
                let point = CGPoint(x: startCenter.x + index.cgFloat(),
                                    y: startCenter.y - index.cgFloat()/5*3)
                pathNumber.addLine(to: point)
            }
            pathNumber.addLine(to: eargPoint)
            for index in stride(from: 2.0, to: 195, by: 2.0) {
                let point = CGPoint(x: center.x,
                                    y: center.y - 15 + index.cgFloat())
                pathNumber.addLine(to: point)
            }
            pathNumber.addLine(to: endCenter)
            
            shapeLayerArray[12].fillColor = UIColor.clear.cgColor
            shapeLayerArray[12].strokeColor = strokeColor
            shapeLayerArray[12].lineWidth = lineWidth
            shapeLayerArray[12].lineCap = CAShapeLayerLineCap.round
            shapeLayerArray[12].lineJoin = CAShapeLayerLineJoin.round
            shapeLayerArray[12].path = pathNumber
            
            // draw for animations
            shapeLayerArray[12].strokeEnd = strokeEnd
            shapeLayerArray[12].opacity = 1.0
            print("\n")
            print("////////////")
            print("Path Point 1")
            print(pathNumber.getPathElementsPoints().count)
            print("\n")
        }

        points = pathNumber.getPathElementsPoints()
        
        points.enumerated().forEach{
            let path = UIBezierPath()
            guard $0.offset+3 <= points.count else {return}
            
            path.cgPath = drawShapeSpaceBetwen(point: $0.element,
                                               to: points[$0.offset+1],
                                               toNext: points[$0.offset+2]).cgPath
            pathArray.append(path)
        }
        
        layer.addSublayer(shapeLayerArray[shapeLayerNum])
        
        bottleNeckView.center = startCenter
        addSubview(bottleNeckView)
        mouth.center = startCenter
        addSubview(mouth)
        sendSubviewToBack(mouth)
        sendSubviewToBack(bottleNeckView)
        candyImageView.center = endCenter
        addSubview(candyImageView)
    }
    var pointCounter = 0
    var offsetArray = [Int]()
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    func pointsPerpLine(from point: CGPoint, to nextPoint: CGPoint) -> [CGPoint] {
        
        var points = [CGPoint]()

        let angle = CGpointArcDetectAngle(touch: nextPoint,
                                          centerArc: point)
        var radians = CGFloat()
        if angle == 0 {
            radians = 0.0
        } else {
            radians = angle * CGFloat(Double.pi) / 180
        }
        let cosA = cos(radians)*35
        let sinA = sin(radians)*35
        let pointOne = CGPoint(x: point.x + cosA, y: point.y - sinA)
        let pointTwo = CGPoint(x: point.x - cosA, y: point.y + sinA)
        
        points.append(pointOne)
        points.append(pointTwo)
        
        return points
    }
    // + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    func drawShapeSpaceBetwen(point: CGPoint, to nextPoint: CGPoint, toNext nextTwisePoint: CGPoint) -> UIBezierPath {
        
        let path = UIBezierPath()
        
        let firstLine = pointsPerpLine(from: point, to: nextPoint)
        let nextLine = pointsPerpLine(from: nextPoint, to: nextTwisePoint)
        
        path.move(to: firstLine[0])
        path.addLine(to: firstLine[1])
        path.addLine(to: nextLine[1])
        path.addLine(to: nextLine[0])
        path.close()
        
        return path
    }
    
    // MARK:- TOUCH TOUGTH FUNC DRAW NUMBER
    func endToches(for sapeNum: Int, to point: CGPoint, delay: Double) {
        offsetArray.removeAll()
        animateStrokeToEnd(sapeNum: sapeNum,
                           strokeEnd: -0.01,
                           duration: 0.6,
                           delay: delay)
        animateCandyToMouth(duration: 0.6, delay: delay)
    }
    
    func endPointSwitch(sapeNum: Int, point: CGPoint) {
        switchEndDwawing = false
        let pointUPCorner = CGPoint(x: endCenter.x-30,
                                    y: endCenter.y-30)
        let pointDOWNCorner = CGPoint(x: endCenter.x+30,
                                      y: endCenter.y+30)
        // set up end point
        if (pointUPCorner.y...pointDOWNCorner.y) ~= point.y
        && (pointUPCorner.x...pointDOWNCorner.x) ~= point.x {
//            guard pointCounter >= offsetArray.count else {
//                shapeLayerArray[sapeNum].strokeEnd = 0.0
//                return
//            }
            shapeLayerArray[sapeNum].strokeEnd = 1.0
            animateStrokeToEnd(sapeNum: sapeNum,
                               strokeEnd: 1.00,
                               duration: 0.1,
                               delay: 0.0)
            switchEndDwawing = true
        } else {
            switchEndDwawing = false
        }
    }
    
    var strokePercentage = CGFloat()
    
    func moveToches(for sapeNum: Int, to point: CGPoint) {
        shapeLayerArray[sapeNum].strokeEnd = 0.0
        animateStrokeToEnd(sapeNum: sapeNum,
                               strokeEnd: -0.01,
                               duration: 1.2,
                               delay: 0.4)
        
            pathArray.enumerated().forEach{
                if pathArray[$0.offset].contains(point) {
                    if pointCounter <= $0.offset {
                        pointCounter += 1
                        offsetArray.append($0.offset)
                    }
                    strokePercentage = CGFloat(pointCounter+2)*0.01
                    print($0.offset)
                    print(strokePercentage)
                }
            }
        
            
            shapeLayerArray[sapeNum].strokeEnd = strokePercentage
        
        let pointUPCorner = CGPoint(x: endCenter.x-30,
                                            y: endCenter.y-30)
                let pointDOWNCorner = CGPoint(x: endCenter.x+30,
                                              y: endCenter.y+30)
                // set up end point
                if (pointUPCorner.y...pointDOWNCorner.y) ~= point.y
                && (pointUPCorner.x...pointDOWNCorner.x) ~= point.x {
                    guard CGFloat(pointCounter) >= shapeLayerArray[sapeNum].strokeEnd*90 else {
                        shapeLayerArray[sapeNum].strokeEnd = 0.0
                        return
                    }
                    shapeLayerArray[sapeNum].strokeEnd = 1.0
                }
//        }
    }
    
//    func StrokePercentage(full: CGFloat, current: CGFloat) -> CGFloat {
//        let percentage = current/full
//        return percentage
//    }
    
//    func pointLineDetectAngle(touch: CGPoint, start: CGPoint, end: CGPoint) -> Double {
//
//        let currentDistance = CGPointDistance(from: start, to: touch)
//        let fullDistance = CGPointDistance(from: start, to: end)
//        let attitude = Double(fullDistance/currentDistance)
//
//        return attitude
//    }
    
    func CGArcLength(with radius: CGFloat, startAngle:CGFloat, endAngle:CGFloat) -> CGFloat {
        
        let circumference = radius*2*CGFloat.pi
        let diffAngle = endAngle - startAngle
        let partArc = diffAngle/360
        let arcLength = circumference*partArc
        
//        print("\n*********")
//        print("ARC Length")
//        print("_circumference_")
//        print(circumference)
//        print("_diffAngle_")
//        print(diffAngle)
//        print("_arcLength_")
//        print(arcLength)
//        print("*********\n")

        return arcLength
    }
    
    func CGpointArcDetectAngle(touch: CGPoint, centerArc: CGPoint) -> CGFloat {
        
        let x = touch.x-centerArc.x
        let y = touch.y-centerArc.y
        var angle = CGFloat()
        let point = CGPoint(x: x, y: y)
        
        if point.y == 0 && x>0 {
            angle = 90
        } else if point.y == 0 && x<0 {
            angle = 270
        } else if point.x == 0 && y<0 {
            angle = 0
        } else if point.x == 0 && y>0 {
            angle = 180
        } else if point.x == 0 && y==0 {
            angle = 0
        } else {
//            if atan(point.y/point.x).isNaN {
//                print("ATAN _ _ NaN")
//            }
            let minAngle = atan(point.y/point.x) * 180 / CGFloat(Double.pi)
//            if minAngle.isNaN {
//                print("MIN ANGLE _ _ NaN")
//            }
            angle = 90 - minAngle
        }
        return angle
    }
    
//    func pointXDetect(touch: CGPoint, start: CGPoint, end: CGPoint) -> Double {
//
//        let currentDistance = touch.x - start.x
//        let fullDistance = end.x - start.x
//        let attitude = Double(currentDistance/fullDistance)
//
//        return attitude
//    }
//
//    func pointYDetect(touch: CGPoint, start: CGPoint, end: CGPoint) -> Double {
//
//        let currentDistance = touch.y - start.y
//        let fullDistance = end.y - start.y
//        let attitude = Double(currentDistance/fullDistance)
//
//        return attitude
////    }
//
//    func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
//        return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
//    }
//
//    func CGPointDistance(from: CGPoint, to: CGPoint) -> CGFloat {
//        return sqrt(CGPointDistanceSquared(from: from, to: to))
//    }
    
    func begunPointSwitch(sapeNum: Int, point: CGPoint) {
        pointCounter = 0
        switchEndDwawing = false
        let pointUPCorner = CGPoint(x: startCenter.x-30,
                                    y: startCenter.y-30)
        let pointDOWNCorner = CGPoint(x: startCenter.x+30,
                                      y: startCenter.y+30)
        // set up begun point
        if (pointUPCorner.y...pointDOWNCorner.y) ~= point.y
        && (pointUPCorner.x...pointDOWNCorner.x) ~= point.x {
            switchStartDwawing = true
            animateBigMouth()
        } else {
            switchStartDwawing = false
        }
        
        print("START DRW \(sapeNum+1)")
        print(switchStartDwawing)
    }
    
    func animateBigMouth() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.mouth.transform.tx = 0
            self.mouth.transform.ty = 0
            self.mouth.frame.size = CGSize(width: 100, height: 100)
            self.mouth.layer.cornerRadius = 50
        }) { (true) in
            UIView.animate(withDuration: 0.8, animations: {
                self.mouth.transform.tx = 10
                self.mouth.transform.ty = 10
                self.mouth.frame.size = CGSize(width: 80, height: 80)
                self.mouth.layer.cornerRadius = 40
            })
        }
    }
    
    func animateMouth() {
        
//        mouth.transform.ty = 40
//        mouth.transform.tx = -10
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.8, animations: {
                self.mouth.transform.ty = 20
                self.mouth.transform.tx = 0
            }) { (true) in
                UIView.animate(withDuration: 0.8, animations: {
                    self.mouth.transform.ty = 10
                    self.mouth.frame.size = CGSize(width: 80, height: 80)
                    self.mouth.layer.cornerRadius = 40
                }) { (true) in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.mouth.transform.tx = 10
                    }) { (true) in
                        
                    }
                }
            }
        }
    }
    
    func animateSecsessNumberDraw(sapeNum: Int, delay: Double) {
        
        candyImageView.animateOpacity(duration: 0.2, delay: delay + 1.4, key: "upscandy")
        bottleNeckView.animateOpacity(duration: 0.2, delay: delay + 0.6, key: "upsbottel")
        UIView.animate(withDuration: 0.6,
                       delay: delay + 1.8,
                       options: .curveEaseIn,
                       animations: {
                        self.mouth.frame.size = self.mouth.mouthSize
                        self.mouth.layer.cornerRadius = self.mouth.mouthCorner
                        if sapeNum == 12 {
                            self.mouth.transform.ty = 0
                        } else {
                            self.mouth.transform.ty = 120
                        }
                        self.mouth.center.x = self.center.x
        }) { (true) in
            UIView.animate(withDuration: 0.6, delay: 0.8, animations: {
                self.mouth.frame.size.width = self.mouth.mouthSize.width + 20
                self.mouth.frame.size.height = self.mouth.mouthSize.height + 30
                self.mouth.layer.cornerRadius = self.mouth.mouthCorner + 10
                if sapeNum == 12 {
                    self.mouth.transform.ty = -15
                } else {
                    self.mouth.transform.ty = 105
                }
                self.mouth.transform.tx = -40
            }) { (true) in
                UIView.animate(withDuration: 0.4, animations: {
                    self.mouth.frame.size.width = self.mouth.mouthSize.width
                    self.mouth.frame.size.height = self.mouth.mouthSize.height
                    self.mouth.layer.cornerRadius = self.mouth.mouthCorner
                    if sapeNum == 12 {
                        self.mouth.transform.ty = 0
                    } else {
                        self.mouth.transform.ty = 120
                    }
                    self.mouth.transform.tx = 0
                })
            }
        }
    }
    
    func animateCandyToMouth(duration: CFTimeInterval, delay: Double) {
        let keyFrameAnimation = CAKeyframeAnimation(keyPath:"position")
        keyFrameAnimation.path = pathNumber.reversedMutable()
        keyFrameAnimation.duration = duration
        keyFrameAnimation.beginTime = CACurrentMediaTime() + delay
        keyFrameAnimation.fillMode = CAMediaTimingFillMode.forwards
        keyFrameAnimation.isRemovedOnCompletion = false
        self.candyImageView.layer.add(keyFrameAnimation, forKey: "animation")
    }
    
    func animateStrokeToEnd(sapeNum: Int, strokeEnd: CGFloat = 0, duration: CFTimeInterval, delay: Double) {
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = strokeEnd
        basicAnimation.duration = duration
        basicAnimation.beginTime = CACurrentMediaTime() + delay
        
        // stay stroke after animate
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayerArray[sapeNum].add(basicAnimation, forKey: "urSoBasicBackwards")
    }
}
