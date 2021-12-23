//
//  ViewController.swift
//  people
//
//  Created by لمياء فالح الدوسري on 18/05/1443 AH.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
  
    
    let url = URL(string: "https://swapi.dev/api/people/?format=json")
    
    @IBOutlet weak var tableView: UITableView!
//let url2 = URL(string: "https://api.opendota.com/api/heroStats")

    var pepleArray:[String]=[]
   // var peoples=[people]()
   // var hero=[HeroStats]()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        APIreq2{
            print("works")
            
            self.tableView.reloadData()

        }
      
       
    }
    
   
    
    func APIreq2(completed: @escaping () ->()){
        URLSession.shared.dataTask(with: url!){
            (data,respone, error) in
            if error == nil{
                do{
               let re:people = try JSONDecoder().decode(people.self, from: data!)
                    print("ooooooooooooooo")
                    print(re.next)
                    print(re.results[0].name)
                    print(re.results[0].height)
                    print("ooooooooooooooo")
//                    for re in re{
//                    pepleArray.append(re.results[0].name)
//
//                    }
                    for i in 0..<re.results.count {
                        self.pepleArray.append(re.results[i].name)
                        
                        print("\(self.pepleArray)")

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
        return pepleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pepleArray[indexPath.row]
        return cell
    }
    
    
    
}



struct people:Decodable{
    
    let results:[name]
   // let name:String
    let next :String
    
    
}
struct name:Decodable{
    let name :String
    let  height:String

}



