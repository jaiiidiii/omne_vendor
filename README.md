# OmneVendor Technical Assessment

This project is a technical assessment for the role of Flutter Developer at Omnesoft. It implements a cross-platform (Android, iOS) mobile application for searching and viewing vendor details.

## Screenshots

A screenshot of the main vendor list with the search bar.

<img width="540" height="1200" alt="Screenshot_1754778598" src="https://github.com/user-attachments/assets/f2496200-641e-4447-a894-edc8a5bec10c" /><img width="540" height="1200" alt="Simulator Screenshot - iPhone 16 Pro Max - 2025-08-10 at 04 40 31" src="https://github.com/user-attachments/assets/71f08a2d-1695-430b-a480-b366a4f957f9" />



A screenshot of the vendor detail screen showing hero animations.

<img width="540" height="1200" alt="Screenshot_1754778606" src="https://github.com/user-attachments/assets/98d29e30-04c3-4519-8712-5e7117b0c09d" />    <img width="540" height="1200" alt="Simulator Screenshot - iPhone 16 Pro Max - 2025-08-10 at 04 40 50" src="https://github.com/user-attachments/assets/5cbfba54-1b70-49af-933a-78d86d42942e" />



A short GIF demonstrating the app's key features, including search and favorites.

![omneapp](https://github.com/user-attachments/assets/8341fdd6-2cc5-4096-ac2e-523e117b80de)


## Features

- **Vendor Search:** A real-time, debounced search bar to filter vendors by name.
- **Pull-to-Refresh:** Users can pull down on the vendor list to refresh the data from the API.
- **Offline Caching:** Vendor data is cached locally using Sqflite, allowing the app to function offline and providing a better user experience.
- **Favorites:** Users can mark vendors as favorites, with the state persisted locally using Sqflite.
- **Hero Animations:** Smooth hero animations for vendor images and names when navigating to the detail screen, enhancing the app's polished feel.
- **Theme Support:** The app supports both light and dark themes, adapting to the user's system preferences, and provides a way for users to manually switch the theme mode.
- **Proper UI States:** Dedicated UI for loading, no results, and error states.
- **Declarative Routing:** Navigation is managed using the `go_router` package, which provides a URL-based, deep-linkable approach that is ideal for complex navigation flows.

## Architecture

The project adheres to a clean architecture with a clear separation of concerns, resulting in a modular, testable, and maintainable codebase.

- **Data Layer:** Handles data fetching from a mock API service and local caching with Sqflite. The repository pattern is used to abstract data sources from the business logic.
- **Business Logic Layer:** Implemented using Flutter BLoC with Cubits (`VendorCubit` and `FavoritesCubit`) to manage the application's state.
- **Presentation Layer:** Consists of Flutter widgets that consume the state from the Cubits to render the UI.

Dependency injection is managed using `get_it`, making the components loosely coupled and easy to test by allowing them to be swapped out as needed.

## Setup Instructions

1. **Clone the repository:**

   git clone https://github.com/jaiiidiii/omne_vendor.git

2. **Navigate to the project directory:**

    cd omne_vendor

3. **Install dependencies:**

    flutter pub get
    
4. **Generate code for models and mocks:**

    dart run build_runner build --delete-conflicting-outputs

5. **Run the app:**

    flutter run


## Assumptions Made
The vendorId is assumed to be a unique identifier for each vendor.

The faker package is used to generate image URLs and other vendor data for the mock API. In a real-world scenario, this data would come from a live API.

## Testing

Unit and widget tests are included to ensure the correctness of the business logic and UI components.

Unit Tests: Verify that the Cubits correctly handle state changes and business logic.

Widget Tests: Confirm that UI components render correctly, display the right data, and respond as expected to user interactions.
