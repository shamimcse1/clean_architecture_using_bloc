# E-Commerce App

This e-commerce application is built using Flutter with BLoC (Business Logic Component) and clean architecture. It fetches product data from [Fake Store API](https://fakestoreapi.com/products) and displays it in a grid format. The app also includes local storage using SQLite.


## Features

- Fetch product data from a remote API
- Display products in a grid format
- Local storage using SQLite
- Clean architecture with BLoC for state management

## Installation

To run this project locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/shamimcse1/clean_architecture_using_bloc.git
   cd clean_architecture_using_bloc
    ```

1. Install dependencies:

 ```bash
   flutter pub get
  ```
2. Run the app:

 ```bash
   flutter run
  ```

# Usage
Once the app is running, it will display a grid of products fetched from the Fake Store API. You can scroll through the products and see details such as the product image, title, and price.

# Project Structure
The project follows a clean architecture structure with separation of concerns. Below is an overview of the project structure:

```bash
   lib/
├── data/
│   ├── datasource/
│   │   ├── local/
│   │   │   └── product_local_data_source.dart
│   │   └── remote/
│   │       └── product_remote_data_source.dart
│   ├── models/
│   │   └── product_model.dart
│   └── repositories/
│       └── product_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── product.dart
│   ├── repositories/
│   │   └── product_repository.dart
│   └── usecases/
│       └── get_products.dart
├── di/
│   ├── injection_container
│ 
├── presentation/
│   ├── bloc/
│   │   └── product_bloc.dart
│   ├── pages/
│   │   └── product_page.dart
│   └── widgets/
│       └── product_grid.dart
├── main.dart
└── injection_container.dart
```

# Data
- datasource: Contains remote and local data sources.
- local: Implements local storage using SQLite.
- remote: Fetches data from the Fake Store API.
- models: Contains data models.
- repositories: Implements repository pattern.

# Domain
- entities: Contains core entities.
- repositories: Defines repository interfaces.
- usecases: Contains use cases for the application.

# Dependency Injection
- injection_container.dart

# Presentation
- bloc: Contains BLoC for state management.
- pages: Contains UI pages.
- widgets: Contains reusable UI components.
- main.dart
- Entry point of the application.
- Configures dependency injection using GetIt.



# Dependencies
- Flutter
- flutter_bloc
- http
- sqflite
- path_provider
- provider
- get_it

