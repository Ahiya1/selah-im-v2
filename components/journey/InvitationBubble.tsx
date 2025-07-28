'use client'

import { SacredIntakeFlow } from '@/components/sacred-intake/SacredIntakeFlow'

export function InvitationBubble() {
  return (
    <section className="breathing-element bg-breathing-gold bg-opacity-5 rounded-lg p-contemplative">
      <h2 className="text-2xl md:text-3xl font-bold text-breathing-gold mb-4">
        We Might Choose You
      </h2>
      <div className="space-y-4 mb-6">
        <p className="text-stone-grey">
          This is not a sign-up form. This is a contemplative conversation 
          that helps us recognize who is ready for consciousness-serving technology.
        </p>
        <p className="text-stone-grey">
          We are building a sacred community of practitioners who understand 
          that recognition, not optimization, is the path.
        </p>
      </div>
      
      <SacredIntakeFlow />
      
      <div className="mt-6 text-center text-sm text-stone-grey">
        <p>Applications reviewed thoughtfully by humans and AI</p>
        <p>Beta access granted to contemplative practitioners</p>
      </div>
    </section>
  )
}
