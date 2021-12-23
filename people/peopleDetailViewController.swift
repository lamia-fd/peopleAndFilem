//
//  peopleDetailViewController.swift
//  people
//
//  Created by لمياء فالح الدوسري on 19/05/1443 AH.
//

import UIKit

class peopleDetailViewController: UIViewController {
    
    var mass:String = ""
    var birth:String = ""
    var gender:String = ""

    @IBOutlet weak var massLable: UILabel!
    @IBOutlet weak var birthLable: UILabel!
    @IBOutlet weak var genderLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        massLable.text = mass
        birthLable.text = birth
        genderLable.text = gender
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
