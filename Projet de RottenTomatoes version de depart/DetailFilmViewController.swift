//
//  DetailFilmViewController.swift
//  Projet - RottenTomatoes version swift
//
//  Created by Alain on 2014-09-13.
//  Copyright (c) 2014 Alain. All rights reserved.
//
//  ============================================================================================
//  À l'usage exclusif des étudiants et étudiantes de
//  Techniques d'Intégration Multimédia
//  du cégep de Saint-Jérôme.
//  --------------------------------------------------------------------------------------------
//  Il est interdit de reproduire, en tout ou en partie, à des fins commerciales,
//  le code source, les scènes, les éléments graphiques, les classes et
//  tout autre contenu du présent projet sans l’autorisation écrite de l'auteur.
//
//  Pour obtenir l’autorisation de reproduire ou d’utiliser, en tout ou en partie,
//  le présent projet, veuillez communiquer avec:
//
//  Alain Boudreault, aboudrea@cstj.qc.ca
//
//  ============================================================================================


import UIKit

class DetailFilmViewController: UIViewController {

    var detailFilm:Dictionary<String, AnyObject>?
 
    @IBOutlet weak var     detailPochette: UIImageView!
    @IBOutlet weak var     detailPochetteDetailed: UIImageView!
    @IBOutlet weak var     detailPochetteProfile: UIImageView!
    @IBOutlet weak var     detailPochetteThumbnail: UIImageView!
   
    @IBOutlet weak var     synopsis:UITextView!
    @IBOutlet weak var     critiques:UITextView!
    @IBOutlet weak var     detailPersonnages:UITextView!

    @IBOutlet weak var     detailAnnee: UILabel!
    @IBOutlet weak var     detailClassement: UILabel!
    @IBOutlet weak var     detailDuree: UILabel!
    @IBOutlet weak var     detailAppPublic: UILabel!
    @IBOutlet weak var     detailPointPublic: UILabel!
    @IBOutlet weak var     detailPointCritique: UILabel!
    @IBOutlet weak var     detailSortieSalle: UILabel!
    @IBOutlet weak var     detailSortieDVD: UILabel!
    @IBOutlet weak var     detailTitre: UILabel!
    
     @IBAction func retourALaListe(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    } // retourALaListe
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        println("Sélection courante: \(detailFilm)")
        
        if let df = detailFilm {
        
        self.detailTitre.text       = df["title"] as? String
        
        // Tester l'année...
        if let temp = df["year"] as? Int {
            self.detailAnnee.text = temp.description
        }
        
        // Tester la durée
        if let temp = df["runtime"] as? Int {
            self.detailDuree.text = temp.description
        }
        
        // Utilisation d'un NSString pour avoir accès à la méthode NSString.rangeOfString()
        var urlImage = (df["posters"] as! Dictionary<String,NSString>)["original"]!
        // Patch ajoutée 2015.10.03 - rotten ne fournit plus de grosses images dans le feed jason
        let posDepart = urlImage.rangeOfString("dkpu1ddg7pbsk.cloudfront.net").location
        if posDepart != NSNotFound  {
            urlImage = "http://" + urlImage.substringWithRange(NSRange(location: posDepart, length: urlImage.length - posDepart))
        }
        
        self.detailPochette.image = UIImage(data:NSData(contentsOfURL: NSURL(string: urlImage as String)!, options: nil, error: nil)!)
        
        // Construire la liste des personnages et acteurs
        var personnages = ""
        } else
        {
            println("'detailFilm' est non définie")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // didReceiveMemoryWarning


}
