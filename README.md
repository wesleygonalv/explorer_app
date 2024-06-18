# Explorer App

This project is a Flutter application that fetches data from a file server and lists the files in a hierarchical manner.

## Requirements

Before running the application, ensure you have the following installed on your machine:

- Flutter SDK: [Flutter Installation](https://flutter.dev/docs/get-started/install)
- Dart SDK: Usually included with the Flutter SDK
- A code editor (recommended: Visual Studio Code or Android Studio)

## Environment Setup

1. **Clone the Repository**

   Clone the project repository to your local machine using the command:

```bash
   git clone <REPOSITORY_URL>
```


2. **Add the Server Host**
    
    Before running the application, you need to add the file server host in the `app_connect` file. Follow the steps below:
    
    - Open the `lib/config/app_connect.dart` file in your code editor.
        
    - Edit the `baseUrl` to include your server's host. For example:
        ```dart
        httpClient.baseUrl = 'http://your-server.com';
	    ```    

## Running the Project

With the environment set up, follow the steps below to run the application:

1. **Install Dependencies**
    
    Navigate to the project directory in the terminal and run the command to install the dependencies 
    ```bash 
	flutter pub get
	```
    
2. **Run the Application**
    
    Connect a device (physical or emulator) and run the command to start the application:
    ```bash
    flutter run
    ```

## Project Structure

- `lib/main.dart`: The entry point of the application.
- `lib/core`: Contains all configurations and utils for application
- `lib/shared/`: Contains widgets that will be used in any part of the code regardless of the business rule
- `lib/modules/`: Modules that contain pages, widgets, controllers, providers and views

## Contact

For more information, contact wesleygonalv@gmail.com

---
