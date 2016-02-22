//
//  Tweet.swift
//  Twitter
//
//  Created by Scott Munroe on 2/21/16.
//  Copyright © 2016 Scott Munroe. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var dictionary: NSDictionary
    var id: Int?
    var favorite_count: Int?
    var retweet_count: Int?
    
    init(dictionary: NSDictionary) {
        print(dictionary)
        
        self.dictionary = dictionary
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        id = dictionary["id"] as? Int
        favorite_count = dictionary["favorite_count"] as? Int
        retweet_count = dictionary["retweet_count"] as? Int
        
        print(id!)
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        
        
        return tweets
    }
    
    class func tweetAsDictionary(dict: NSDictionary) -> Tweet {
        
        var tweet = Tweet(dictionary: dict)
        
        return tweet
    }

}
