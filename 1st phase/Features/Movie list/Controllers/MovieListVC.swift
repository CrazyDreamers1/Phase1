//
//  ViewController.swift
//  1st phase
//
//  Created by SOL MAC 15 on 8/5/21.
//

import UIKit

class MovieListVC: UIViewController {
    
    private let viewModel = MovieListVM()
    
    //Mark: - IB Outlets
    @IBOutlet private weak var movieTableView: UITableView!
    
    //Mark: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiSetup()
        self.loadMovieList()

    }
    
    
    
    //Mark: - Custom functions
    private  func uiSetup() {
        self.movieTableView.sectionHeaderHeight = 70
    }
    
    private  func loadMovieList() {
        viewModel.getMarvelMovieList(vc: self) { success in
            if success{
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            }
        }
    }
    
}



//Mark: - TableView Datasource and Delegate methods
extension MovieListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        cell.configureCell(with: (viewModel.movieList?[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let label = UILabel(frame: CGRect(x: 20, y: 10, width: tableView.frame.size.width, height: 50))
        label.text = "Movie List"
        label.textColor = UIColor.black
        label.font = .boldSystemFont(ofSize: 27)
        
        view.addSubview(label)
        
        return view
    }
    
    
}

