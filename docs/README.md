This `docs/` folder contains the static fallback page `reset_password.html` used by the app's password reset flow.

How it publishes:
- The repository includes a GitHub Actions workflow at `.github/workflows/publish-docs.yml` that publishes the `docs/` folder to the `gh-pages` branch whenever `main` is pushed.

Expected public URL after publish:
- https://menna-tullah-badawy.github.io/FoodDeliveryApp/reset_password.html

Replace placeholders in `lib/forgot_password_page.dart` with your username and repo if needed.
