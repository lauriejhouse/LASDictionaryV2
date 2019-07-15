//
//  VideoLauncher.swift
//  LASDictionaryV2
//
//  Created by Jackie on 5/29/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class VideoLauncher: NSObject {
    
    func showVideoPlayer() {
        print("Showing Video player animation...")
        
        //this is the container that holds everything insde the application.
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.red
            keyWindow.addSubview(view)
        }

    }

}
