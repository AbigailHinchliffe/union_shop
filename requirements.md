# Union Shop – Flutter Coursework Requirements Document
## 1. Overview

This application is a Flutter recreation of the Student Union e-commerce site (shop.upsu.net).
It is built from the provided starter repository and extended with new pages, models, widgets, and functionality to match as many features of the real website as possible.
The project will be demonstrated live and submitted as a GitHub repository link on Moodle. 

## 2. Scope
### 2.1 In Scope

* Reimplementation of Union Shop features using Flutter (mobile-first, responsive).
* Creation of static, intermediate, and advanced pages as defined in marking criteria. 
* Integration of external cloud services (e.g., Firebase Authentication, Firestore, hosting).
* Git version control workflow.
* Written tests for key widgets/pages.
* A rewritten README documenting features, setup, and cloud integrations.

## 3. Functional Requirements

(Organised according to marking criteria: Basic → Intermediate → Advanced.)

### 3.1 Basic Features (40%)​

- [✅] Static Homepage (5%)
  - [✅​] Seperate out header from main file
  - [✅​] Add AppShell usage: wrap page content with AppShell so header/footer appear
  - [✅​] Implement hero section (image, title, CTA) and declare hero asset in pubspec.yaml
  - [✅] Implement ProductCard widget and show a static list/grid of preview cards
  - [✅] Add responsive layout rules (single column on narrow, grid on wide)
  - [✅] Add placeholder CTA actions (SnackBar or Navigator to placeholder route)
  - [✅] Write one widget test verifying hero and at least one ProductCard render
  - [✅] Manual QA: test in Chrome mobile emulation and desktop widths
  - [✅] Add Carousel feature for homepage

- [✅] About Us Page (5%)
  - [✅​] Create AboutUs widget (lib/about_us.dart) and route
  - [✅​] Wrap content with AppShell so header/footer appear
  - [✅​] Add title ("about us") and body paragraph(s)
  - [✅​] Add a placeholder image or icon and semantic labels for accessibility
  - [✅​] Add a simple back/navigation button
  - [✅] Add one widget test asserting the title and a paragraph exist

- [✅] Footer (4%)
  - [✅​] Implement Footer widget (lib/widgets/footer.dart)
  - [✅​] Add dummy links: Search, Terms & Conditions of Sale, Contact
  - [✅] Implement placeholder handlers (SnackBar or Navigator to a stub page)
  - [✅​] Include Footer in AppShell and verify it renders on at least one page
  - [✅] Add a small interaction test for tapping one footer link
  - [✅] Test that the footer renders & exists

- [✅] Collections Page (5%)
  - [✅] Create CollectionsScreen and route (lib/screens/collections_screen.dart)
  - [✅] Define a Collection model with id, title, thumbnail, description
  - [✅] Render a list/grid of collection cards using static sample data
  - [✅] Ensure the layout adapts responsively (cards per row vary by width)
  - [✅] Add a widget test verifying the expected number of collection cards render

- [✅] Collection Page (CollectionDetail) (5%)
  - [✅] Add a UI-only filter/search input (no backend required)
  - [✅] Create CollectionDetailScreen accepting collection id/argument
  - [✅] Populate with static product cards filtered by collection id
  - [✅] Add "load more" or pagination stub (UI-only)
  - [✅] Add back-navigation and breadcrumb text
  - [✅] Add a widget test that navigates to a collection and verifies product list

- [✅] Product Page (4%)
  - [✅] Create ProductPage widget and route (accepts product id)
  - [✅] Display product images (use Image.asset for local assets), title, price, description
  - [✅] Add UI widgets: size dropdowns, quantity selector (local state only)
  - [✅] Add "Add to cart" button with placeholder behaviour (SnackBar)
  - [✅] Handle missing image gracefully via errorBuilder/fallback
  - [✅] Add a widget/unit test covering product detail rendering and a widget interaction

- [✅] Sale Collection Page (3%)
  - [✅] Create SaleCollectionScreen and route
  - [✅] Filter static products for a sale flag and render ProductCard list
  - [✅] Show a sale badge or discounted price on cards
  - [✅] Add test asserting sale badge presence on at least one product

- [✅] Authentication UI (login/signup UI only) (4%)
  - [✅] Create LoginScreen and SignupScreen widgets/routes
  - [✅] Show mock success (SnackBar) on submit with valid input
  - [✅] Add a widget test for the form

- [✅] Navbar (desktop + collapsed mobile menu) (5%)
  - [✅] Implement AppHeader with desktop layout (inline links) and mobile collapse
  - [✅] Add menu icon that opens a dropdown/sliding panel
  - [✅] Wire menu items to the routes for Home, Collections, About, Sale
  - [✅] Ensure header is included via AppShell so it's present on all pages
  - [✅] Add a widget test for menu open/close
  - [✅] Add slider panel for shop features - Sale, Collections, Products

### 3.2 Intermediate Features (35%)

