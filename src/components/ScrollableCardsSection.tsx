import { useEffect, useRef, useState } from "react";
import { Check } from "lucide-react";
import mockupCard1Image from "@/assets/New Mockup Card 1.png";
import styles from "./ScrollableCardsSection.module.css";
import mockupCard2Image from "@/assets/New Mockup Card 2.png";
import mockupCard3Image from "@/assets/New Mockup Card 3 NEW.png";


const cardImages = [mockupCard1Image, mockupCard2Image, mockupCard3Image] as const;

const cards = [
  {
    id: 1,
    title: "Automated Workflows & Process Optimization",
    description: "",
    features: [
      "AI-powered workflow automation from mobile money transactions",
      "Automated inventory tracking with zero manual effort",
      "Real-time process optimization based on transaction patterns",
    ],
    cta: "Optimize Now",
    gradient: "from-[#3117ce] to-[#2512a8]",
  },
  {
    id: 2,
    title: "AI-Driven Decision Support & Operational Intelligence",
    description: "",
    features: [
      "Real-time business intelligence from transaction data",
      "Predictive analytics for inventory and cash flow",
      "Automated alerts and recommendations for optimal decisions",
    ],
    cta: "Get Insights",
    gradient: "from-[#4a2dd4] to-[#3117ce]",
  },
  {
    id: 3,
    title: "Automated Record-Keeping & AI-Based Business Performance Monitoring",
    description: "",
    features: [
      "Automated bookkeeping from M-Pesa and mobile money transactions",
      "AI-based performance monitoring and reporting",
      "Real-time financial health tracking and alerts",
    ],
    cta: "Start Monitoring",
    gradient: "from-[#5c3fe0] to-[#4a2dd4]",
  },
];

/* ------------------ UTILITIES ------------------ */

const clamp = (v: number) => Math.max(0, Math.min(1, v));
const segmentProgress = (scroll: number, start: number, end: number) =>
  clamp((scroll - start) / (end - start));

/* ------------------ CONSTANTS ------------------ */

// Standard card size (use Card 1 as the standard “base frame” size)
const BASE_CARD_HEIGHT = 460;
// Cards 2/3 should be taller/larger while climbing, then collapse back to base
const SCALE_LARGE = 1.12;
// Sticky frame must fit the scaled card so the bottom isn't chopped while climbing
const FRAME_HEIGHT = BASE_CARD_HEIGHT * SCALE_LARGE;
const ENTRY_OFFSET = FRAME_HEIGHT * 1.2;

/* ------------------ MAIN COMPONENT ------------------ */

