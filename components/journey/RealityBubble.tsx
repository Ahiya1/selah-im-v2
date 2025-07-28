'use client'

export function RealityBubble() {
  return (
    <section className="breathing-element bg-breathing-green bg-opacity-5 rounded-lg p-contemplative">
      <h2 className="text-2xl md:text-3xl font-bold text-breathing-green mb-4">
        Selah App: Built and Available Now
      </h2>
      <div className="grid md:grid-cols-2 gap-6">
        <div>
          <h3 className="font-semibold text-stone-black mb-2">🧘 Meditation Chamber</h3>
          <p className="text-stone-grey mb-4">
            Breathing orb that responds to your touch. Left to inhale, right to exhale, pause for stillness.
          </p>
          <div className="bg-white p-3 rounded text-center">
            <div className="text-2xl mb-2">📱</div>
            <p className="text-xs text-stone-grey">Meditation Chamber Preview</p>
          </div>
        </div>
        <div>
          <h3 className="font-semibold text-stone-black mb-2">💭 Contemplation Chamber</h3>
          <p className="text-stone-grey mb-4">
            AI-generated questions that evolve with your consciousness, creating space for recognition.
          </p>
          <div className="bg-white p-3 rounded text-center">
            <div className="text-2xl mb-2">📱</div>
            <p className="text-xs text-stone-grey">Contemplation Chamber Preview</p>
          </div>
        </div>
      </div>
      <div className="mt-6 p-4 bg-white rounded-lg text-center">
        <p className="text-breathing-green font-semibold">
          Private beta deploying now • Android & iOS
        </p>
      </div>
    </section>
  )
}
