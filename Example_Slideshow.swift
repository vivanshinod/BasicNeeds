//
//  ViewController.swift
//  Test 2
//
//  Created by Vivan on 25/06/24.
//

import UIKit
import ImageSlideshow

class ViewController: UIViewController {
    
    @IBOutlet weak var vwSlide: ImageSlideshow!

    var arrSlideshow = ["https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","https://images.pexels.com/photos/3023479/pexels-photo-3023479.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","https://images.pexels.com/photos/1797171/pexels-photo-1797171.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","https://images.pexels.com/photos/94440/pexels-photo-94440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","https://images.pexels.com/photos/5410400/pexels-photo-5410400.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","https://images.pexels.com/photos/12737798/pexels-photo-12737798.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1","https://images.pexels.com/photos/7592548/pexels-photo-7592548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSliders()
    }

    func setSliders(){
        var inputSource: [InputSource] = []
        
        for image in arrSlideshow {
            if let url = URL(string: image){
                let source = SDWebImageSource(url: url, placeholder: UIImage(named: "placeholder"))
                inputSource.append(source)
            }
        }
        vwSlide.slideshowInterval = 4.0
        vwSlide.contentScaleMode = UIViewContentMode.scaleAspectFill
        vwSlide.setImageInputs(inputSource)
    }

}

