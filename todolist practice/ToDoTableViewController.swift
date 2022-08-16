//
//  ToDoTableViewController.swift
//  todolist practice
//
//  Created by Preksha Hooda on 16/08/22.
//

import UIKit

var previousVC = ToDoTableViewController()

class ToDoTableViewController: UITableViewController {
    
    var toDos : [ToDo] = []
    override func viewDidLoad(){
        super.viewDidLoad()
        
        toDos = createToDos()
        
    }
    
    
    func createToDos() -> [ToDo] {
        
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        // important is set to false by default
        
        return [swift, dog]
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
        
        // Configure the cell...
        
        return cell
    }
    
    
    

    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if var addVC = segue.destination as? AddToTableViewController {
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let toDo = sender as? ToDo {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
    }
    
    
    // this gives us a single ToDo
    
}
