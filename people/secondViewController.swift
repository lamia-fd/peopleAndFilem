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
    
    var TitleArray:[String]=[]
    var ReleaseDate:[String]=[]
    var DirectorArray:[String]=[]
    var OpeningCrawlArray:[String]=[]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        APIreq2{
//            print("hiiii")
//
//            self.tableView2.reloadData()
//
//        }

        // Do any additional setup after loading the view.
        
        
        getTheFilms.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                    data, response, error in
                        do {
                            // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                if let results = jsonResult["results"] as? NSArray {
                                    for person in results {
                                        let personDict = person as! NSDictionary
                                        self.TitleArray.append(personDict["title"]! as! String)
                                        self.ReleaseDate.append(personDict["release_date"]! as! String)
                                        self.DirectorArray.append(personDict["director"]! as! String)
                                        self.OpeningCrawlArray.append(personDict["opening_crawl"]! as! String)
                                        print(personDict["title"]! as! String)
                                        print(personDict["release_date"]! as! String)
                                        print(personDict["opening_crawl"]! as! String)

//                                        mass
//                                        birth_year
//                                        gender
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                                self.tableView2.reloadData()
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
//               let re:filems = try JSONDecoder().decode(filems.self, from: data!)
//                    print("ooooooooooooooo")
//                   // print(re.next)
//                   // print(re.results[0].name)
//                    print(re.results[0].title)
//                    print("ooooooooooooooo")
////                    for re in re{
////                    pepleArray.append(re.results[0].name)
////
////                    }
//                    for i in 0..<re.results.count {
//                        self.filemsArray.append(re.results[i].title)
//
//                        print("\(self.filemsArray)")
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
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Details=self.storyboard?.instantiateViewController(withIdentifier: "filmsDetails") as! filmsDetailsViewController
        Details.ReleaseDate=ReleaseDate[indexPath.row]
        Details.Director=DirectorArray[indexPath.row]
       Details.OpeningCraw=OpeningCrawlArray[indexPath.row]

        self.navigationController?.pushViewController(Details, animated: true)
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TitleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = TitleArray[indexPath.row]
        return cell
    }
    

}

//struct filems:Decodable{
//let results:[filem]
//
//}
//struct filem:Decodable{
//let title:String
//}





class getTheFilms{
    
    static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
          // Specify the url that we will be sending the GET Request to
          let url = URL(string: "https://swapi.dev/api/films/?format=json")
          // Create a URLSession to handle the request tasks
          let session = URLSession.shared
          // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getAllPeople function itself
          let task = session.dataTask(with: url!, completionHandler: completionHandler)
          // Actually "execute" the task. This is the line that actually makes the request that we set up above
          task.resume()
      }
    
}
