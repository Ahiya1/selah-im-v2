export default function AdminDashboard() {
  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-2xl font-bold text-stone-black">
          Contemplative Technology Dashboard
        </h2>
        <p className="text-stone-grey">
          Sacred overview of community applications and insights
        </p>
      </div>
      
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-semibold text-stone-black mb-2">
            Pending Applications
          </h3>
          <p className="text-3xl font-bold text-breathing-blue">-</p>
          <p className="text-stone-grey text-sm">Awaiting review</p>
        </div>
        
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-semibold text-stone-black mb-2">
            Beta Community
          </h3>
          <p className="text-3xl font-bold text-breathing-green">-</p>
          <p className="text-stone-grey text-sm">Accepted practitioners</p>
        </div>
        
        <div className="bg-white p-6 rounded-lg shadow">
          <h3 className="text-lg font-semibold text-stone-black mb-2">
            Contemplative Readiness
          </h3>
          <p className="text-3xl font-bold text-breathing-gold">-</p>
          <p className="text-stone-grey text-sm">Average score</p>
        </div>
      </div>
      
      <div className="bg-white p-6 rounded-lg shadow">
        <h3 className="text-lg font-semibold text-stone-black mb-4">
          Recent Claude Insights
        </h3>
        <div className="space-y-4">
          <p className="text-stone-grey">
            Admin dashboard implementation coming in Branch 4...
          </p>
        </div>
      </div>
    </div>
  )
}
