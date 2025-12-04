# Union Shop 🛍️

A Flutter-based mobile e-commerce application reimagining the University of Portsmouth Student Union shop. This project provides a modern, mobile-first shopping experience with responsive design and intuitive navigation.

## 📱 About The Project

Union Shop is a Flutter recreation of the Student Union e-commerce website (shop.upsu.net). The application features a complete shopping experience including product browsing, collections, search functionality, and user authentication.

### ✨ Key Features

- **Responsive Design**: Mobile-first approach with responsive layouts that adapt to different screen sizes
- **Product Browsing**: Browse products through an intuitive card-based interface with grid/list views
- **Collections**: Organized product collections including Essentials, Sale items, and more
- **Hero Carousel**: Eye-catching carousel showcasing featured products and promotions
- **Navigation**: Seamless navigation with custom header, footer, and routing system
- **About Us Page**: Information about the union shop and its mission
- **AppShell Architecture**: Consistent header and footer across all pages

---

## 🚀 Installation and Setup

### Prerequisites

Before you begin, ensure you have the following installed:

- **Operating System**: Windows, macOS, or Linux
- **Flutter SDK**: Version 2.17.0 or higher
- **Dart SDK**: Included with Flutter
- **Git**: For version control
- **IDE**: Visual Studio Code (recommended) or Android Studio
- **Web Browser**: Google Chrome (recommended for testing)

#### For University of Portsmouth Computers

