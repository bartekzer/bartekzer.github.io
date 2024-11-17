/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./article/*.html", "index.html"],
  theme: {
    fontFamily: {
      sans: ["Inter", "sans-serif"],
      serif: ["Source Serif 4", "Georgia", "Times New Roman", "serif"],
      mono: ["monospace"],
    },
  },
  plugins: [],
}

