# WeatherFun
## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
We are building a weather app that displays the weather, the place, and if it is raining

### App Evaluation
- **Category:** Health
- **Mobile:** iOS
- **Story:** Allows users to keep record of their workout summary.
- **Market:** Anyone who enjoys to workout or are beginners to exercising.
- **Habit:** People who go to the gym or exercise are using this to learn how to exercise in the most optimal way.
- **Scope:** Fitbit, Strava, Apple Fit

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Workout Summary
* Step Count
* Calorie Tracker
* Fitnese Photos
* Login, SignUp, Logout
* Launch Screen
* Appicon with App logo


**Optional Nice-to-have Stories**

* User profile
* User Timeline

### 2. Screen Archetypes

* LogIn/SignIn
   * User will be able to LogIn
   * New User will be able to SignIn
* Workout/HomeScreen
   * User will be able to choose the workout from this screen
   * User will be able to set their calorie goal 
   * User will be able to tap a button to post their workout photos

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* User Profile
* Exercises/Workouts
* Post Photo

**Flow Navigation** (Screen to Screen)

* LogIn/ SignUp Screen
* Home Screen
* User Profile Screen

## Wireframes
Launch Page         |  LogIn/SignUp Page
:-------------------------:|:-------------------------:
<img src="https://github.com/CodePathGroup14/FitnessAPI/blob/main/1.jpeg" width=200> | <img src="https://github.com/CodePathGroup14/FitnessAPI/blob/main/2.jpeg" width=200>

Workout Page         |  Profile Page
:-------------------------:|:-------------------------:
<img src="https://github.com/CodePathGroup14/FitnessAPI/blob/main/3.jpeg" width=200> |  <img src="https://github.com/CodePathGroup14/FitnessAPI/blob/main/4.jpeg" width=200>


### [BONUS] Digital Wireframes & Mockups
<img src="https://github.com/CodePathGroup14/FitnessAPI/blob/main/5.jpeg" width=200>

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]

### Models
Property           |  Type
:-------------------------:|:-------------------------:
 objectId |  String
 authData | Object
 username | String
 password | String
 email | String
 text | String
 author | Pointer
 post | Pointer
 image | File
 comments| Array

 

### Networking
- Home Screen 
```
let query = PFQuery(className: "Posts")
        query.includeKeys(["author", "comments", "comments.author"])
        query.limit = 20
        query.findObjectsInBackground{ (posts, error) in
            if posts != nil{
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
```
- Network request 
```
let url = URL(string: "")!
let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
let task = session.dataTask(with: request) { (data, response, error) in
     // This will run when the network request returns
     if let error = error {
            print(error.localizedDescription)
     } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
     }
}
