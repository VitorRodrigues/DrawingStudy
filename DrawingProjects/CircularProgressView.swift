//
//  CircularProgressView.swift
//  DrawingProjects
//
//  Created by Vitor Rodrigues on 06/06/2018.
//  Copyright © 2018 Vitor Rodrigues. All rights reserved.
//

import UIKit

@IBDesignable
class CircularProgressView: UIView {

    private var progressLayer: CircleProgressLayer!
    private var trackLayer: CircleProgressLayer!
    
    @IBInspectable
    var progressLineWidth: CGFloat = 4 {
        didSet {
            progressLayer.lineThickness = progressLineWidth
            trackLayer.lineThickness = progressLineWidth
        }
    }
    
    @IBInspectable
    var trackColor: UIColor? = nil {
        didSet {
            trackLayer.strokeColor =  trackColor?.cgColor
        }
    }
    
    @IBInspectable
    var progress: CGFloat = 0.0 {
        didSet {
            progressLayer.set(progress: progress)
        }
    }
    
    var animationDuration: TimeInterval = 3.0 {
        didSet {
            progressLayer.animationDuration = animationDuration
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildLayers()
    }
    
    private func buildLayers() {
        progressLayer = CircleProgressLayer(color: tintColor, bounds: bounds)
        progressLayer.animationDuration = animationDuration
        progressLayer.strokeEnd = 0.0
        trackLayer = CircleProgressLayer(color: trackColor ?? tintColor.withAlphaComponent(0.3), bounds: bounds)
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        progressLayer.bounds = bounds
        trackLayer.bounds = bounds
    }
    override func tintColorDidChange() {
        progressLayer.strokeColor = tintColor.cgColor
    }
}
