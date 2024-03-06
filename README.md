
# Tone Framework


A Swift package for working with AudioKit and allows to perceive and filter tones (frequencies) 

## Requirements

- Swift 5.3+
- IOS 13+

## Usage

* * *

```swift
import ToneListen

// Instance tone framework by passing client ID
let toneFramework = ToneFramework(clientID: {{ Your client ID }})

//Start listen service:
toneFramework.start()

//To stop service:
toneFramework.stop()

//If you need to be notified when a valid tone was caught, you will need to subscribe to 'notificationName' from NotificationHandler:

// By publishing this property we can ensure that our subscriber (notificationName) will be
// re-rendered when the property changes (i.e. whenever there's a new notification)
@Published var newNotification: String? {
    didSet {
        guard notifiedValue != nil else { return }            
    }
}

notificationSub = NotificationCenter.default.publisher(for: NotificationsHandler.notificationName)
            .map { notification in notification.object as? String }   // Transform the notification into a simple string
            .assign(to: \notifiedValue, on: self)  // Assign the msg to a property using a keypath

// 'notifiedValue' saves an URL or PhoneNumber (string), depending what tone was caught. 
```
## NOTE:

You need to add "Background modes" capabilites to your project to allow using microphone and location services in background.

Also you need to add frecuencies_table.json to your project.


## Installation

### Swift Package Manager

Add the ToneLibrary package to your target dependencies in `Package.swift`:

```swift
import PackageDescription

let package = Package(
  name: "YourProject",
  dependencies: [
    .package(
        url: "https://github.com/The-TONE-Knows-Inc/ToneLibrary",
        from: "TonelibraryV2"
    ),
  ]
)
```

Or you can add the ToneLibrary package to your PROJECT package dependencies by clicking on (+) at the left bottom

<img width="981" alt="Screenshot 2024-03-06 at 1 42 13 PM" src="https://github.com/Anilkumar18/ToneLibrary-iOS/assets/32846534/6c6bbfd3-8600-48ba-9f3e-749271b42e72">

