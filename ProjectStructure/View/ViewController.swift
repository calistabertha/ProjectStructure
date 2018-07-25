//
//  ViewController.swift
//  ProjectStructure
//
//  Created by Digital Khrisna on 6/7/17.
//  Copyright © 2017 codigo. All rights reserved.
//

import UIKit
import ICEnvironmentSetting

class ViewController: UIViewController {

    /*
     *  Define outlet in section below
     */
    @IBOutlet weak var popularTableView: UITableView! {
        didSet {
            let xib = TopRatedTableViewCell.nib
            popularTableView.register(xib, forCellReuseIdentifier: TopRatedTableViewCell.identifier)
            
            popularTableView.delegate = self
            popularTableView.dataSource = self
        }
    }
    
    /*
     *  Define properties in section below
     */
    var movies = [Movie]() {
        didSet {
            popularTableView.reloadData()
        }
    }
    
    var viewErrorHandler: ViewErrorHandler?
    
    
    /*
     *  Define override method in section below
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ICEnvironmentSetting.setupTouch(self.view)
        ICEnvironmentSetting.delegate = self
        
        setupData()
        
        /*let viewErrorHandler = ViewErrorHandler(frame: self.view.frame) { (action) in
            print("Do action while an error occured")
        }
        self.view.addSubview(viewErrorHandler)*/
        
        viewErrorHandler = ViewErrorHandler(frame: self.view.frame, holderView: self.view) { (action) in
            print("Main view controller")
        }
        
        viewErrorHandler?.buttonCornerRadius = 10
        viewErrorHandler?.buttonHeight = 44
    }
    
    /*
     * Define private method in section below
     */
    private func setupData() {
        MovieController().getPopularMovie(
            onSuccess: {
                [weak self] (code, message, result) in
                guard let strongSelf = self else { return }
                guard let res = result else { return }
                
                strongSelf.movies = res
                print(message)
                print("Do action when data available")
        }, onFailed: {
            [weak self] (message) in
            guard let strongSelf = self else { return }
            strongSelf.viewErrorHandler?.show()
            print(message)
            print("Do action when data failed to fetching here")
        }, onComplete: {
            [weak self] (message) in
            guard let strongSelf = self else { return }
            strongSelf.viewErrorHandler?.hide()
            print(message)
            print("Do action when data complete fetching here")
        })
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = movies[indexPath.row]
        return TopRatedTableViewCell.configure(context: self, tableView: tableView, indexPath: indexPath, object: data)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ViewController: ICEnvironmentSettingDelegate {
    func reloadEnvironment(environment: ENVIRONMENT) {
        
    }
}
