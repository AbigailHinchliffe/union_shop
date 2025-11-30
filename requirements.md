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

- [❌] Static Homepage
  - [✅​] Seperate out header from main file
  - [✅​] Add AppShell usage: wrap page content with AppShell so header/footer appear
  - [✅​] Implement hero section (image, title, CTA) and declare hero asset in pubspec.yaml
  - [❌] Implement ProductCard widget and show a static list/grid of preview cards
  - [❌] Add responsive layout rules (single column on narrow, grid on wide)
  - [❌] Add placeholder CTA actions (SnackBar or Navigator to placeholder route)
  - [❌] Write one widget test verifying hero and at least one ProductCard render
  - [❌] Manual QA: test in Chrome mobile emulation and desktop widths

- [✅] About Us Page (5%)
  - [✅​] Create AboutUs widget (lib/about_us.dart) and route
  - [✅​] Wrap content with AppShell so header/footer appear
  - [✅​] Add title ("about us") and body paragraph(s)
  - [✅​] Add a placeholder image or icon and semantic labels for accessibility
  - [✅​] Add a simple back/navigation button
  - [✅] Add one widget test asserting the title and a paragraph exist

- [❌​] Footer
  - [✅​] Implement Footer widget (lib/widgets/footer.dart)
  - [✅​] Add dummy links: Search, Terms & Conditions of Sale, Contact
  - [✅] Implement placeholder handlers (SnackBar or Navigator to a stub page)
  - [✅​] Include Footer in AppShell and verify it renders on at least one page
  - [✅] Add a small interaction test for tapping one footer link
  - [❌] Test that the footer renders & exists

- [❌] Collections Page
  - [❌] Create CollectionsScreen and route (lib/screens/collections_screen.dart)
  - [❌] Define a Collection model with id, title, thumbnail, description
  - [❌] Render a list/grid of collection cards using static sample data
  - [❌] Add a UI-only filter/search input (no backend required)
  - [❌] Ensure the layout adapts responsively (cards per row vary by width)
  - [❌] Add a widget test verifying the expected number of collection cards render

- [❌] Collection Page (CollectionDetail)
  - [❌] Create CollectionDetailScreen accepting collection id/argument
  - [❌] Populate with static product cards filtered by collection id
  - [❌] Add "load more" or pagination stub (UI-only)
  - [❌] Add back-navigation and breadcrumb text
  - [❌] Add a widget test that navigates to a collection and verifies product list

- [❌] Product Page
  - [❌] Create ProductPage widget and route (accepts product id)
  - [❌] Display product images (use Image.asset for local assets), title, price, description
  - [❌] Add UI widgets: size/colour dropdowns, quantity selector (local state only)
  - [❌] Add "Add to cart" button with placeholder behaviour (SnackBar)
  - [❌] Handle missing image gracefully via errorBuilder/fallback
  - [❌] Add a widget/unit test covering product detail rendering and a widget interaction

- [❌] Sale Collection Page
  - [❌] Create SaleCollectionScreen and route
  - [❌] Filter static products for a sale flag and render ProductCard list
  - [❌] Show a sale badge or discounted price on cards
  - [❌] Add test asserting sale badge presence on at least one product

- [❌] Authentication UI (login/signup UI only)
  - [❌] Create LoginScreen and SignupScreen widgets/routes
  - [❌] Implement form fields with client-side validation messages
  - [❌] Show mock success (SnackBar) on submit with valid input
  - [❌] Add unit tests for validation logic and a widget test for the form

- [❌] Navbar (desktop + collapsed mobile menu)
  - [❌] Implement AppHeader with desktop layout (inline links) and mobile collapse
  - [❌] Add menu icon that opens a dropdown/sliding panel
  - [❌] Wire menu items to the routes for Home, Collections, About, Sale
  - [❌] Ensure header is included via AppShell so it's present on all pages
  - [❌] Add accessibility semantics and a widget test for menu open/close

### 3.2 Intermediate Features (35%) — decomposed tasks

