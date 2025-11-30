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

### 3.1 Basic Features (40%)

| Feature              | Description                            | Requirement Notes                          |
| -------------------- | -------------------------------------- | ------------------------------------------ |
| Static Homepage      | Homepage layout and widgets            | Hardcoded data acceptable                  |
| About Us Page        | Separate static page                   | Hardcoded text acceptable                  |
| Footer               | Footer with dummy links                | Shown on at least one page                 |
| Collections Page     | Shows list of product collections      | Static/dummy data                          |
| Collection Page      | Shows products within a collection     | Filters/dropdowns not required to function |
| Product Page         | Shows product details & widgets        | Widgets do not need to work                |
| Sale Collection Page | Shows on-sale items                    | Dummy data allowed                         |
| Authentication UI    | Login/signup UI only                   | Non-functional                             |
| Navbar               | Desktop navbar + collapsed mobile menu | Links don't need to work                   |

### 3.2 Intermediate Features (35%)

| Feature                     | Description                             | Requirement Notes                      |
| --------------------------- | --------------------------------------- | -------------------------------------- |
| Dynamic Collections         | Fetched from model/service              | Sorting/filtering/pagination must work |
| Dynamic Collection Page     | Product listings dynamically populated  | Functional widgets                     |
| Functional Product Page     | Interactive dropdowns & counters        | No need to add to cart yet             |
| Shopping Cart               | Add to cart, view cart, simple checkout | No real payment needed                 |
| Print Shack Personalisation | Dynamic form updates                    | Includes related “About”               |
| Navigation                  | Full page-to-page navigation            | Navbar + buttons + URLs                |
| Responsiveness              | App adapts to desktop and mobile        | Chrome DevTools view recommended       |

### 3.3 Advanced Features (25%)

| Feature               | Description                                               |
| --------------------- | --------------------------------------------------------- |
| Authentication System | Full login system with external provider (e.g., Firebase) |
| Cart Management       | Quantity editing, removal, price updates, persistence     |
| Search System         | Search via navbar/footer, dynamic results                 |

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
