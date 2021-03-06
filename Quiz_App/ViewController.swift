//
//  ViewController.swift
//  Quiz_App
//
//  Created by Arinjay on 23/03/18.
//  Copyright © 2018 Arinjay. All rights reserved.
//

import UIKit
import SVProgressHUD


class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate , YourCellDelegate{
        

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let url = URL(string: "https://opentdb.com/api.php?amount=10&category=11&difficulty=easy&type=boolean")
    
    var result = [Result]()
    var score = 0
    var buttonTapped = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        downloadJSON {
        }
        
        tableView.register(UINib(nibName: "cusXib", bundle: nil), forCellReuseIdentifier: "customCell")
        self.tableView.backgroundColor = UIColor.init(red: 44/255, green: 44/255, blue: 44/255, alpha: 1)
        configureTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.delegate = self
        cell.questionLabel.text = result[indexPath.row].question
        return cell
    }
    
    
    func configureTableView(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 130
    }
    
    func checkResult(T: String, F: String){
        if (T == F){
            if score < 10{
            score = score + 1
            
                scoreLabel.text =  "Score: " + String(score) + " /10"
                SVProgressHUD.showSuccess(withStatus: "Correct")
                SVProgressHUD.dismiss(withDelay: 1)
                SVProgressHUD.setBackgroundColor(UIColor.init(red: 197.0/255.0, green: 187.0/255.0, blue: 117.0/255.0 , alpha: 1))
            print("Score is  + \(score)")
            }else {
                score = 0
                scoreLabel.text = "Score: " + String(score) + " /10"
            }
            
        }else{
            SVProgressHUD.showError(withStatus: "Wrong")
            SVProgressHUD.dismiss(withDelay: 1)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDataF" {
            let destination = segue.destination as? SecondViewController
            destination?.data =  score
        }
    }
    
    func checkTag(tag: Int) -> String {
        return tag == 0 ? "True" : "False"
    }
    
    func didTapButton(_ sender: UIButton) {
        if let indexPath = getCurrentCellIndexPath(sender) {
            let getString = checkTag(tag: sender.tag)
            
                if buttonTapped < 9{
                buttonTapped = buttonTapped + 1
                    print("buttonTap")
                    print(buttonTapped)
                
                checkResult(T: result[indexPath.row].correct_answer, F: getString)
                print(indexPath.row)
                print(sender.tag)
                }
                    
                else {
                     performSegue(withIdentifier: "showDataF", sender: self)
                    score = 0
                    scoreLabel.text = "Score: " + String(score) + " /10"
                    buttonTapped = 0
                    
                }
        }
    }
    
    func changeButtonColor(){
        
    }
    
    func getCurrentCellIndexPath(_ sender: UIButton) -> IndexPath? {
        let buttonPosition = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath: IndexPath = tableView.indexPathForRow(at: buttonPosition) {
            return indexPath
        }
        return nil
    }
    

    func downloadJSON(completed: @escaping () -> ()) {
        
        //URLSession.shared.dataTask(with: url!) { (data, response, error) in
        URLSession.shared.dataTask(with: url!) { [weak self](data, response, error) in
            if error == nil {
                do
                {
                   let x = try JSONDecoder().decode(Results.self, from: data!)
                   
                    
                    self?.result = x.results
                   
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                        completed()
                    }
                }catch {
                    print("Json error")
                }
            }
            }.resume()
    }


}

