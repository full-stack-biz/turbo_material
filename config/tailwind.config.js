const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    safelist: [
        {
            pattern: /prose/,
        },
    ],
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/assets/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
