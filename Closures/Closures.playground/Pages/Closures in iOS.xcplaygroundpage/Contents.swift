//: [Previous](@previous)

import UIKit

/*******************************************/

// MARK: - #1
// Why are closures useful

// RULE #1 - Callback

// Useful when it comes to implementing callbacks because of the ability to capture variables

let someLabel = UILabel()

UIView.animate(withDuration: 1.0, animations: { 
    someLabel.alpha = 0.3
    }) { (failure) in
        // if is true, do something, also, do also something
        // when completes execute this closure
}



// MARK: - #1
// Making a network request

import Foundation

let label = UILabel()

func getRecentBlogPost(completion: ((URLResponse) -> Void)?) {
    let session = URLSession(configuration: .default)
    let url = NSURL(string: "https://console.developers.google.com/apis/credentials?project=picturestest-db978")!
    let request = NSURLRequest(url: url as URL)
    
    let dataTask = session.dataTask(with: request as URLRequest) { data, response, error in
        // Execute body of closure
        completion!(response!)
    }
    
    dataTask.resume()
}

getRecentBlogPost() { response in
    print("response \(response)")
}