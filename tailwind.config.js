/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        'stone-black': '#0a0a0a',
        'stone-grey': '#6b7280',
        'stone-white': '#e5e7eb',
        'breathing-green': '#22c55e',
        'breathing-blue': '#3b82f6',
        'breathing-gold': '#f59e0b',
        'contemplative-white': '#fafafa',
      },
      animation: {
        'breathe': 'breathe 4s ease-in-out infinite',
        'sacred-pulse': 'sacred-pulse 6s ease-in-out infinite',
        'contemplative-fade': 'contemplative-fade 0.8s ease-out',
      },
      keyframes: {
        breathe: {
          '0%, 100%': { transform: 'scale(1)' },
          '50%': { transform: 'scale(1.02)' },
        },
        'sacred-pulse': {
          '0%, 100%': { opacity: '0.8' },
          '50%': { opacity: '1' },
        },
        'contemplative-fade': {
          '0%': { opacity: '0', transform: 'translateY(10px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
      },
      spacing: {
        'contemplative': '1.618rem', // Golden ratio spacing
        'sacred': '2.618rem',
      },
      fontFamily: {
        'contemplative': ['Inter', 'system-ui', 'sans-serif'],
      },
      screens: {
        'mobile-contemplative': '375px',
        'tablet-contemplative': '768px',
        'desktop-contemplative': '1024px',
        'large-contemplative': '1280px',
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
