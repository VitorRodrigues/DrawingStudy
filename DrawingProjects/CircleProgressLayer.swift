import UIKit

/**
 Layer that creates a circular shape within its bounds
 */
class CircleProgressLayer: CAShapeLayer {
    
    /// Duration for the animation when the the layer changes its progress
    var animationDuration: TimeInterval = 3.0
    
    /// Thickness of the progress outline
    var lineThickness: CGFloat = 4.0 {
        didSet {
            lineWidth = lineThickness
            updatePath()
        }
    }
    
    /// Offset of the lines
    var lineOffset: CGFloat = 0.0 {
        didSet {
            updatePath()
        }
    }
    
    public override var bounds: CGRect {
        didSet {
            updatePath()
        }
    }
    
    public init(color: UIColor, bounds: CGRect) {
        super.init()
        buildLayer(color: color, bounds: bounds)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updatePath()
    }
    
    public override init(layer: Any) {
        super.init(layer: layer)
    }
    
    func updatePath() {
        buildPath(inside: bounds)
    }
    
    func buildLayer(color: UIColor, bounds: CGRect) {
        self.bounds = bounds
        fillColor = UIColor.clear.cgColor
        lineWidth = 4
        lineCap = kCALineCapRound
        strokeEnd = 0.0
        strokeColor = color.cgColor
        updatePath()
    }
    
    private func buildPath(inside bounds: CGRect) {
        let maxDimension = min(frame.width, frame.height)
        let position = CGPoint(x:bounds.width/2, y:bounds.height/2)
        let radius = (maxDimension - lineWidth) / 2
        let bezierPath = UIBezierPath(arcCenter: position, radius: radius, startAngle: -(CGFloat.pi / 2), endAngle: -(CGFloat.pi / 2) + CGFloat.pi * 2, clockwise: true)
        path = bezierPath.cgPath
        self.position = position
    }
    
    func set(progress: CGFloat, animated: Bool = false) {
        if animated {
            animateProgress(to: progress)
        } else {
            strokeEnd = progress / 100
        }
    }
    
    private func animateProgress(to value: CGFloat) {
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.fromValue = strokeEnd
        anim.toValue = value / 100
        anim.duration = animationDuration
        anim.fillMode = kCAFillModeForwards
        anim.isRemovedOnCompletion = false
        add(anim, forKey: "progressAnimation")
    }
}
