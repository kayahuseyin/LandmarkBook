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
    var landmarkImages = [UIImage]() //image dizisi
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self //viewcontroller'a ulaşmak için
        tableView.dataSource = self //bunları yapmamız gerekiyor
        
        // Landmark Book Data
        landmarkNames.append("Colloseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
         
        landmarkImages.append(UIImage(named: "colloseum")!)
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "stonehenge")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)
        
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
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" { //kontrol etmek önemli
            let destinationVC = segue.destination as! imageViewController //as!: bunu tanımla ve imageviewcontroller'a cast et
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage //buradan değiştirebiliyoruz.
        }
    } //segue için
    
    
    
}

