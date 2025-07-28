import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Selah | Contemplative Technology',
  description: 'Technology that breathes with you. Sacred pause in a hyper-connected world. Recognition over optimization.',
  keywords: ['contemplative technology', 'meditation', 'consciousness', 'mindfulness', 'sacred pause'],
  authors: [{ name: 'Ahiya & Professor Oded Maimon' }],
  openGraph: {
    title: 'Selah | Contemplative Technology',
    description: 'Technology that breathes with you. Sacred pause in a hyper-connected world.',
    url: 'https://selah.im',
    siteName: 'Selah',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Selah | Contemplative Technology',
    description: 'Technology that breathes with you. Sacred pause in a hyper-connected world.',
  },
  viewport: 'width=device-width, initial-scale=1, viewport-fit=cover',
  themeColor: '#6b7280',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en" className="scroll-smooth">
      <body className={`${inter.className} antialiased bg-contemplative-white text-stone-black`}>
        <div className="min-h-screen flex flex-col">
          {children}
        </div>
      </body>
    </html>
  )
}
