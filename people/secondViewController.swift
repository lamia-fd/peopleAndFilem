//
//  secondViewController.swift
//  people
//
//  Created by لمياء فالح الدوسري on 19/05/1443 AH.
//

import UIKit

class secondViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{


    
    @IBOutlet weak var tableView2: UITableView!
    let url = URL(string: "https://swapi.dev/api/films/?format=json")
    
    var filemsArray:[String]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIreq2{
            print("hiiii")
            
            self.tableView2.reloadData()

        }

        // Do any additional setup after loading the view.
    }
    
    func APIreq2(completed: @escaping () ->()){
        URLSession.shared.dataTask(with: url!){
            (data,respone, error) in
            if error == nil{
                do{
               let re:filems = try JSONDecoder().decode(filems.self, from: data!)
                    print("ooooooooooooooo")
                   // print(re.next)
                   // print(re.results[0].name)
                    print(re.results[0].title)
                    print("ooooooooooooooo")
//                    for re in re{
//                    pepleArray.append(re.results[0].name)
//
//                    }
                    for i in 0..<re.results.count {
                        self.filemsArray.append(re.results[i].title)
                        
                        print("\(self.filemsArray)")

                    }
                        
                        
                    
                    
                    
                    DispatchQueue.main.sync {
                        completed()
                    }
                    
                }catch{
                    print("json error")
                }
            }
        }.resume()
        
        
        
        
    }
    
    
    
    
   
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filemsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = filemsArray[indexPath.row]
        return cell
    }
    

}

struct filems:Decodable{
let results:[filem]
    
}
struct filem:Decodable{
let title:String
}
