# Flutter Fiscal Focus Application

A user-friendly Flutter application designed to compare expenses and income, providing valuable financial insights and helping users maintain a balanced budget.

## Features

### 1. **User Onboarding and Login**
- Onboarding screens for new users.
- Login form with test validation.

### 2. **Navigation Bar**
After logging in, users can navigate between the following pages:
- **Home:**
  - Displays total income and expense amounts.
  - Shows recently added expenses.
- **Transaction:**
- View income and expenses and delete them by dragging from start to end (using the Dismissible widget).
- **Add:**
  - Dedicated section to add new income or expense entries easily.
- **Budget:**
  - View income and expenses in two separate pie charts for better visualization.
- **Profile:**
  - Displays user profile details.
- Includes a logout option that clears all user data and redirects to the onboarding screens.

### 3. **Backend Functionality**
- Data persistence is implemented using `SharedPreferences` to save and retrieve user details and transactions.
- Logout functionality removes all saved data and ensures a fresh start for the next session.

### 4. **System Screenshots**
