//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Hüseyin Kaya on 22.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
// aşağıdaki iki fonksiyonları çağırmamız gerekiyor. tableView'da bunlar şart
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()//image dizisi
    var landmarkInformation = [String]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    var chosenLandmarkInformation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self //viewcontroller'a ulaşmak için
        tableView.dataSource = self //bunları yapmamız gerekiyor
        
        // Landmark Book Data
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
         
        landmarkImages.append(UIImage(named: "colloseum")!)
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "stonehenge")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)
        
        
        landmarkInformation.append("The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy. It is the largest ancient amphitheatre ever built. Construction began under the emperor Vespasian and was completed under Titus")
        landmarkInformation.append("The Great Wall of China is a series of fortifications that were built acrpss the historical northern borders of ancient Chinese states and Imperial China as protection against various nomadic groups from the Eurasian Steppe.")
        landmarkInformation.append("The Kremlin is fortified complex in the center of Moscow founded by the Rurikids ruling dynasty. It is the best known of the kremlins, and includes five palaces, four cathedrals, and the enclosing Kremlin Wall with Kremlin Towers.")
        landmarkInformation.append("Stonehenge is a prehistoric monument on Salisbury Plain in Wittshire, England. It consists of an outer ring of vertical sarsen standing stones, each around 4.0 meter high, 2.1 meter wide and weighing around 25 tons.")
        landmarkInformation.append("The Taj Mahal is an ivory-white marble mausoleum on the right bank of the river Yamuna in the Indian city of Agra. It was commissioned in 1632 by the Mughal emperor Shah Jahan to house the tomb his favourite wife.")
        
        navigationItem.title = "Landmark Book" //title
        
    }
    //tableView commit'de çıkıyor
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row) // silinecek row
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)//animasyon seçiliyor
            
        }
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row] //O sırada dizinin hangi indexindeyse onu verecek
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //didselect
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row] //nereye tıklarsam onu getir ve bu değişkenlere eşitle
        chosenLandmarkInformation = landmarkInformation[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" { //kontrol etmek önemli
            let destinationVC = segue.destination as! imageViewController //as!: bunu tanımla ve imageviewcontroller'a cast et
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage //buradan değiştirebiliyoruz.
            destinationVC.selectedInformationLabel = chosenLandmarkInformation
        }
    } //segue için
    
    
    
}

