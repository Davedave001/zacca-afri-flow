import { useEffect, useRef, useState } from "react";
import { Icon } from "@iconify/react";
import mockupCard1Image from "@/assets/New Mockup Card 1.png";
import mockupCard2Image from "@/assets/New Mockup Card 2.png";
import mockupCard3Image from "@/assets/New Mockup Card 3 NEW.png";


const cardImages = [mockupCard1Image, mockupCard2Image, mockupCard3Image] as const;

const cards = [
  {
    id: 1,
    title: "Flags: What You Said vs. What Happened",
    description: "",
    features: [
      "We check if what a borrower told us matches what their transactions actually show.",
      "It compares claims directly against real transaction data, so nothing slips through unnoticed.",
      "Every flag is based on clear, simple rules, so a reviewer can see exactly why it was raised.",
      "Flagged cases go to a real person to review, never decided automatically.",
    ],
    cta: "Learn More",
    gradient: "from-[#3117ce] to-[#2512a8]",
  },
  {
    id: 2,
    title: "Graphs: Who's Connected to Whom",
    description: "",
    features: [
      "We map out who a borrower is connected to: family, business partners, and loan guarantors.",
      "This shows what could happen if one person in a chain of guarantors falls behind on payments.",
      "It also spots coordinated patterns that could point to fraud rings, not just individual risk.",
      "These maps are built from clear, traceable rules, never a hidden score.",
    ],
    cta: "Explore",
    gradient: "from-[#4a2dd4] to-[#3117ce]",
  },
  {
    id: 3,
    title: "Risk Maps: What Could Go Wrong",
    description: "",
    features: [
      "We model what a lender's whole loan book could lose if conditions get tough.",
      "This includes real-world events like bad weather, elections, or market shifts, updated as they happen.",
      "It tests the whole loan book at once, not just one borrower at a time.",
      "These maps only ever describe the whole portfolio, never a single borrower's score.",
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

// Fixed card size — cards never scale, so text stays exactly the same size
// whether the page is stationary or mid-scroll.
const BASE_CARD_HEIGHT = 460;
const FRAME_HEIGHT = BASE_CARD_HEIGHT;
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
      // position: sticky only stays pinned while rect.top is between 0 (pin
      // engages) and -(rect.height - windowHeight) (pin releases). Map the
      // 0-1 progress scale to exactly that window, so the card choreography
      // finishes precisely when the section unpins, not after.
      const pinnedRange = rect.height - windowHeight;
      const scrolledIntoPin = -rect.top;

      setScrollProgress(pinnedRange > 0 ? clamp(scrolledIntoPin / pinnedRange) : 0);
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
              <Card card={card} image={cardImages[index]} />
            </div>
          ))}
        </div>
      </div>
      {/* Desktop: scroll animation */}
      <div className="hidden lg:block">
        <div className="relative" style={{ minHeight: "340vh" }}>
          <div className="sticky top-0 h-screen flex items-center justify-center overflow-hidden">
            <div
              className="relative w-full max-w-6xl mx-auto"
              style={{ height: FRAME_HEIGHT }}
            >
              {cards.map((card, index) => {
                const cardStyle = getCardStyle(index, scrollProgress);
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
                    <Card card={card} image={cardImages[index]} />
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
//
// Each card gets an equal-sized "enter" window (sliding up into place) and
// "active" window (holding still, fully in view) across the scroll range,
// including the last card — so every card gets to rest on screen before the
// section unpins, instead of popping into place right as scrolling hands off.
// Cards never scale: only translateY, opacity, and clip-path change, which
// keeps card text exactly the same size whether scrolling or stationary.

const segments = [
  { active: [0.0, 0.2] },
  { enter: [0.2, 0.4], active: [0.4, 0.6] },
  { enter: [0.6, 0.8], active: [0.8, 1.0] },
];

const getCardStyle = (index: number, scroll: number): React.CSSProperties => {
  const s = segments[index];

  // PRE - Before entering
  if (s.enter && scroll < s.enter[0]) {
    return {
      transform: `translateY(${ENTRY_OFFSET}px)`,
      clipPath: `inset(0% 0% 100% 0%)`,
      opacity: 0,
      zIndex: 1,
      visibility: "hidden" as const,
    };
  }

  // ENTER - slides up continuously from offset to its resting position
  if (s.enter && scroll >= s.enter[0]) {
    if (scroll >= s.enter[1]) {
      return {
        transform: `translateY(0)`,
        clipPath: `inset(0% 0% 0% 0%)`,
        opacity: 1,
        zIndex: 20,
      };
    }

    const p = segmentProgress(scroll, s.enter[0], s.enter[1]);
    const translateY = ENTRY_OFFSET * (1 - p);

    return {
      transform: `translateY(${translateY}px)`,
      clipPath: `inset(0% 0% 0% 0%)`,
      opacity: 1,
      zIndex: 25, // Above the card it's covering
    };
  }

  // ACTIVE - resting in place, fully visible
  if (s.active && scroll >= s.active[0] && scroll < s.active[1]) {
    return {
      transform: `translateY(0)`,
      clipPath: `inset(0% 0% 0% 0%)`,
      opacity: 1,
      zIndex: 15,
    };
  }

  // EXIT - card being covered by the next card
  if (index < segments.length - 1) {
    const next = segments[index + 1];
    if (next.enter && scroll >= next.enter[0]) {
      const p = segmentProgress(scroll, next.enter[0], next.enter[1]);

      // Stay fully visible while the next card climbs most of the way up,
      // then fade/clip out over the final stretch as it settles into place.
      if (p < 0.7) {
        return {
          transform: `translateY(0)`,
          clipPath: `inset(0% 0% 0% 0%)`,
          opacity: 1,
          zIndex: 5,
        };
      }

      const fadeProgress = segmentProgress(p, 0.7, 1);
      return {
        transform: `translateY(0)`,
        clipPath: `inset(${fadeProgress * 100}% 0% 0% 0%)`,
        opacity: 1 - fadeProgress,
        zIndex: 1,
        pointerEvents: fadeProgress >= 1 ? "none" : "auto",
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
}: {
  card: (typeof cards)[number];
  image: string;
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

  return (
    <div
      className="relative w-full max-w-5xl min-h-[320px] lg:min-h-[360px] lg:h-[460px] rounded-3xl overflow-hidden zacca-solution-card"
      style={{
        background: "linear-gradient(135deg, #2512a8 0%, #3117ce 50%, #4a2dd4 100%)",
        padding: "1px",
      }}
    >
      <div className="rounded-[23px] bg-white px-6 py-3 grid grid-cols-1 lg:grid-cols-2 gap-6 w-full h-full">
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
                <Icon icon="lucide:check-circle" className="w-5 h-5 text-[#3117ce] flex-shrink-0 mt-0.5" />
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
