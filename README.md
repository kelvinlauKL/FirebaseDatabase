# FirebaseDatabase
A small demo focused on demonstrating how to push and retrieve a list of data from [Firebase](https://firebase.google.com). Firebase is a backend solution managed by the folks at Google. This is written in Swift.

![initial screen](/Images/screen.png)

## Server.swift

The `Server.swift` file contains a barebones `Server` enum:

```swift
enum Server {}
```

In the spirit of modular code, everything that communicates with the Firebase backend will be in the namespace of the `Server` enum.

## Server+Database.swift

The `Server+Database.swift` file manages the communication between the app and Firebase for pushing/fetching of data. This is an **extension** of the `Server` enum, with the sole responsibility of handling networking.


