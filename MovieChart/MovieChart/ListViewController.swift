//
//  ListViewController.swift
//  MovieChart
//
//  Created by Byoung-Hwi Yoon on 2020/07/26.
//

import UIKit

class ListViewController : UITableViewController {
    
    lazy var list: [MovieVO] = {
        var dataList = [MovieVO]()
        return dataList
    }()
    
    var currentPage = 1
    var totalPage : Int?
    
    override func viewDidLoad() {
        callMovieApi()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        cell.title?.text = list[indexPath.row].title
        cell.desc?.text = list[indexPath.row].description
        cell.rating?.text = "\(list[indexPath.row].rating!)"
        cell.opendate?.text = list[indexPath.row].openDate
        
        DispatchQueue.main.async {
            cell.tumbnail?.image = self.getThumbnailImage(indexPath.row)
        }
        
        
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if let total = totalPage{
            if (offsetY > contentHeight - scrollView.frame.size.height && self.list.count < total) {
                currentPage += 1
                callMovieApi()
                tableView.reloadData()
            }
        }
        

    }
    
    func callMovieApi() {
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(currentPage)&count=10&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        
        let apidata = try! Data(contentsOf: apiURI)
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            totalPage = (hoppin["totalCount"] as? NSString)?.integerValue
            
            for row in movie {
                
                let movieData = row as! NSDictionary
                let mvo = MovieVO()
                
                mvo.title = movieData["title"] as? String
                mvo.description = movieData["genreNames"] as? String
                mvo.thumnail = movieData["thumbnailImage"] as? String
                mvo.detail = movieData["linkUrl"] as? String
                mvo.rating = (movieData["ratingAverage"] as! NSString).doubleValue
                
                //let imgUrl: URL! = URL(string: mvo.thumnail!)
                //let imgData = try! Data(contentsOf: imgUrl)
                //mvo.thumbnailImage = UIImage(data: imgData)
                
                
                list.append(mvo)
                
                
            }
            
            
        } catch {
            
        }
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        
        let mvo = self.list[index]
        
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let imgUrl: URL! = URL(string: mvo.thumnail!)
            let imgData = try! Data(contentsOf: imgUrl)
            mvo.thumbnailImage = UIImage(data: imgData)
            
            return mvo.thumbnailImage!
        }
        
    }
}

extension ListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_detail" {
            
            let path = self.tableView.indexPath(for: sender as! MovieCell)
            
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = self.list[path!.row]
            
        }
    }
    
    
}

