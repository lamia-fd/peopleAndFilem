//
//  filmsDetailsViewController.swift
//  people
//
//  Created by لمياء فالح الدوسري on 19/05/1443 AH.
//

import UIKit

class filmsDetailsViewController: UIViewController {
    var Director=""
    var ReleaseDate=""
    var OpeningCraw=""

    @IBOutlet weak var directorLable: UILabel!
    @IBOutlet weak var ReleasDateLable: UILabel!
    @IBOutlet weak var OpeningCrawLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        directorLable.text! += Director
        ReleasDateLable.text! += ReleaseDate
       OpeningCrawLable.text=OpeningCraw
    }
    

    
}
