//
//  MovieTableViewCell.swift
//  1st phase
//
//  Created by SOL MAC 15 on 9/5/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleLBL: UILabel!
    @IBOutlet weak var movieDescriptionLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(with movie:Movie) {
            
        self.movieTitleLBL.text = movie.title
        self.movieDescriptionLBL.text = movie.overview
        
        if let moviePoster = movie.poster_path{
            let posterURL = URL(string: movieImageBase+moviePoster )
            
        self.moviePosterImage.load(url:posterURL!)
            
        }
    }

}
