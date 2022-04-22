//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by Hüseyin Kaya on 22.04.2022.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    var selectedInformationLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        informationLabel.text = selectedInformationLabel
    }
    
}
