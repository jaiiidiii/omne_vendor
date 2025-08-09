# OmneVendor Technical Assessment

This project is a technical assessment for the role of Flutter Developer at Omnesoft. It implements a cross-platform (Android, iOS) mobile application for searching and viewing vendor details.

## Features

- **Vendor Search:** A real-time, debounced search bar to filter vendors by name.
- **Pull-to-Refresh:** Users can pull down on the vendor list to refresh the data from the API.
- **Offline Caching:** Vendor data is cached locally using Sqflite, allowing the app to function offline.
- **Favorites:** Users can mark vendors as favorites, with the state persisted locally using Sqflite.
- **Hero Animations:** Smooth hero animations for vendor images and names when navigating to the detail screen.
- **Theme Support:** The app supports both light and dark themes, adapting to the user's system preferences.
- **Proper UI States:** Dedicated UI for loading, no results, and error states.
- **Declarative Routing:** Navigation is managed using the `go_router` package.

## Architecture

The project follows a clean architecture with a clear separation of concerns:

- **Data Layer:** Handles data fetching from a mock API service and local caching with Sqflite. The repository pattern is used to abstract data sources from the business logic.
- **Business Logic Layer:** Implemented using Flutter BLoC with Cubits (`VendorCubit` and `FavoritesCubit`) to manage the application's state.
- **Presentation Layer:** Consists of Flutter widgets that consume the state from the Cubits to render the UI.

Dependency injection is managed using `get_it`, making the components loosely coupled and easy to test.

## Setup Instructions

1. **Clone the repository:**

   git clone [\[repository-url\]](https://github.com/jaiiidiii/omne_vendor.git)

2. **Navigate to the project directory:**

    cd omne_vendor

3. **Install dependencies:**

    flutter pub get
    
4. **Generate code for models and mocks:**

    dart run build_runner build --delete-conflicting-outputs

3. **Run the app:**

    flutter run


## Assumptions Made
The vendorId is assumed to be a unique identifier for each vendor.

The faker package is used to generate image URLs and other vendor data for the mock API. In a real-world scenario, this data would come from a live API.

## Testing

Unit and widget tests are included to ensure the correctness of the business logic and UI components, 
aiming for at least 80% code coverage.