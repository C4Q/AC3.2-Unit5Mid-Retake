//
//  BooksTableViewController.swift
//  AC3.2-Unit5Mid-Retake
//
//  Created by Jason Gresh on 1/6/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import CoreData

class BooksTableViewController: UITableViewController, CellTitled, NSFetchedResultsControllerDelegate, UISearchBarDelegate, UITextFieldDelegate {
    var titleForCell = "Core Data"
    var userInputTextField: String?
    
    // Comment #1
    // fix the declaration of fetchedResultsController
    var fetchedResultsController: NSFetchedResultsController<Book>!
    
    var mainContext: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleForCell
        
        self.tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookCell")
        
        
        
        initializeFetchedResultsController()
        getData()
        
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // entering text in the textField in the Navigation Bar collects more recipe results
        // and should insert them into Core Data
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        self.navigationItem.titleView = textField
        textField.placeholder = "Add Author"
        textField.delegate = self
        
        // this should filter the results from core data without any network call
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        self.tableView.tableHeaderView = searchBar
        searchBar.placeholder = "Filter Authors"
        searchBar.delegate = self
    }
    
    func getData(search: String = "murakami") {
        APIRequestManager.manager.getData(endPoint: "https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?api-key=e2be2d080327411c84fc55e44e036425&author=\(search)")  { (data: Data?) in
            if let validData = data {
                if let jsonData = try? JSONSerialization.jsonObject(with: validData, options:[]) {
                    if let wholeDict = jsonData as? [String:Any],
                        let books = wholeDict["results"] as? [[String:Any]] {
                        
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        let pc = appDelegate.persistentContainer
                        pc.performBackgroundTask { (context: NSManagedObjectContext) in
                            context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
                            
                            // Comment #2
                            // insert your core data objects here
                            books.forEach{ (bookRecord) in
                                let book = Book(context: context)
                                book.populate(from: bookRecord)
                            }
                            
                            do {
                                try context.save()
                            }
                            catch let error {
                                print(error)
                            }
                            
                            DispatchQueue.main.async {
                                self.initializeFetchedResultsController()
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let sections = fetchedResultsController.sections {
            return sections[section].numberOfObjects
        }
        return 0
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
     
        let book = fetchedResultsController.object(at: indexPath)
        
        cell.titleLabel.text = book.title ?? ""
        cell.authorLabel.text = book.author ?? ""
        cell.descriptionLabel.text = book.abstract ?? ""
        
     return cell
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = fetchedResultsController.object(at: indexPath)
        print(book.abstract)
    }
    
    // Comment #3
    // this function is based partly on our projects and partly
    // on the Coffee Log app. It will require some customization
    // to this project.
    func initializeFetchedResultsController(searchString: String? = nil) {
        let request: NSFetchRequest<Book> = Book.fetchRequest()
        let sort = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sort]
        let nonNilTitlePredicate = NSPredicate(format: "title != nil")
        request.predicate = nonNilTitlePredicate
        
        if let search = searchString {
            let predicate = NSPredicate(format: "author contains[c] %@", search) //search is the argument that will substitute for %@
            request.predicate = predicate
        }
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: mainContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
    
    // MARK: - Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Comment #4
        self.initializeFetchedResultsController(searchString: searchText)
        self.tableView.reloadData()
    }
    
    // MARK: - Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let search = textField.text {
            self.userInputTextField = search
            self.getData(search: search)
            self.tableView.reloadData()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let search = textField.text {
            self.userInputTextField = search
            self.getData(search: search)
            self.tableView.reloadData()
        }
        return true
    }
}
