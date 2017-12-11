//
//  SearchVC.swift
//  Depo
//
//  Created by Minjung Kim on 20/11/17.
//  Copyright © 2017 June Kim. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UISearchBarDelegate {
  
   
    @IBOutlet weak var tableView: UITableView!
    
    let searchBar = UISearchBar()
    let dataSource = ["Max","John","Alex","Sarah"]
    
    
    var filteredDataSource = [String]()
    var shouldShowSearchResults = false

    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            createSearchBar()
            tableView.delegate = self
            tableView.dataSource = self
            
            }

        func createSearchBar() {
            searchBar.showsCancelButton = false
            searchBar.placeholder = "여기에 이름으로 검색해주세요"
            searchBar.delegate = self
            
            self.navigationItem.titleView = searchBar
        
        }
    
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            shouldShowSearchResults = true
        }
    
    
    
    
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
                filteredDataSource = dataSource.filter({ (names: String) -> Bool in
                  
                    return names.lowercased().contains(searchText.lowercased())
                    
                })
            
            if searchText != "" {
                    shouldShowSearchResults = true
                    self.tableView.reloadData()
                } else {
                    shouldShowSearchResults = false
                    self.tableView.reloadData()
                }
        }
    
    
    
       func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
            shouldShowSearchResults = true
            searchBar.endEditing(true)
            self.tableView.reloadData()
        }


  
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

}








// MARK: TABLE VEIW DELEGATE

extension SearchVC : UITableViewDelegate {
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
            
            
            if shouldShowSearchResults {
                detailVC.detailText = filteredDataSource[indexPath.row]
                
                
            }
            else {
                detailVC.detailText = dataSource[indexPath.row]
                
            }
            navigationController?.pushViewController(detailVC, animated: true)
        
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }

}



// MARK: TABLE VIEW DATA SOURCE
 extension SearchVC : UITableViewDataSource {
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            if shouldShowSearchResults {
                return filteredDataSource.count
                }
            else {
                return dataSource.count
                }
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
            
                if shouldShowSearchResults {
                    cell.cellLabel.text = filteredDataSource[indexPath.row]
                    return cell
                    
                }
                else {
                    cell.cellLabel.text = dataSource[indexPath.row]
                    return cell
                    
                }
            }

    
 

    
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            searchBar.endEditing(true)
        }
    
   
}

