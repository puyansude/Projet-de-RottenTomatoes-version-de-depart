//
//  ViewController.swift
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
//  Version de départ - À placer sur github - en cours ... 123


import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionDeFilms:UICollectionView!
    @IBOutlet weak var progression:UIActivityIndicatorView!
    @IBOutlet weak var ViewVideos:UICollectionView!
    @IBOutlet weak var nbResultat:UILabel!
    
    // ***  Les constantes de la classe
    let NB_FILMS = "10"
    let CLE_API  = Cle().CLE_API

    // *** Les propriétés de la classe
    var tableauDesFilms = NSDictionary()
    
    // *** Les méthodes de la classe
    // *************************************************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rechercherFilms("Star")
        
    } // viewDidLoad

    // *************************************************************************************************
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        println("didReceiveMemoryWarning")
    } // didReceiveMemoryWarning

    
    // Passer les info à la scène de détail
    // *************************************************************************************************
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as! DetailFilmViewController

        // Passer les informations de la sélection courante à la scène de détail
        // À compléter...    
    
    } // // Passer les info à la scène de détail
    
    
    /// *****************************
    /// Les méthodes de protocoles:
    /// delegate et dataSource
    
    
    // *************************************************************************************************
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10  // Temporaire, à corriger 
    } // numberOfItemsInSection
    
    // *************************************************************************************************
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    // *******************************************************
    {
         var celluleCourante = collectionView.dequeueReusableCellWithReuseIdentifier("modeleCellule", forIndexPath: indexPath) as! CelluleRotten

        /// *** Temporaire: À effacer!
        celluleCourante.titre!.text = "Cellule no: \(indexPath.row)"
        
        // Cette opération est très bloquante!!!
        // Charger une image à partir du web
        // À compléter ...
        
        // Renseigner le titre du film
        // À compléter ...
        
        return celluleCourante;
    } // cellForItemAtIndexPath


    // *************************************************************************************************
    func rechercherFilms(film:String) -> Bool {
        println("rechercherFilms: \(film)")
   
        // progression.startAnimating()
        
        /* *********************************
        À compléter ....
        ********************************* */
        
        return true
    } // rechercherFilms
    

    // *************************************************************************************************
    func textFieldDidBeginEditing(textField: UITextField) {
        println("textFieldDidBeginEditing")
        progression.startAnimating()
    }  // textFieldDidBeginEditing
    

    // *************************************************************************************************
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("textFieldShouldReturn")
       
        /* *********************************
        À compléter ....
        ********************************* */
        
        
        //----------------------------------
        textField.resignFirstResponder()
        progression.stopAnimating()
        return true
    } // textFieldShouldReturn
  
    
}  // Fin de la classe ViewController

