//
//  ChildsTableViewController.swift
//  molfar.test
//
//  Created by ios.nomad on 4/27/18.
//  Copyright © 2018 ios.nomad. All rights reserved.
//

import UIKit
import CoreData

class ChildsTableViewController: UITableViewController {
        
    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult> = CoreDataManager.instance.fetchedResultsController(entityName: "Child", keyForSort: "id")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchResultsController.delegate = self
        do {
            try fetchResultsController.performFetch()
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let child = fetchResultsController.object(at: indexPath) as? Child
        performSegue(withIdentifier: "mainToChild", sender: child)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let managedObject = fetchResultsController.object(at: indexPath) as! NSManagedObject
            CoreDataManager.instance.getManagedContext().delete(managedObject)
            CoreDataManager.instance.saveContext()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "mainToChild", sender: nil)
    }
}

// MARK: - Seque prepear when navigate to ChildVC

extension ChildsTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToChild" {
            let controller = segue.destination // as! CustomerViewController
            controller.child = sender as? Child
        }
    }
}

// MARK: - Fetched Results Controller Delegate
extension ChildsTableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath {
                let child = fetchResultsController.object(at: indexPath as IndexPath) as! Child
                let cell = tableView.cellForRow(at: indexPath as IndexPath)
                cell!.textLabel?.text = child.id
            }
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            }
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath as IndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            }
        }
    }
}
