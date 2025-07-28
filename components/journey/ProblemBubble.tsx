'use client'

export function ProblemBubble() {
  return (
    <section className="breathing-element bg-white rounded-lg p-contemplative shadow-lg">
      <h2 className="text-2xl md:text-3xl font-bold text-stone-black mb-4">
        The Digital Overwhelm Crisis
      </h2>
      <div className="space-y-4 text-stone-grey">
        <p className="text-lg">
          📱 <strong>96x daily phone checks</strong> - your attention fragmenting every 10 minutes
        </p>
        <p className="text-lg">
          🧠 <strong>275 daily interruptions</strong> - consciousness scattered across notifications
        </p>
        <p className="text-lg">
          😰 <strong>70% worse sleep</strong> - technology hijacking your natural rhythms
        </p>
        <div className="mt-6 p-4 bg-stone-white rounded-lg">
          <p className="text-stone-black italic">
            "I feel wired but tired, drowning in notifications, 
            my attention pulled in infinite directions..."
          </p>
        </div>
      </div>
    </section>
  )
}
