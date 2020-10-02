//
//  ImageView.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 9/30/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class SLImageView: UIImageView {
    
    fileprivate let imageTag = 35012
    var fullscreenImageView: UIImageView!
    var closeLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    @objc func setup() {
        self.isUserInteractionEnabled = true
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(showFullscreen))
        self.addGestureRecognizer(touchGesture)
    }
    
    @objc func createFullscreenPhoto() -> UIImageView {

        let tmpImageView = UIImageView(frame: self.frame)
        tmpImageView.image = self.image
        tmpImageView.contentMode = UIView.ContentMode.scaleAspectFit
        tmpImageView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        tmpImageView.tag = imageTag
        tmpImageView.alpha = 0.0
        tmpImageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideFullscreen))
        tmpImageView.addGestureRecognizer(tap)
        
        return tmpImageView
    }
    
    fileprivate func createLabel() -> UILabel {
        
        let label = UILabel(frame: CGRect.zero)
        label.text = "Touch to hide"
        label.font = UIFont(name: "HelveticaNeue", size: 12.0)
        label.sizeToFit()
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor(white: 0.85, alpha: 1)
        label.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        label.alpha = 0.0
        
        return label
    }
    
     @objc func showFullscreen() {
        
        let window = UIApplication.shared.windows.first!
        if window.viewWithTag(imageTag) == nil {
            
            self.fullscreenImageView = createFullscreenPhoto()
            self.closeLabel = createLabel()
           
            let labelWidth = window.frame.size.width
            let labelHeight = closeLabel.frame.size.height + 16
            self.closeLabel.frame =  CGRect.init(x: 0, y: window.frame.size.height - labelHeight, width: labelWidth, height: labelHeight)
            self.fullscreenImageView.addSubview(closeLabel)
            
            window.addSubview(self.fullscreenImageView)
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut, animations: {
                
                self.fullscreenImageView.frame = window.frame
                self.fullscreenImageView.alpha = 1
                self.fullscreenImageView.layoutSubviews()
                
                self.closeLabel.alpha = 1
                }, completion: { _ in
            })
        }
    }
    
    @objc func hideFullscreen() {
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut, animations: {
            
            self.fullscreenImageView?.frame = self.frame
            self.fullscreenImageView?.alpha = 0
       
        }, completion: { finished in
            
            self.fullscreenImageView?.removeFromSuperview()
            self.fullscreenImageView = nil
        })
    }

}


//class GSSimpleImageView: UIImageView {
//
//    var bgView: UIView!
//
//    var animated: Bool = true
//
//    //MARK: Life cycle
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.addTapGesture()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.addTapGesture()
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    //MARK: Private methods
//    func addTapGesture() {
//        let tap = UITapGestureRecognizer(target: self, action: Selector(("fullScreenMe")))
//        self.addGestureRecognizer(tap)
//        self.isUserInteractionEnabled = true
//    }
//    //MARK: Actions of Gestures
//    func exitFullScreen () {
//        bgView.removeFromSuperview()
//    }
//
//    func fullScreenMe() {
//
//        if let window = UIApplication.shared.delegate?.window {
//            bgView = UIView(frame: UIScreen.main.bounds)
//            bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector(("exitFullScreen"))))
//            bgView.backgroundColor = UIColor.black
//            let imageV = UIImageView(image: self.image)
//            imageV.frame = bgView.frame
//            imageV.contentMode = .scaleAspectFit
//            self.bgView.addSubview(imageV)
//            window?.addSubview(bgView)
//
//            if animated {
//                var sx:CGFloat=0, sy:CGFloat=0
//                if self.frame.size.width > self.frame.size.height {
//                    sx = self.frame.size.width/imageV.frame.size.width
//                    imageV.transform = CGAffineTransform(scaleX: sx, y: sx)
//                }else{
//                    sy = self.frame.size.height/imageV.frame.size.height
//                    imageV.transform = CGAffineTransform(scaleX: sy, y: sy)
//                }
//                UIView.animate(withDuration: 0.5, animations: { () -> Void in
//                    imageV.transform = CGAffineTransform(scaleX: 1, y: 1)
//                })
//            }
//        }
//    }
//
//}
