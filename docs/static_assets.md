# Static Assets

- [Development](#development)
- [CSS Styling](#css-styling)

## Development

If you have images, js, css, or other static assets that logically belong to the root project rather than a particular app, then you should place them into [cookiecutter_niicck_django/base/static/base](cookiecutter_niicck_django/base/static/base). Otherwise, place them within their appropriate app.

If there are any necessary compiled static assets for local development (such as compiled tailwindcss), they should be outputted to `local/static/`. No content in the `local/` directory is git commited. Locally uploaded media lives in `local/media/`.

## CSS Styling

This project uses [tailwind](https://tailwindcss.com/) to handle css styling.

If you want to create your own css files in addition to what tailwind provides, you can import them into the main.css file:
[cookiecutter_niicck_django/base/static/base/css/main.css](../cookiecutter_niicck_django/base/static/base/css/main.css). See the tailwind [documentation](https://tailwindcss.com/docs/using-with-preprocessors#build-time-imports) if you have more questions about importing css files.
