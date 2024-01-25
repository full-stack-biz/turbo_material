const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    safelist: [
        {
            pattern: /prose/,
        },
    ],
    content: [
        './app/assets/stylesheets/**/*.css',
        './app/views/**/*.html.erb'
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
