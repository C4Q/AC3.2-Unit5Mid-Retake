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
    let identifier = "BookCell"
    
    // Comment #1
    // fix the declaration of fetchedResultsController
    var fetchedResultsController: NSFetchedResultsController<Book>!
    
    var mainContext: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // by initializing the fetchedResultsController before setting anything
        // on tableView we prevent crashing in the data source delegate methods
        initializeFetchedResultsController()
        getData()
        
        self.title = titleForCell
        
        // we observed how estimatedRowHeight alone was enough to trigger automatic cell heights
       
        // but we should set this property too
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        
        tableView.register(UINib(nibName: "BookTableViewCell", bundle:nil), forCellReuseIdentifier: identifier)
        
        // entering text in the textField in the Navigation Bar collects more Book results
        // and should insert them into Core Data
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        self.navigationItem.titleView = textField
        textField.delegate = self
        
        // this should filter the results from core data without any network call
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        self.tableView.tableHeaderView = searchBar
        searchBar.delegate = self
        
        
    }
    
        // get http://www.recipepuppy.com/api/?q=cookies by default
    func getData(search: String = "murakami") {
        APIRequestManager.manager.getData(endPoint: "https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?api-key=e2be2d080327411c84fc55e44e036425&author=\(search)")  { (data: Data?) in
            if let validData = data {
                if let jsonData = try? JSONSerialization.jsonObject(with: validData, options:[]) {
                    if let wholeDict = jsonData as? [String:Any],
                        let records = wholeDict["results"] as? [[String:Any]] {
                        
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        let pc = appDelegate.persistentContainer
                        pc.performBackgroundTask { (context: NSManagedObjectContext) in
                            context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
                            
                            // Comment #2
                            // inserting and saving on the background context sent to this closure
                            for record in records {
                                let book = Book(context: context)
                                book.populate(with: record)
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
        // this guard also protects against crashes
        // but is belt and suspenders with moving initializeFetchedResultsController as in viewDidLoad
        guard fetchedResultsController != nil else {
            return 0
        }
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections[section].numberOfObjects
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BookTableViewCell
        
        let Book = fetchedResultsController.object(at: indexPath)
        
        cell.titleLabel.text = Book.title
        cell.authorLabel.text = Book.author
        cell.descriptionLabel.text = Book.descrip
        
        return cell
    }
    
    
    // Comment #3
    // this function is based partly on our projects and partly
    // on the Coffee Log app. It will require some customization
    // to this project.
    func initializeFetchedResultsController(search: String? = nil) {
        let request: NSFetchRequest<Book> = Book.fetchRequest()
        let sort = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sort]
        
        // don't add a predicate if the search is nil or the empty string
        if let search = search, search != "" {
            let predicate = NSPredicate(format: "descrip contains[c] %@", search)
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
        self.initializeFetchedResultsController(search: searchText)
        self.tableView.reloadData()
    }
    
    // MARK: - Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let search = textField.text {
            self.getData(search: search)
            self.tableView.reloadData()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let search = textField.text {
            self.getData(search: search)
            self.tableView.reloadData()
        }
        return true
    }
}
