//
//  enumForAPI.swift
//  TestWorkForXDesign
//
//  Created by Igor Trifuntov on 01.11.2020.
//

import Foundation

enum Constant: String {
    case consumerKey = "tXELD586Hvg0bnDW3ysAHH1wd"
    case consumerSecret = "0ExKoMALDsaCzX21Hb2Jx4wh4OVAtrWoYMkBIwFHt9TCCYcXJy"
    case authUrl = "https://api.twitter.com/oauth2/token"
    case apiTwitter = "https://api.twitter.com/1.1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=%@&count=25"
    case nameAccount = "RT_russian"
}