- [❌] Dynamic Collections Page (6%) - Collections page populated from data models or services with functioning sorting, filtering, pagination widgets
  - [❌] Move Collection model to lib/models/collection.dart
  - [❌] Create data service in lib/services/ that provides collections
  - [❌] Replace hardcoded collections list with service/model calls
  - [❌] Implement sorting widget (alphabetical, by category, etc.)
  - [❌] Implement filtering widget
  - [❌] Implement pagination controls (page numbers, next/prev buttons)
  - [❌] Write unit tests for the service and widget interactions
  - [❌] Verify all widgets function correctly with dynamic data

- [⚠️] Dynamic Collection Page (6%) - Product listings of a collection populated from data models or services with functioning sorting, filtering, pagination widgets
  - [❌] Move Product model to lib/models/product.dart with full attributes (sizes, colors, price)
  - [❌] Create/extend data service to provide products by collection
  - [✅] Implement functioning sort widgets (A-Z, Z-A, Price Low-High, Price High-Low)
  - [✅] Implement functioning filter widgets (price range: All, Under £10, £10-£25, £25-£50, Over £50)
  - [✅] Implement pagination controls that work with filtered/sorted data (page dropdown with "of X")
  - [❌] Write widget tests for sorting, filtering, and pagination
  - [✅] Verify UI updates correctly when filters/sorts change

- [⚠️] Functional Product Pages (6%) - Product pages populated from data models or services with functioning dropdowns and counters (add to cart buttons do not have to work yet)
  - [❌] Load product data dynamically from service/model using product ID
  - [❌] Implement size dropdown that updates based on product availability
  - [❌] Implement color dropdown (if applicable) with visual indicators
  - [✅] Implement quantity counter with +/- buttons and manual input (dropdown 1-10)
  - [✅] Add min/max validation (min: 1, max: available stock)
  - [✅] Add "Add to Cart" button (can show placeholder behavior)
  - [❌] Update price display when quantity changes
  - [❌] Write widget tests for dropdown interactions and quantity changes
  - [❌] Verify all interactive elements function correctly

- [❌] Shopping Cart (no specific % listed) - Add items to cart, view cart page, basic cart functionality (checkout buttons should place order without real monetary transactions)
  - [❌] Create Cart model (lib/models/cart.dart) and CartItem model
  - [❌] Create CartService (lib/services/cart_service.dart) for cart management
  - [❌] Implement "Add to Cart" functionality on ProductPage
  - [❌] Create CartScreen (lib/screens/cart_screen.dart) displaying cart items
  - [❌] Show item details (image, name, size, color, quantity, price)
  - [❌] Implement quantity editing in cart (increase/decrease)
  - [❌] Implement item removal from cart
  - [❌] Calculate and display subtotal, tax, and total
  - [❌] Add "Checkout" button (can be placeholder or simple order confirmation)
  - [❌] Write widget tests for add/remove/edit operations
  - [❌] Write tests for total calculation accuracy

- [❌] Print Shack Personalisation (3%) - Text personalisation page with associated about page, the form must dynamically update based on selected fields
  - [❌] Create PrintShackScreen (lib/screens/print_shack_screen.dart)
  - [❌] Create associated "About Print Shack" page with information
  - [❌] Add form fields: text input, font selection, color picker, position selection
  - [❌] Implement live preview area showing personalization in real-time
  - [❌] Dynamic form updates - show/hide fields based on product type
  - [❌] Add validation (character limits, required fields)
  - [❌] Implement "Add to Cart" with personalization data
  - [❌] Style preview to match actual product appearance
  - [❌] Write tests for form validation and preview updates
  - [❌] Test that form dynamically changes based on selected options

- [✅] Navigation (3%) - Full navigation across all pages; users should be able to navigate using buttons, navbar, and URLs
  - [✅] Centralize route definitions in main.dart (named routes map exists)
  - [✅] Implement navigation via navbar links (header/footer work with dropdown menu)
  - [✅] Implement navigation via buttons on all pages (Home, Collections, Products, Sale, About)
  - [✅] Support deep linking with URL navigation (route parameters: collectionId, collectionTitle)
  - [✅] Add breadcrumb navigation where appropriate (Back to Collections button)
  - [✅] Implement back navigation that maintains state (Navigator.pop, Navigator.push)
  - [✅] Write widget tests for navigation flows
  - [✅] Test that URLs work correctly for all routes
  - [✅] Verify users can navigate entire app without getting stuck

- [✅] Responsiveness (5%) - The layout of the application should be adaptive, and the application should function on desktop in addition to mobile view (no need to test it on real devices)
  - [✅] Audit all pages at mobile breakpoint (< 600px width)
  - [✅] Audit all pages at tablet breakpoint (600-1024px width)
  - [✅] Audit all pages at desktop breakpoint (> 1024px width)
  - [✅] Fix any overflow issues at all breakpoints
  - [✅] Ensure grid/list layouts adapt column count based on width (MediaQuery: > 600 ? 2 : 1)
  - [✅] Adjust font sizes and spacing for different screen sizes
  - [✅] Test navigation menu (hamburger on mobile via DropDown, full nav on desktop)
  - [✅] Ensure images scale appropriately (fit: BoxFit.cover)
  - [✅] Test in Chrome DevTools device emulation (mobile and desktop)
  - [✅] Verify all interactive elements are accessible at all sizes
  - [✅] Write responsive widget tests or document manual testing (responsive tests exist)

