import { useEffect, useRef, useState } from "react";
import { Check } from "lucide-react";
import mockupCard1Image from "@/assets/New Mockup Card 1.png";
import mockupCard2Image from "@/assets/New Mockup Card 2.png";
import mockupCard3Image from "@/assets/New Mockup Card 3 NEW.png";


const cardImages = [mockupCard1Image, mockupCard2Image, mockupCard3Image] as const;

const cards = [
  {
    id: 1,
    title: "Flags: Stated vs. Observed",
    description: "",
    features: [
      "Stated-vs-observed contradiction detection flags where what a borrower said doesn't match what the transaction data shows.",
      "Every flag is threshold-based and transparent — reconstructable by a reviewer line by line, not a hidden score.",
      "Flags surface to a live Queue where an underwriter reviews the case — never an automated system.",
    ],
    cta: "Learn More",
    gradient: "from-[#3117ce] to-[#2512a8]",
  },
  {
    id: 2,
    title: "Graphs: Linkage & Cascade Risk",
    description: "",
    features: [
      "Fraud-ring linkage graphs show who's linked to whom, and how tightly, across a lender's book.",
      "SACCO/chama guarantor cascade-risk traces what happens if one guarantor in a chain defaults.",
      "Every graph is built from deterministic wedges — transparent and reconstructable, never a black-box score.",
    ],
    cta: "Explore",
    gradient: "from-[#4a2dd4] to-[#3117ce]",
  },
  {
    id: 3,
    title: "Risk Maps: Portfolio Stress",
    description: "",
    features: [
      "Macro-adjusted Monte Carlo loss simulation shows what a whole book of loans could lose under stress.",
      "Layered with live event shocks — weather, elections, market news — updated in real time.",
      "Aggregate-only: a risk map speaks to portfolio exposure, never an individual borrower's score.",
    ],
    cta: "Discover",
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
// Cards 2/3 scale up during climb, then collapse back to base
const SCALE_LARGE = 1.12;
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
      {/* Mobile: horizontally scrollable cards with snap */}
      <div className="lg:hidden overflow-x-auto overflow-y-visible py-12 pb-6 -mx-4 px-4 snap-x snap-mandatory scroll-smooth mobile-cards-scroll">
        <div className="flex gap-4 min-w-min">
          {cards.map((card, index) => (
            <div key={card.id} className="flex-shrink-0 w-[85vw] max-w-[380px] snap-center snap-always">
              <Card card={card} image={cardImages[index]} primary={index === 0} />
            </div>
          ))}
        </div>
      </div>
      {/* Desktop: scroll animation */}
      <div className="hidden lg:block">
        <div className="relative" style={{ minHeight: "300vh" }}>
          <div className="sticky top-0 h-screen flex items-center justify-center overflow-hidden">
            <div
              className="relative w-full max-w-6xl mx-auto"
              style={{ height: FRAME_HEIGHT }}
            >
              {cards.map((card, index) => {
                const cardStyleResult = getCardStyle(index, scrollProgress);
                const { contentScale = 1, ...cardStyle } = cardStyleResult;
                return (
                  <div
                    key={card.id}
                    // Anchor cards to the bottom of the frame so the entering card starts
                    // climbing immediately without leaving a visible gap.
                    className="absolute inset-0 flex items-end justify-center"
                    style={{
                      ...cardStyle,
                      willChange: "transform, clip-path, opacity",
                    } as React.CSSProperties}
                  >
                    <Card card={card} image={cardImages[index]} primary={index === 0} contentScale={contentScale} />
                  </div>
                );
              })}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

/* ------------------ CARD STYLE LOGIC ------------------ */

type CardStyleResult = React.CSSProperties & { contentScale?: number };

const getCardStyle = (index: number, scroll: number): CardStyleResult => {
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
      contentScale: SCALE_LARGE,
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
        contentScale: 1,
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
        contentScale: SCALE_LARGE,
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
      contentScale: scale,
    };
  }

  // ACTIVE
  if (s.active && scroll >= s.active[0] && scroll < s.active[1]) {
    return {
      transform: `translateY(0) scale(1)`,
      clipPath: `inset(0% 0% 0% 0%)`,
      opacity: 1,
      zIndex: 15,
      contentScale: 1,
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
            contentScale: 1,
          };
        }

        // Once Card 3 has fully entered/collapsed, hide Card 2
        return {
          transform: `translateY(0) scale(1)`,
          clipPath: `inset(100% 0% 0% 0%)`,
          opacity: 0,
          zIndex: 1,
          pointerEvents: "none",
          contentScale: 1,
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
          contentScale: 1,
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
        contentScale: 1,
      };
    }
  }

  return {};
};

