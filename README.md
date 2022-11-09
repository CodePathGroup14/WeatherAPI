# WeatherFun
## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
We are building a weather app that displays the weather, the place, and if it is clear as day or not.

### App Evaluation
- **Category:** Utility
- **Mobile:** iOS
- **Story:** Allows users to check the weather of their location or other locations.
- **Market:** Anyone who that checks the weather first thing they wake up.
- **Habit:** People who check the weather to figure what they need to wear for the day.
- **Scope:** iPhone

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Home Screen (shows the weather of current location)
* Search bar to find out the weather of other locations.


### 2. Screen Archetypes

* HomeScreen
   * User will be able to check the weather of their location.
* Searchbar
   * User will be able to find out the weather in any location.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Clothing Recommendation

**Flow Navigation** (Screen to Screen)

* Searchbar
* Home Screen



## Wireframes


<img src= https://raw.githubusercontent.com/CodePathGroup14/WeatherAPI/main/IMG_3451.jpg width=600>




## Schema 
[This section will be completed in Unit 9]

### Models
Property           |  Type
:-------------------------:|:-------------------------:
 objectId |  String
 authData | Object
 text | String
 
 

### Networking
- Home Screen 
```
var body: some View {
        VStack{
            Text(viewModel.cityName)
                .font(.largeTitle)
                .padding()
            Text(viewModel.temperature)
                .font(.system(size: 70))
                .bold()
            Text(viewModel.weatherIcon)
                .font(.largeTitle)
                .padding()
            Text(viewModel.weatherDescription)
        }.onAppear(perform: viewModel.refresh)
    }
}
```
- Network request 
```
private func makeDataRequest(forCoorfinates coordinates: CLLocationCoordinate2D){
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in guard error == nil, let data = data else { return }
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                self.completionHandler?(Weather(response: response))
            }
            
        }.resume()
        

        
    }

```
## User Stories (Unit 7)

The following **required** functionality is completed:

- [x] Home Screen Completion. 
- [x] Linking and Titles. 
- [x] Formating App. 
- [x] API Call To Fetch Data. 

## GIF
https://imgur.com/a/tVVn00f

<img src='http://g.recordit.co/5e3OoVdaak.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## User Stories (Unit 8)

The following **required** functionality is completed:

- [x] Search Bar With Plus Button. 
- [x] Allows User To Add A City. 
- [x] Shows all the cities in US based on the users input. 

## GIF

<img src='http://g.recordit.co/7zs6oRWM7P.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


