import { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Selah Admin | Contemplative Community Curation',
  description: 'Sacred space for reviewing contemplative technology applications',
}

export default function AdminLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="min-h-screen bg-stone-white">
      <header className="bg-white border-b border-stone-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-4">
            <div>
              <h1 className="text-xl font-semibold text-stone-black">
                🪨 Selah Admin
              </h1>
              <p className="text-stone-grey text-sm">
                Contemplative Community Curation
              </p>
            </div>
            <nav className="flex space-x-4">
              <a href="/admin" className="text-breathing-blue hover:text-breathing-blue-light">
                Dashboard
              </a>
              <a href="/admin/applications" className="text-stone-grey hover:text-stone-black">
                Applications
              </a>
            </nav>
          </div>
        </div>
      </header>
      
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {children}
      </main>
    </div>
  )
}