export const ScrollableCardsSection = () => {
  const sectionRef = useRef<HTMLDivElement>(null);
  const [scrollProgress, setScrollProgress] = useState(0);

  useEffect(() => {
    const onScroll = () => {
      if (!sectionRef.current) return;

      const rect = sectionRef.current.getBoundingClientRect();
      const windowHeight = window.innerHeight;
      const total = rect.height + windowHeight;
      const scrolled = windowHeight - rect.top;

      setScrollProgress(clamp(scrolled / total));
    };

    window.addEventListener("scroll", onScroll, { passive: true });
    onScroll();
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  return (
    <section ref={sectionRef} id="solutions" className="relative bg-white scroll-mt-20">
      {/* Mobile: simple stacked cards - same typography as about section */}
      <div className="lg:hidden container mx-auto px-4 py-12 space-y-8">
        {cards.map((card, index) => (
          <Card key={card.id} card={card} image={cardImages[index]} primary={index === 0} />
        ))}
      </div>
      {/* Desktop: scroll animation */}
      <div className="hidden lg:block">
        <div className="relative" style={{ minHeight: "300vh" }}>
          <div className="sticky top-0 h-screen flex items-center justify-center overflow-hidden">
            <div
              className="relative w-full max-w-6xl mx-auto"
              style={{ height: FRAME_HEIGHT }}
            >
              {cards.map((card, index) => (
                <div
                  key={card.id}
                  // Anchor cards to the bottom of the frame so the entering card starts
                  // climbing immediately without leaving a visible gap.
                  className="absolute inset-0 flex items-end justify-center"
                  style={{
                    ...getCardStyle(index, scrollProgress),
                    willChange: "transform, clip-path, opacity",
                  } as React.CSSProperties}
                >
                  <Card card={card} image={cardImages[index]} primary={index === 0} />
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

/* ------------------ CARD STYLE LOGIC ------------------ */

const getCardStyle = (index: number, scroll: number) => {
  const segments = [
    { active: [0.0, 0.25] },
    { enter: [0.25, 0.5], active: [0.5, 0.75] },
    // Card 3: start entering when we're roughly 1/4 of the way into Card 2's active range.
    // Card 2 active: 0.5 → 0.75, so 0.5 + 0.25 * 0.25 ≈ 0.5625.
    { enter: [0.56, 1.0] },
  ];

  const s = segments[index];

  // PRE - Before entering
  if (s.enter && scroll < s.enter[0]) {
    return {
      transform: `translateY(${ENTRY_OFFSET}px) scale(${SCALE_LARGE})`,
      clipPath: `inset(0% 0% 100% 0%)`,
      opacity: 0,
      zIndex: 1,
      visibility: 'hidden' as const,
    };
  }

  // ENTER
  if (s.enter && scroll >= s.enter[0]) {
    // If scroll exceeds enter end, treat as fully entered (active state)
    if (scroll >= s.enter[1]) {
      return {
        transform: `translateY(0) scale(1)`,
        clipPath: `inset(0% 0% 0% 0%)`,
        opacity: 1,
        zIndex: 20, // Highest when active
      };
    }
    
    const p = segmentProgress(scroll, s.enter[0], s.enter[1]);

    // CLIMB PHASE: 0 → 0.75 (Card climbs from bottom, reaches 75% coverage)
    if (p < 0.75) {
      const climbProgress = p / 0.75; // 0 to 1
      // Card slides up from ENTRY_OFFSET to 0
      const translateY = ENTRY_OFFSET * (1 - climbProgress);
      // Card 3 should be FULLY VISIBLE as it climbs - no clipping needed
      // The card slides up and naturally covers Card 2 from bottom to top
      
      return {
        transform: `translateY(${translateY}px) scale(${SCALE_LARGE})`,
        clipPath: `inset(0% 0% 0% 0%)`, // Fully visible - no clipping
        opacity: 1,
        zIndex: 25, // Must be above Card 2 (zIndex 15 when active, zIndex 5 when exiting)
      };
    }

    // COLLAPSE PHASE: 0.75 → 1.0 (Card collapses to exact dimensions)
    const collapseProgress = (p - 0.75) / 0.25; // 0 to 1
    const scale = SCALE_LARGE - collapseProgress * (SCALE_LARGE - 1); // SCALE_LARGE → 1
    
    return {
      transform: `translateY(0) scale(${scale})`,
      clipPath: `inset(0% 0% 0% 0%)`,
      opacity: 1,
      zIndex: 20, // Highest when active
    };
  }

  // ACTIVE
  if (s.active && scroll >= s.active[0] && scroll < s.active[1]) {
    return {
      transform: `translateY(0) scale(1)`,
      clipPath: `inset(0% 0% 0% 0%)`,
      opacity: 1,
      zIndex: 15,
    };
  }

  // EXIT - Card being masked by next card
  if (index < segments.length - 1) {
    const next = segments[index + 1];
    if (next.enter && scroll >= next.enter[0]) {
      // SPECIAL CASE: Card 2 while Card 3 climbs & collapses
      // Card 2 should remain completely static (no clipping) while Card 3
      // climbs and collapses into the frame. Only after Card 3 has fully
      // taken over do we hide Card 2.
      if (index === 1) {
        // While Card 3 is in its entire enter phase, keep Card 2 static underneath
        if (scroll < next.enter[1]) {
          return {
            transform: `translateY(0) scale(1)`,
            clipPath: `inset(0% 0% 0% 0%)`,
            opacity: 1,
            zIndex: 15, // Same as active, but below Card 3 (zIndex 25)
          };
        }

        // Once Card 3 has fully entered/collapsed, hide Card 2
        return {
          transform: `translateY(0) scale(1)`,
          clipPath: `inset(100% 0% 0% 0%)`,
          opacity: 0,
          zIndex: 1,
          pointerEvents: "none",
        };
      }

      // Generic masking logic (Card 1 when Card 2 enters)
      const p = segmentProgress(scroll, next.enter[0], next.enter[1]);

      // While the next card (Card 2) is CLIMBING to 75% coverage, the previous card (Card 1)
      // must remain fully visible above it (no clipping), otherwise the section background shows.
      if (p < 0.75) {
        return {
          transform: `translateY(0) scale(1)`,
          clipPath: `inset(0% 0% 0% 0%)`, // keep fully visible
          opacity: 1,
          zIndex: 5, // below the entering card (zIndex 25)
        };
      }

      // During the next card's COLLAPSE phase (last 25%), fade/clip the previous card out.
      const collapseProgress = (p - 0.75) / 0.25; // 0 to 1
      return {
        transform: `translateY(0) scale(1)`,
        clipPath: `inset(${collapseProgress * 100}% 0% 0% 0%)`, // clip from top as replacement completes
        opacity: 1 - collapseProgress,
        zIndex: 1,
        pointerEvents: collapseProgress >= 1 ? "none" : "auto",
      };
    }
  }

  return {};
};

/* ------------------ CARD UI ------------------ */

const Card = ({
  card,
  image,
  primary: _primary,
}: {
  card: (typeof cards)[number];
  image: string;
  primary: boolean;
}) => {
  return (
    <div
      className="relative w-full max-w-5xl min-h-[360px] lg:h-[460px] rounded-3xl overflow-hidden shadow-2xl"
      style={{
        background: 'linear-gradient(135deg, #2512a8 0%, #3117ce 50%, #4a2dd4 100%)',
        padding: '2px'
      }}
    >
      <div className="w-full h-full rounded-3xl bg-white px-6 py-3 grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="flex flex-col justify-center space-y-4">
          <h2 className={`${styles.cardTitle} mb-3`}>
            {card.title}
          </h2>

          {card.description ? (
            <p className={styles.cardText}>
              {card.description}
            </p>
          ) : null}

          <ul className="space-y-2">
            {card.features.map((f, i) => (
              <li key={i} className="flex gap-3 items-start">
                <div
                  className="w-6 h-6 rounded-full flex items-center justify-center bg-[#3117ce]/10"
                >
                  <Check
                    className="w-4 h-4 text-[#3117ce]"
                  />
                </div>
                <span className={styles.cardText}>
                  {f}
                </span>
              </li>
            ))}
          </ul>

          <button className="mt-2 px-6 py-2.5 rounded-full font-semibold w-fit bg-[#3117ce] text-white hover:bg-[#2512a8] transition-colors text-sm lg:text-base">
            {card.cta}
          </button>
        </div>
        
        <div className="hidden lg:flex items-center justify-center overflow-hidden">
          <img
            src={image}
            alt={card.title}
            className="w-full h-full object-contain"
          />
        </div>
      </div>
    </div>
  );
};