### 3.3 Advanced Features (25%) — decomposed tasks

- [❌] Authentication System (external provider, e.g., Firebase)
  - [❌] Add auth abstraction (AuthService interface) and implement mock first
  - [❌] Add Firebase config (optional) and implement AuthServiceFirebase
  - [❌] Implement Login and Signup flows with provider integration
  - [❌] Protect pages (Cart / Checkout) behind auth guard (UI behaviour)
  - [❌] Add unit/integration tests for auth flows (mock provider)

- [❌] Cart Management (full editing & persistence)
  - [❌] Move CartService to a persistent storage (SharedPreferences / local DB / Firestore)
  - [❌] Implement quantity editing, item removal and saved cart across sessions
  - [❌] Add estimated totals, VAT/shipping calc stubs
  - [❌] Add tests verifying persistence and edit behaviours

- [❌] Search System (navbar/footer search + results)
  - [❌] Implement a SearchService using LocalData initially
  - [❌] Add search input in header and footer with debounce
  - [❌] Create SearchResultsScreen that accepts a query and shows results
  - [❌] Support filtering/sorting in results (UI)
  - [❌] Add widget tests for search input → results flow

- [❌] Checkout / Order flow (UI-only or stubbed)
  - [❌] Implement CheckoutScreen that summarizes cart and captures address
  - [❌] Add validation and summary confirmation step
  - [❌] Implement an order-success screen (no real payments)
  - [❌] Add tests for checkout validation and success flow

- [❌] Monitoring, Logging & CI
  - [❌] Add basic error reporting/logging hooks (print or logging package)
  - [❌] Add CI workflow to run flutter analyze and tests on push
  - [❌] Add a small end-to-end checklist for manual verification before submission

Notes
- Implement features incrementally; each subtask should be a small commit with tests where feasible.
- Prioritise intermediate features that unlock others (models/services, navigation, cart) before advanced features that depend on them.

---

## 4. Non-Functional Requirements

* **Responsiveness:** Mobile-first layout that adapts to desktop dimensions. 
* **Performance:** Quick navigation; efficient state management.
* **Maintainability:** Clean code structure, properly refactored, no warnings/errors. 
* **Usability:** Simple and intuitive UI, consistent with coursework expectations.
* **Reliability:** Functional navigation, robust form handling, predictable app behaviour.
* **Security:** Secure authentication flows (if implementing advanced features).

---

## 5. System Architecture / Design Overview

lib/
 ├── main.dart
 ├── about_us.dart
 ├── product_page.dart
 ├── widgets/
 │   ├── header.dart
 │   ├── footer.dart
 │   ├── dropdown_menu.dart
 │   └── appshell.dart
 assets/
 └── images
     ├── portsunijersey.jpg   
     ├── purplehoodie.web
     ├── customhoodie.jpg  
     ├── purpletshirt.jpg
     ├── whitebeanie.jpg 
     └── blackjoggers.jpg
test/
 ├── widget_tests/
 │   ├── 
 │   └── 
 ├── home_test.dart
 └── product_test.dart
pubspec.yaml
README.md
analysis_options.yaml
.github/
 └── workflows/ci.yml

Reference the starter structure: homepage + product page + tests. 

---

## 6. Assumptions

* Dummy/hardcoded data is allowed for all basic features. 
* AI-generated images are allowed. 

---

## 7. Constraints

* Must fork and use the provided GitHub repo; name must be `union_shop`. 
* Must run in Chrome with mobile view.
* Must not change the repository after 5/12/2025. 

---

## 8. Risks & Mitigation

| Risk                         | Impact                             | Mitigation                                                                    |
| ---------------------------- | ---------------------------------- | ----------------------------------------------------------------------------- |
| Falling behind on worksheets | Cannot implement required features | Work simultaneously with worksheets; start early                              |
| Git mistakes                 | Lost work or broken repo           | Frequent small commits; use `git reset` when needed; fork again if necessary  |
| Over-focusing on design      | Loss of marks on functionality     | Prioritize Basic → Intermediate → Advanced                                    |
| Poor testing                 | Lose marks on 25% practices        | Write tests gradually                                                         |

---

## 9. Deliverables

* Public GitHub repository link (submitted to Moodle).
* Working Flutter application (demoed live).
* README with documentation and cloud service integration.
* Test files covering most of the application.

---

## 10. References

* Coursework PDF (2025) 
* Flutter Worksheets (Module Homepage)
* Flutter documentation