/* ------------------ CARD UI ------------------ */

/** Typography: match About section - title 16/18px font-medium, body 14/16px font-normal */
const CARD_TITLE_STYLE: React.CSSProperties = {
  fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, sans-serif",
  fontWeight: 500,
  fontSize: "1rem",
  color: "#2C14DD",
  lineHeight: 1.25,
  margin: 0,
  marginBottom: "0.75rem",
};

const CARD_BODY_STYLE: React.CSSProperties = {
  fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, sans-serif",
  fontWeight: 400,
  fontSize: "0.875rem",
  color: "#000",
  lineHeight: 1.6,
  margin: 0,
};

const Card = ({
  card,
  image,
  primary: _primary,
  contentScale = 1,
}: {
  card: (typeof cards)[number];
  image: string;
  primary: boolean;
  contentScale?: number;
}) => {
  const featuresRef = useRef<HTMLUListElement>(null);
  const [textAnimated, setTextAnimated] = useState(false);

  useEffect(() => {
    const el = featuresRef.current;
    if (!el) return;
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry?.isIntersecting && !textAnimated) setTextAnimated(true);
      },
      { threshold: 0.2, rootMargin: "0px 0px -20% 0px" }
    );
    observer.observe(el);
    return () => observer.disconnect();
  }, [textAnimated]);

  const titleStyle: React.CSSProperties = CARD_TITLE_STYLE;
  const bodyStyle: React.CSSProperties = CARD_BODY_STYLE;

  // When parent scales the card during enter/collapse animation, counter-scale the content
  // so title and text remain at constant visual size (avoids blur from scaling text)
  const inv = 1 / contentScale;
  const contentWrapperStyle: React.CSSProperties =
    contentScale !== 1
      ? {
          position: "absolute",
          width: `${contentScale * 100}%`,
          height: `${contentScale * 100}%`,
          left: "50%",
          top: "50%",
          transform: `translate(-50%, -50%) scale3d(${inv}, ${inv}, 1)`,
          transformOrigin: "center center",
          backfaceVisibility: "hidden" as const,
        }
      : {};

  return (
    <div
      className="relative w-full max-w-5xl min-h-[320px] lg:min-h-[360px] lg:h-[460px] rounded-3xl overflow-hidden zacca-solution-card"
      style={{
        background: "linear-gradient(135deg, #2512a8 0%, #3117ce 50%, #4a2dd4 100%)",
        padding: "1px",
      }}
    >
      <div
        className={`rounded-[23px] bg-white px-6 py-3 grid grid-cols-1 lg:grid-cols-2 gap-6 ${contentScale !== 1 ? "" : "w-full h-full"}`}
        style={contentWrapperStyle}
      >
        <div className="flex flex-col justify-center space-y-4">
          <div role="heading" aria-level={2} className="zacca-card-title" style={titleStyle}>
            {card.title}
          </div>

          {card.description ? (
            <div className="zacca-card-text" style={bodyStyle}>{card.description}</div>
          ) : null}

          <ul
            ref={featuresRef}
            className={`zacca-card-features space-y-2 ${textAnimated ? "zacca-card-text-animate" : ""}`}
            style={{ margin: 0, padding: 0, listStyle: "none" }}
          >
            {card.features.map((f, i) => (
              <li key={i} className="flex gap-3 items-start" style={{ margin: 0 }}>
                <div
                  className="w-6 h-6 rounded-full flex items-center justify-center bg-[#3117ce]/10 flex-shrink-0"
                >
                  <Check className="w-4 h-4 text-[#3117ce]" />
                </div>
                <div className="zacca-card-text" style={bodyStyle}>{f}</div>
              </li>
            ))}
          </ul>

          <button className="mt-2 px-6 py-2.5 rounded-full font-medium w-fit bg-[#3117ce] text-white hover:bg-[#2512a8] transition-colors text-sm lg:text-base">
            {card.cta}
          </button>
        </div>

        <div className="hidden lg:flex items-center justify-center overflow-hidden">
          <img src={image} alt={card.title} className="w-full h-full object-contain" />
        </div>
      </div>
    </div>
  );
};

