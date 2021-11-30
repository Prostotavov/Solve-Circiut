//
//  ImageScrollView.swift
//  ScrollingApp
//
//  Created by Алексей Пархоменко on 30/09/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

class BoardScrollView: UIScrollView, UIScrollViewDelegate {

    var zoomView = UIView()
    
    var zoomValue: CGFloat = 2.5

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
    
    func setBoardView(view: UIView) {
        
        zoomView.removeFromSuperview()
        zoomView = view
        self.addSubview(zoomView)
        configurateFor(viewSize: view.bounds.size)
        
    }
    
    func configurateFor(imageSize: CGSize) {
        self.contentSize = imageSize
        
        setCurrentMaxandMinZoomScale()
        self.zoomScale = self.minimumZoomScale
        
        self.zoomView.addGestureRecognizer(self.zoomingTap)
        self.zoomView.isUserInteractionEnabled = true

    }
    
    func configurateFor(viewSize: CGSize) {
        self.contentSize = viewSize
        
        setCurrentMaxandMinZoomScale()
        self.zoomScale = self.minimumZoomScale
        
        self.zoomView.addGestureRecognizer(self.zoomingTap)
        self.zoomView.isUserInteractionEnabled = true

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.centerImage()
    }
    
    
    func setCurrentMaxandMinZoomScale() {
        let boundsSize = self.bounds.size
        let imageSize = zoomView.bounds.size
        
        let xScale = boundsSize.width / imageSize.width
        let yScale = boundsSize.height / imageSize.height
        let minScale = min(xScale, yScale)
        
        var maxScale: CGFloat = 1.0 * zoomValue
        if minScale < 0.1 * zoomValue {
            maxScale = 0.3 * zoomValue
        }
        if minScale >= 0.1 * zoomValue && minScale < 0.5 * zoomValue {
            maxScale = 0.7 * zoomValue
        }
        if minScale >= 0.5 * zoomValue {
            maxScale = max(1.0 * zoomValue, minScale)
        }
        
        self.minimumZoomScale = minScale
        self.maximumZoomScale = maxScale
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
