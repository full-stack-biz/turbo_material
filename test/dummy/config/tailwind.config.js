const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    content: [
        { raw: '<div class="!flex-row !flex-wrap !grow !grow-0 !h-fit !h-full !h-max !hidden !max-h-0 !min-h-[14rem] !min-w-[36rem] !pt-8 !relative !text-white !top-6 !w-fit !w-full block capitalize fixed flex flex-col flex-row font-sans grid hidden items-center items-start justify-between max-h-64 max-w-prose mdc-notched-outline__leading mdc-notched-outline__notch mdc-notched-outline__trailing mx-auto overflow-y-auto p-2 pl-2 prose prose-2xl prose-amber prose-base prose-blue prose-cyan prose-emerald prose-fuchsia prose-gray prose-green prose-indigo prose-invert prose-lg prose-lime prose-neutral prose-orange prose-pink prose-purple prose-red prose-rose prose-sky prose-slate prose-sm prose-stone prose-teal prose-violet prose-xl prose-yellow prose-zinc px-6 py-3 rounded-none static table text-red-500 text-sm text-xs w-full">', extension: 'html' }, // TurboMaterial raw CSS
        './public/*.html',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/views/**/*.{erb,haml,html,slim}'
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
