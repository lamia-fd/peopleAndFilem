//
//  ViewController.swift
//  people
//
//  Created by لمياء فالح الدوسري on 18/05/1443 AH.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
  
    
    ///let url = URL(string: "https://swapi.dev/api/people/?format=json")
    
    @IBOutlet weak var tableView: UITableView!


    var pepleArray:[String]=[]
    var massArray:[String]=[]
    var birthYear:[String]=[]
    var genderArray:[String]=[]
   // var peoples=[people]()
   // var hero=[HeroStats]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getThePeople.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                    data, response, error in
                        do {
                            // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                if let results = jsonResult["results"] as? NSArray {
                                    for person in results {
                                        let personDict = person as! NSDictionary
                                        self.pepleArray.append(personDict["name"]! as! String)
                                        self.massArray.append(personDict["mass"]! as! String)
                                        self.birthYear.append(personDict["birth_year"]! as! String)
                                        self.genderArray.append(personDict["gender"]! as! String)
                                        
//                                        mass
//                                        birth_year
//                                        gender
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        } catch {
                            print("Something went wrong")
                        }
                })

       
    }
    
   
    
//    func APIreq2(completed: @escaping () ->()){
//        URLSession.shared.dataTask(with: url!){
//            (data,respone, error) in
//            if error == nil{
//                do{
//               let re:people = try JSONDecoder().decode(people.self, from: data!)
//                    print("ooooooooooooooo")
//                    print(re.next)
//                    print(re.results[0].name)
//                    print(re.results[0].height)
//                    print("ooooooooooooooo")
////                    for re in re{
////                    pepleArray.append(re.results[0].name)
////
////                    }
//                    for i in 0..<re.results.count {
//                        self.pepleArray.append(re.results[i].name)
//
//                        print("\(self.pepleArray)")
//
//                    }
//
//
//
//
//
//                    DispatchQueue.main.sync {
//                        completed()
//                    }
//
//                }catch{
//                    print("json error")
//                }
//            }
//        }.resume()
//
//
//
//
//    }
//
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let page2=self.storyboard?.instantiateViewController(withIdentifier: "peopleDetailViewController") as! peopleDetailViewController
        page2.mass = massArray[indexPath.row]
        page2.birth=birthYear[indexPath.row]
        page2.gender=genderArray[indexPath.row]

        self.navigationController?.pushViewController(page2, animated: true)
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


class getThePeople{
    
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
          // Specify the url that we will be sending the GET Request to
          let url = URL(string: "https://swapi.dev/api/people/?format=json")
          // Create a URLSession to handle the request tasks
          let session = URLSession.shared
          // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
          let task = session.dataTask(with: url!, completionHandler: completionHandler)
          // Actually "execute" the task. This is the line that actually makes the request that we set up above
          task.resume()
      }
    
}
