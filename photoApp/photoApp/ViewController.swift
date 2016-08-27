//
//  ViewController.swift
//  photoApp
//
//  Created by ifsp on 26/08/16.
//  Copyright © 2016 com.ifsp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(sender: AnyObject) {
        // create image to filter
        let inputImage = CIImage(image: photoImageView.image!)
        
        // create a random color to pass to filter
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314))/100)]
        
        // aplly filter
        let filteredImage = inputImage?.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
    
        // render the filtered image
        let renderedImage = context.createCGImage(filteredImage!, fromRect: filteredImage!.extent)
        
        // reflect the change back in the interface
        photoImageView.image = UIImage(CGImage: renderedImage)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