1. Open [AppsAnywhere](https://appsanywhere.port.ac.uk/sso)
2. Launch the following applications in order:
   - Git
   - Flutter And Dart SDK
   - Visual Studio Code

### Verify Your Setup

After installing Flutter, verify your setup by running:

```bash
flutter doctor
```

This command checks your environment and displays a report of the status of your Flutter installation.

### Clone the Repository

```bash
git clone https://github.com/AbigailHinchliffe/union_shop.git
cd union_shop
```

### Install Dependencies

Your editor should automatically prompt you to install the required dependencies when you open the project. If not, open the integrated terminal and run:

```bash
flutter pub get
```

### Run the Application

This application is designed to run on the **web** and should be viewed in **mobile view** using your browser's developer tools.

#### Option 1: Run from Command Line

```bash
flutter run -d chrome
```

#### Option 2: Run from Visual Studio Code

1. Open `lib/main.dart`
2. Press `F5` or select "Run > Start Debugging"
3. Select Chrome as the target device

### View in Mobile Mode

Once the app is running in Chrome:

1. Open Chrome DevTools by pressing `F12` or right-clicking and selecting "Inspect"
2. Click the "Toggle device toolbar" button (or press `Ctrl+Shift+M`)
3. Select a mobile device preset from the Dimensions menu (e.g., iPhone 12 Pro, Pixel 5)

---

## 📖 Usage Instructions

### Main Features

#### Home Screen
- **Hero Carousel**: Browse featured products and promotions by swiping through the carousel
- **Product Grid**: Scroll through available products displayed in a responsive grid layout
- **Quick Actions**: Tap on product cards to view details (feature in development)

#### Navigation
- **Header Menu**: Access different sections via the hamburger menu or navigation buttons
- **Collections**: Browse products by category (Essentials, Sale, All Products)
- **Search**: Use the search box in the header to find specific products
- **Footer Links**: Quick access to important pages and information

#### Collections Screen
- View all available product collections
- Each collection displays its name
- Tap on a collection to view its products

#### About Us Page
- Learn about the Union Shop
- Access via the header navigation menu

### User Flows

1. **Browsing Products**
   - Start on the home screen
   - Scroll through the product grid or carousel
   - Use collections to filter by category

2. **Searching for Products**
   - Tap the search icon in the header
   - Enter product name or keyword
   - View filtered results

3. **Exploring Collections**
   - Navigate to Collections from the menu
   - Select a collection to view its products
   - Return to home using the back button or header navigation

### Running Tests

The project includes comprehensive test coverage for widgets and screens.

#### Run All Tests

```bash
flutter test
```

#### Run Tests with Coverage

```bash
flutter test --coverage
```

#### Run Specific Test Files

```bash
flutter test test/home_test.dart
flutter test test/widget_tests/
```

The test suite includes:
- Home screen tests
- Product widget tests
- Screen functionality tests
- Widget interaction tests

---

## 🏗️ Project Structure

```
union_shop/
├── lib/
│   ├── main.dart                 # Application entry point and routing
│   ├── about_us.dart            # About Us page
│   ├── product_page.dart        # Product detail page
│   ├── models/                  # Data models
│   ├── screens/                 # App screens
│   │   ├── collections_screen.dart
│   │   ├── collection_detail.dart
│   │   └── login_screen.dart
│   └── widgets/                 # Reusable widgets
│       ├── appshell.dart        # Main layout wrapper
│       ├── header.dart          # App header/navigation
│       ├── footer.dart          # App footer
│       ├── hero_carousel.dart   # Homepage carousel
│       ├── dropdown_menu.dart   # Dropdown navigation
│       └── search_box.dart      # Search functionality
├── test/                        # Test files
│   ├── home_test.dart
│   ├── product_test.dart
│   ├── screen_tests/
│   └── widget_tests/
├── assets/
│   └── images/                  # Image assets
├── pubspec.yaml                 # Dependencies and configuration
└── README.md                    # This file
```

### Key Files

- **`main.dart`**: Defines the app structure, theme, and routing configuration
- **`appshell.dart`**: Provides consistent layout with header and footer
- **`hero_carousel.dart`**: Implements the homepage carousel feature
- **`collections_screen.dart`**: Displays available product collections
- **`collection_detail.dart`**: Shows products within a specific collection

### Technologies Used

#### Framework & Language
- **Flutter**: Version 2.17.0+ - Cross-platform UI framework
- **Dart**: Programming language for Flutter development

#### Key Dependencies
- **flutter**: Core Flutter SDK
- **cupertino_icons**: iOS-style icons

#### Development Tools
- **flutter_test**: Testing framework
- **flutter_lints**: Code quality and style linting

#### UI Components
- Material Design components
- Custom widgets for consistent UI/UX
- Responsive layout utilities

---

## ⚠️ Known Issues and Limitations

### Current Limitations

1. **Product Details**: Product detail page is partially implemented - tapping on product cards shows placeholder content
2. **User Authentication**: Login screen exists but authentication is not yet fully integrated
3. **Shopping Cart**: Cart functionality is planned but not yet implemented
4. **Payment Processing**: Checkout and payment features are not implemented
5. **Static Data**: Products are currently hardcoded - database integration planned

### Future Improvements

- [ ] Complete product detail pages with full information
- [ ] Implement user authentication with Firebase Auth
- [ ] Add shopping cart functionality with persistent storage
- [ ] Integrate with backend API for dynamic product data
- [ ] Implement favorites/wishlist feature
- [ ] Add product reviews and ratings
- [ ] Implement order tracking
- [ ] Add user profile management
- [ ] Optimize image loading and caching
- [ ] Improve accessibility features

### Known Bugs

- Search functionality may not filter all product attributes
- Some layout issues on very small screens (< 320px width)

---

## 👤 Contact Information

**Developer**: Abigail Hinchliffe  
**University**: University of Portsmouth  
**Course**: Computer Science (2nd Year)  
**Module**: Programming Applications & Programming Languages
**Project**: Union Shop Flutter Application

### Links

- **GitHub Repository**: [github.com/AbigailHinchliffe/union_shop](https://github.com/AbigailHinchliffe/union_shop)
- **GitHub Profile**: [github.com/AbigailHinchliffe](https://github.com/AbigailHinchliffe)

---

## 📝 License

This project is developed as coursework for the University of Portsmouth and is intended for educational purposes.

---

*Last Updated: December 2025*



