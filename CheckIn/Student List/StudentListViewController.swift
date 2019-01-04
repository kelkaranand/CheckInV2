//
//  StudentListViewController.swift
//  CheckIn
//
//  Created by Anand Kelkar on 04/12/18.
//  Copyright © 2018 Anand Kelkar. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class StudentListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var roundButton: UIButton = {
        let roundButton = UIButton(type: .custom)
        roundButton.setTitleColor(UIColor.orange, for: .normal)
        roundButton.addTarget(self, action: #selector(openQRCodeScanner), for: .touchUpInside)
        return roundButton
    }()
    
    var data: Array<StudentData> = []
    
    //Variable used to identify selected student before passing it to the profile view
    var selectedStudent: StudentData?
    
    //Variable used to store the filtered list
    var filteredStudents = [StudentData]()
    
    //Dummy data for test
    func generateDummyData() {
        let s1 = StudentData(id: "1234", fname: "Harry",lname: "Potter",checked: true,sname: "Hogwarts School Of Witchcraft and Wizardry")
        let s2 = StudentData(id: "5678", fname: "Ron", lname: "Weasley", checked: false,sname: "Hogwarts School Of Witchcraft and Wizardry")
        let s3 = StudentData(id: "9012", fname: "Ginny", lname: "Weasley", checked: true,sname: "Hogwarts School Of Witchcraft and Wizardry")
        let s4 = StudentData(id: "3456", fname: "Hermione", lname: "Granger", checked: false,sname: "Hogwarts School Of Witchcraft and Wizardry")
        
        data.append(s1)
        data.append(s2)
        data.append(s3)
        data.append(s4)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateDummyData()
        view.addSubview(roundButton)
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.title = "Hometown Hall"
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Students"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    override func viewWillLayoutSubviews() {
        roundButton.layer.cornerRadius = 5// roundButton.layer.frame.size.width/2
        roundButton.backgroundColor = .gray
        roundButton.clipsToBounds = true
        roundButton.setImage(#imageLiteral(resourceName: "icons8-qr-code-filled-100"), for: .normal)
        roundButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        roundButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            roundButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            roundButton.widthAnchor.constraint(equalToConstant: 100),
            roundButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func openQRCodeScanner() {
        let storyboard: UIStoryboard = UIStoryboard(name: "QRCodeScan", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "QRScannerViewController") as! QRScannerViewController
        self.show(vc, sender: self)
    }
    
    //Method to return the number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Method to return the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredStudents.count
        }
        return data.count
    }
    
    //Method to populate the rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentListCell") as! StudentTableViewCell
        
        var student:StudentData?
        if isFiltering() {
            student = filteredStudents[indexPath.row]
        }
        else {
            student = data[indexPath.row]
        }
        
        student = data[indexPath.row]
        
        cell.fname.text = student!.fname
        cell.lname.text = student!.lname
        cell.checkMark.image = student!.checked ? UIImage(named: "checkmark") : nil
        
        cell.fname.numberOfLines=0;
        cell.fname.font = UIFont(name: "HelveticaNeue", size: 20)
        cell.fname.minimumScaleFactor = 0.1
        cell.fname.adjustsFontSizeToFitWidth=true
        
        cell.lname.numberOfLines=0;
        cell.lname.font = UIFont(name: "HelveticaNeue", size: 20)
        cell.lname.minimumScaleFactor = 0.1
        cell.lname.adjustsFontSizeToFitWidth=true
        
        return cell
    }
    
    /*
        Method that defines action to be done when a row is selected
        In this case, populate selectedStudent and perform segue to profileView
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering() {
            selectedStudent = filteredStudents[indexPath.row]
        }
        else {
            selectedStudent = data[indexPath.row]
        }
        
        selectedStudent = data[indexPath.row]
        self.performSegue(withIdentifier: "showProfile", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let profile = segue.destination as? ProfileViewController
        {
            
            profile.fname = (selectedStudent?.fname)!
            profile.lname = (selectedStudent?.lname)!
            profile.id = (selectedStudent?.id)!
            
        }
    }
    
    @IBAction func pressedAdminTools(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "AdminTools", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AdminToolsViewController") as! AdminToolsViewController
        self.show(vc, sender: self)
    }

    let searchController = UISearchController(searchResultsController: nil)

    //Function checks if list has been filtered via search text
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    //Function checks if search text is empty
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    //Function to create filtered list based on search text
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredStudents = data.filter({( student : StudentData) -> Bool in
            return (student.fname!.lowercased().contains(searchText.lowercased()) || student.lname!.lowercased().contains(searchText.lowercased()))
        })

        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        headerView.backgroundColor = .red
        
        return headerView
    }
    
}

//Extension updates delegate when search text changes
extension StudentListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
