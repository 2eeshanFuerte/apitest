Reels App - Flutter

A Flutter app that fetches, displays, and paginates video content from the Ulearn API. The app uses the BLoC pattern for state management, lazy loading for performance, and caching for an improved user experience. The app allows users to scroll through video data, similar to a "reels" page.
Features

    Fetch data from the API: Data is fetched from the Ulearn API.
    Pagination: Implement pagination to fetch content in chunks (default 10 items per page).
    Lazy Loading: Content is loaded only when needed as users scroll.
    Error Handling: Handles potential errors during data fetching.
    State Management: Uses the BLoC pattern for clear separation of business logic and UI.
    Caching: Video data is cached to improve performance by reducing unnecessary API requests.

Requirements

    Flutter 3.x (or higher)
    Dart 2.x (with null safety)

Setup

To run this project locally, follow these steps:

    Clone this repository

git clone https://github.com/2eeshanFuerte/apitest.git

Navigate to the project directory

cd reels-app

Install dependencies If you're using Flutter, run the following command to fetch dependencies:

flutter pub get

Set up dependencies with GetIt The project uses the GetIt package for dependency injection. Before running the app, make sure you initialize it by adding the following:

void main() {
  di.init();  // Initialize all the dependencies in injection_container.dart
  runApp(MyApp());
}

Run the app

To run the app on your device or emulator, execute the following command:

    flutter run

Folder Structure

The project is structured as follows:

lib/
├── injection_container.dart          # Dependency Injection container setup
├── features/                        # Contains different app features
│   ├── reels/                       # Reels feature (API calls, UI, BLoC, etc.)
│   │   ├── data/                    # Contains data sources and repositories
│   │   ├── presentation/            # Contains BLoC, Widgets, and Views
│   │   └── models/                  # Data models (e.g., ReelModel)
├── main.dart                        # Main entry point of the app

Key Files

    injection_container.dart: Set up dependencies and their injections for the app.
    reels_page.dart: The page that displays the fetched video content in a "reels" format.
    reels_bloc.dart: Contains the business logic for handling data fetching, pagination, etc., using the BLoC pattern.
    reel_model.dart: Data model that defines the structure of the video data.

Architecture

This project follows a Clean Architecture approach, where:

    Presentation Layer: Handles the UI, contains pages, widgets, and manages interaction with the BLoC.
    Domain Layer: Business logic layer that includes BLoC classes (ReelsBloc).
    Data Layer: Manages API requests, data parsing, and repositories that retrieve data. This is where ReelRepositoryImpl is implemented for fetching and parsing the video data.

State Management

The app uses BLoC (Business Logic Component) for state management. The ReelsBloc is used to manage fetching data, handling pagination, loading states, and error states. It is connected to the UI through BlocBuilder.
Dependency Injection

The app uses the GetIt package for dependency injection to register and retrieve instances of services, repositories, and blocs.
Technologies Used

    Flutter: Framework for building the app.
    BLoC Pattern: For state management.
    GetIt: Dependency injection to manage services and repositories.
    HTTP: For making network requests to fetch video data.
    JSON: To parse data from the API into Dart objects.




Author

    Zeeshan - @2eeshanFuerte