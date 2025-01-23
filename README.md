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
---
- **Onboarding Screens:**
<p align="center">
  <img src="https://github.com/user-attachments/assets/ed31a14e-8722-4b76-a1d0-c4a02fb3df65" alt="Screenshot 1" width="175">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/4f2967b2-8803-4f59-a345-aff3b3d09473" alt="Screenshot 2" width="175">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/54fb9767-6857-4a42-b7b1-124bdb142c3d" alt="Screenshot 3" width="175">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/f4f9f3f4-a4a0-4e40-b2a7-f294bccb1c98" alt="Screenshot 4" width="178">
</p>

---
- **Main Screens:**
<p align="center">
  <img src="https://github.com/user-attachments/assets/78e1ffd9-8814-45fa-8926-ed5dfc29cfc2" alt="Screenshot 1" width="175">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/c3c35508-d900-4dd8-95a8-dd7f4729906d" alt="Screenshot 2" width="179">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/ff84e96c-7d0f-4c32-a363-062da0487411" alt="Screenshot 4" width="177">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/5310b17e-96f7-4e58-83c8-f06d36d741d9" alt="Screenshot 1" width="175">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/ad8d6c85-b08e-4c16-8426-a0e625633195" alt="Screenshot 2" width="176">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/b1afe39d-4cf9-4a93-91db-adc341d22581" alt="Screenshot 3" width="174">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/2f4740ea-36b4-4b5f-981f-3e3d470f9c02" alt="Screenshot 4" width="173">
</p>
