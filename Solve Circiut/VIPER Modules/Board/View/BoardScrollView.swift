//
//  BoardScrollView.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 9.11.21.
//

import UIKit

class BoardScrollView: UIScrollView, UIScrollViewDelegate {

    var zoomView = UIView()

    lazy var zoomingTap: UITapGestureRecognizer = {
        let zoomingTap = UITapGestureRecognizer(target: self, action: #selector(handleZoomingTap))
        zoomingTap.numberOfTapsRequired = 2
        return zoomingTap
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview(view: UIView) {
        
        zoomView.removeFromSuperview()
        zoomView = view
        self.addSubview(zoomView)
        configurateFor(viewSize: view.bounds.size)
        
    }
    
    func configurateFor(viewSize: CGSize) {
        self.contentSize = viewSize
        
        self.minimumZoomScale = 1
        self.maximumZoomScale = 2
        self.zoomScale = minimumZoomScale
        
        self.zoomView.addGestureRecognizer(self.zoomingTap)
        self.zoomView.isUserInteractionEnabled = true

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.centerImage()
    }
    
    func centerImage() {
        let boundsSize = self.bounds.size
        var frameToCenter = zoomView.frame
        
        if frameToCenter.size.width < boundsSize.width {
            frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2
        } else {
            frameToCenter.origin.x = 0
        }
        
        if frameToCenter.size.height < boundsSize.height {
            frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2
        } else {
            frameToCenter.origin.y = 0
        }
        
        zoomView.frame = frameToCenter
    }
    
    // gesture
    @objc func handleZoomingTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: sender.view)
        self.zoom(point: location, animated: true)
    }
    
    func zoom(point: CGPoint, animated: Bool) {
        let currectScale = self.zoomScale
        let minScale = self.minimumZoomScale
        let maxScale = self.maximumZoomScale
        
        if (minScale == maxScale && minScale > 1) {
            return
        }
        
        let toScale = maxScale
        let finalScale = (currectScale == minScale) ? toScale : minScale
        let zoomRect = self.zoomRect(scale: finalScale, center: point)
        self.zoom(to: zoomRect, animated: animated)
    }
    
    func zoomRect(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        let bounds = self.bounds
        
        zoomRect.size.width = bounds.size.width / scale
        zoomRect.size.height = bounds.size.height / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2)
        return zoomRect
    }
    
    // MARK: - UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.zoomView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.centerImage()
    }
    
}

// functions not related to scaling
extension BoardScrollView {
    
    func getCurrentZoomValue() -> CGFloat {
        print(zoomView.frame.width / zoomView.bounds.width)
        return zoomView.frame.width / zoomView.bounds.width
    }
    
}

