# Trek World

> An app that shows you potential hiking spots to enjoy your time alone or with your loved ones. Explore
> the vast world out there and calm your mind and body from the commotions in the city, see amazing sceneries, walk through the woods
> climb up mountains or go through valleys. it's up to you to choose your destination we merely present the options!

## Screen Shots

![home_screen](https://i.ibb.co/ZJ0HXW7/home-screen.png)
![login_screen](https://i.ibb.co/WFQPptH/login-screen.png)
![browsing_screen](https://i.ibb.co/pPxzGzQ/browsing-screen.png)
![info_screen](https://i.ibb.co/1ZsgjQM/info-screnn.png)

## Table of Contents

1. [Usage](#Usage)
1. [Requirements](#requirements)
1. [Development](#development)
   1. [Installing Dependencies](#installing-dependencies)
   1. [Roadmap](#roadmap)

## Usage

> As a user, simply download the app, login with your google account and you are up and running!.
> As a developer download flutter and android studio, make sure flutter plugin is installed and start editing within android studio or with your prefered editor.

## Requirements

- Installing Flutter
- Installing Android Studio
- Integration with Firebase

## Development

This app was developed using:

- Programing language: Darts.
- Front-end framework: Flutter.
- Back-end & Real-time Database: Firebase, Cloud Firestore.

### Installing Dependencies

From within the root directory open the terminal/cmd and run **flutter doctor** after installing flutter and make sure everything is checked!
all the dependencies are within the pupspec.yaml file which include the following:

```sh
dependencies:
  flutter:
    sdk: flutter
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.2
  firebase_auth: ^0.11.1+6
  flutter_facebook_login: ^2.0.1
  firebase_database: ^3.0.2
  cloud_firestore:
  google_sign_in:

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_launcher_icons: ^0.7.2+1
```

### Roadmap

My vision for this app is for it to become a community based application, a social media app for hiking! where people share their experiences with eachother to interact more and gather more to join the adventure, Its nice to see this activity be adopted by more people as it helps you go back to your roots to camp in the wildernes, to remember where you came from befor all the technology we got used to over the past years.

Short-term plans include:

- Improving the user experience with adding places.
- Adding a search bar.
- Including a geo location link to google maps for each place.
- Plans to add chatrooms.

Long-term plans:

- Adding an events page where users can posts events for people to join and travel together!
- Adding a blogging page so users will be able to make more comprehensive reviews about the places they have visited.
- Include a profile page and users will be able to preview other profile pages.
- Include an add friend feature so users can stay intouch and arrange new hikes with eachother.
