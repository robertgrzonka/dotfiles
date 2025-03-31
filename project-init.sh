#!/bin/bash

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "❌ Please provide a project name, e.g. ./init-crafton.sh my-app"
  exit 1
fi

echo "🚀 Creating project $PROJECT_NAME..."
mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

echo "📦 Initializing npm..."
npm init -y

echo "⬇️ Installing Next.js + React + TypeScript..."
npm install next react react-dom
npm install --save-dev typescript @types/react @types/node
npx tsc --init

echo "🎨 Installing Tailwind CSS..."
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

echo "🧹 Installing ESLint + Prettier..."
npm install --save-dev eslint prettier eslint-config-next

echo "🐶 Installing Husky + lint-staged..."
npm install --save-dev husky lint-staged
npx husky install
npx husky add .husky/pre-commit "npx lint-staged"

echo "♿ Installing axe-core (WCAG)..."
npm install --save-dev @axe-core/react

echo "📁 Creating folders and boilerplate files..."
mkdir -p app components lib public styles
touch styles/globals.css

cat > tailwind.config.js <<EOL
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./app/**/*.{js,ts,jsx,tsx}", "./components/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOL

cat > styles/globals.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

cat > .prettierrc <<EOL
{
  "semi": true,
  "singleQuote": true,
  "printWidth": 100,
  "trailingComma": "all"
}
EOL

cat > app/layout.tsx <<EOL
export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body className="font-sans bg-white text-gray-900">
        <main>{children}</main>
      </body>
    </html>
  );
}
EOL

cat > app/page.tsx <<EOL
export default function HomePage() {
  return <h1 className="text-3xl font-bold">Hello Crafton 👋</h1>;
}
EOL

cat > lint-staged.config.js <<EOL
module.exports = {
  "*.{js,jsx,ts,tsx}": ["eslint --fix", "prettier --write"],
};
EOL

echo "📝 Updating package.json scripts and lint-staged..."
npx json -I -f package.json -e '
this.scripts = {
  "dev": "next dev",
  "build": "next build",
  "start": "next start",
  "lint": "next lint",
  "format": "prettier --write ."
};
this["lint-staged"] = {
  "*.{js,jsx,ts,tsx}": ["eslint --fix", "prettier --write"]
};
'

echo "✅ Project $PROJECT_NAME is ready to go!"
