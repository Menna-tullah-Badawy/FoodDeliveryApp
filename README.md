# Food Delivery App with Password Reset

This Flutter app includes:
- Supabase authentication (login, register, forgot password)
- Password reset flow with GitHub Pages fallback
- Deep link handling to return users to the app

## Password Reset Setup

The password reset page is located in `docs/reset_password.html` and should be published to GitHub Pages at:
https://menna-tullah-badawy.github.io/FoodDeliveryApp/reset_password.html

## To Enable GitHub Pages:

1. Go to your repository: https://github.com/Menna-tullah-Badawy/FoodDeliveryApp
2. Click **Settings** tab
3. Scroll down to **Pages** section
4. Under **Source**, select:
   - **Deploy from a branch**
   - Branch: **gh-pages**
   - Folder: **/ (root)**
5. Click **Save**

## GitHub Actions Workflow

The `.github/workflows/publish-docs.yml` file automatically:
- Triggers on pushes to `main` branch
- Publishes the `docs/` folder to `gh-pages` branch
- Makes the reset page available on GitHub Pages

## Testing the Flow

1. Run the app
2. Go to login screen
3. Click "Forgot Password?"
4. Enter your email
5. Check your email for the reset link
6. Click the link - it should open the GitHub Pages fallback
7. The page should attempt to open your app
8. App should navigate to the password update screen

## Current Status

- ✅ Code is uploaded to GitHub
- ⚠️ GitHub Pages needs to be enabled manually
- ⚠️ Test the reset flow after GitHub Pages is live
