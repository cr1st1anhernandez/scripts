#!/bin/bash

# Instalación de dependencias
npm install -D prettier prettier-plugin-tailwindcss eslint eslint-config-prettier tailwindcss postcss autoprefixer

# Configuración de ESLint
npx eslint --init

# Creación del archivo eslintrc.json
echo '{
  "env": {
    "browser": true,
    "es2021": true
  },
  "extends": [
    "next/core-web-vitals",
    "standard-with-typescript",
    "plugin:react/recommended",
    "prettier"
  ],
  "parserOptions": {
    "ecmaVersion": "latest",
    "sourceType": "module"
  },
  "plugins": ["react"],
  "rules": {
    "react/react-in-jsx-scope": "off",
    "react/prop-types": "off"
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  }
}' > .eslintrc.json


# Creación del archivo .prettierrc.json
echo '{
  "semi": false,
  "singleQuote": true,
  "plugins": [
    "prettier-plugin-tailwindcss"
  ]
}' > .prettierrc.json

# Creación del archivo .prettierignore
echo '.next' > .prettierignore

# Agregando Prettier como una dependencia de desarrollo
npm add prettier -D

# Instalación de lint-staged con mrm
npx mrm lint-staged

echo 'Setup completado con éxito.'