- [ ] Dynamic Collections (fetch from service/model)
  - [ ] Create a Collection model (lib/models/collection.dart)
  - [ ] Build a LocalData service that returns collections (lib/services/local_data.dart)
  - [ ] Replace static collection data with service calls in CollectionsScreen
  - [ ] Add caching/loading state and a simple loading indicator
  - [ ] Write unit tests for the service and model parsing

- [ ] Dynamic Collection Page (populate listings)
  - [ ] Accept collection id/slug via route arguments
  - [ ] Query LocalData/service for products in the collection
  - [ ] Implement empty / error / loading states in UI
  - [ ] Add "sort by" and "filter" UI controls (UI only first)
  - [ ] Add widget tests for correct filtering/route wiring

- [ ] Functional Product Page (interactive dropdowns & counters)
  - [ ] Add Product model (lib/models/product.dart) with attributes (sizes, colours, price, onSale)
  - [ ] Load product data from LocalData/service for ProductPage
  - [ ] Implement size and colour dropdowns (local state)
  - [ ] Implement quantity selector with min/max validation
  - [ ] Update displayed price when options change (if applicable)
  - [ ] Add widget tests for interaction flows (change size/quantity)

- [ ] Shopping Cart (UI & add/view)
  - [ ] Create a Cart model and simple CartService (in-memory)
  - [ ] Implement "Add to cart" UI on ProductPage that uses CartService
  - [ ] Create a CartScreen showing items, totals and basic edit controls
  - [ ] Add persistence stub (SharedPreferences or in-memory for now)
  - [ ] Add widget tests for adding/removing items and total calculation

- [ ] Print Shack Personalisation (form & preview)
  - [ ] Create PrintShack screen with personalization form fields
  - [ ] Validate inputs and show a live preview area (UI-only rendering)
  - [ ] Implement saving/submitting stub (SnackBar or local model)
  - [ ] Add tests for form validation and preview update

- [ ] Full Navigation & Route Management
  - [ ] Centralize routes in main.dart (routes map or onGenerateRoute)
  - [ ] Ensure named routes exist for Home, Collections, CollectionDetail, Product, About, Sale, Cart
  - [ ] Add deep-link friendly route parameters (e.g., /product/:id)
  - [ ] Add widget tests that navigate between two screens

- [ ] Responsiveness polish
  - [ ] Audit layout at common breakpoints and fix overflow issues
  - [ ] Ensure lists/grids adapt columns based on MediaQuery width
  - [ ] Add responsive tests or manual checklist and verify in browser

### 3.3 Advanced Features (25%) — decomposed tasks

- [ ] Authentication System (external provider, e.g., Firebase)
  - [ ] Add auth abstraction (AuthService interface) and implement mock first
  - [ ] Add Firebase config (optional) and implement AuthServiceFirebase
  - [ ] Implement Login and Signup flows with provider integration
  - [ ] Protect pages (Cart / Checkout) behind auth guard (UI behaviour)
  - [ ] Add unit/integration tests for auth flows (mock provider)

- [ ] Cart Management (full editing & persistence)
  - [ ] Move CartService to a persistent storage (SharedPreferences / local DB / Firestore)
  - [ ] Implement quantity editing, item removal and saved cart across sessions
  - [ ] Add estimated totals, VAT/shipping calc stubs
  - [ ] Add tests verifying persistence and edit behaviours

- [ ] Search System (navbar/footer search + results)
  - [ ] Implement a SearchService using LocalData initially
  - [ ] Add search input in header and footer with debounce
  - [ ] Create SearchResultsScreen that accepts a query and shows results
  - [ ] Support filtering/sorting in results (UI)
  - [ ] Add widget tests for search input → results flow

- [ ] Checkout / Order flow (UI-only or stubbed)
  - [ ] Implement CheckoutScreen that summarizes cart and captures address
  - [ ] Add validation and summary confirmation step
  - [ ] Implement an order-success screen (no real payments)
  - [ ] Add tests for checkout validation and success flow

- [ ] Monitoring, Logging & CI
  - [ ] Add basic error reporting/logging hooks (print or logging package)
  - [ ] Add CI workflow to run flutter analyze and tests on push
  - [ ] Add a small end-to-end checklist for manual verification before submission

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
