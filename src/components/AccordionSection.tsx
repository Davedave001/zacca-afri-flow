import pngwingCircle from "@/assets/pngwing 4.png";
import service2Image from "@/assets/service2 1.png";
import group3Image from "@/assets/Group 3.png";

const fontStyle = {
  fontFamily: "Euclid Circular B, Inter, -apple-system, BlinkMacSystemFont, sans-serif",
};

export const AccordionSection = () => {
  return (
    <section id="about" className="relative pt-16 sm:pt-24 lg:pt-64 pb-16 lg:pb-24 bg-white overflow-hidden scroll-mt-20">
      {/* Background circle patterns - left */}
      <div
        className="absolute left-0 top-3 w-64 h-64 lg:w-[406px] lg:h-[406px] opacity-30 bg-cover bg-center bg-no-repeat -translate-x-1/2"
        style={{ backgroundImage: `url(${pngwingCircle})` }}
        aria-hidden
      />
      {/* Background circle patterns - right */}
      <div
        className="absolute right-0 top-0 w-64 h-64 lg:w-[406px] lg:h-[406px] opacity-30 bg-cover bg-center bg-no-repeat translate-x-1/2"
        style={{ backgroundImage: `url(${pngwingCircle})` }}
        aria-hidden
      />

      <div className="container mx-auto px-4 sm:px-6 lg:px-4 xl:px-6 relative z-10">
        <div className="relative bg-white rounded-2xl max-w-6xl mx-auto">
          {/* Top row: Business Automation text | Side-by-side center images | Customer Analytics text */}
          <div className="grid grid-cols-1 lg:grid-cols-[1fr_auto_1fr] gap-8 lg:gap-6 items-start lg:min-h-[380px]">
            {/* Left: Business Automation - stretched further left */}
            <div className="flex flex-col items-center lg:items-start lg:order-1 lg:-ml-6 xl:-ml-12">
              <div className="max-w-[460px] lg:max-w-[520px] xl:max-w-[560px] w-full">
                <h2
                  className="text-base lg:text-lg font-medium text-[#2C14DD] leading-tight mb-3"
                  style={fontStyle}
                >
                  The Data Gap
                </h2>
                <p
                  className="text-sm lg:text-base text-black leading-relaxed"
                  style={{ ...fontStyle, fontWeight: 400 }}
                >
                  A credit report usually shows just one income source — not the several a real small-business household often has.
                </p>
              </div>
            </div>

            {/* Center: Two images - responsive sizing, no overlap on mobile */}
            <div className="flex justify-center items-end gap-0 min-h-0 order-first lg:order-2 w-full overflow-x-auto overflow-y-visible lg:overflow-visible">
              <img
                src={service2Image}
                alt="Business automation"
                width={379}
                height={441}
                className="object-contain object-bottom -mr-2 lg:-mr-3 w-auto max-w-[48vw] sm:max-w-[220px] lg:max-w-none h-[260px] sm:h-[320px] lg:h-auto"
              />
              <img
                src={group3Image}
                alt="Customer using Zacca App"
                width={453}
                height={441}
                className="object-contain object-bottom -ml-2 lg:-ml-3 w-auto max-w-[48vw] sm:max-w-[260px] lg:max-w-none h-[260px] sm:h-[320px] lg:h-auto"
              />
            </div>

            {/* Right: Customer analytics - stretched further right */}
            <div className="flex flex-col items-center lg:items-start lg:order-3 lg:-mr-6 xl:-mr-12">
              <div className="max-w-[460px] lg:max-w-[520px] xl:max-w-[560px] w-full">
                <h2
                  className="text-base lg:text-lg font-medium text-[#2C14DD] leading-tight mb-3"
                  style={fontStyle}
                >
                  Data ≈ Collateral
                </h2>
                <p
                  className="text-sm lg:text-base text-black leading-relaxed"
                  style={{ ...fontStyle, fontWeight: 400 }}
                >
                  Steady, verifiable activity across all your income streams can stand in for the collateral you don't have.
                </p>
              </div>
            </div>
          </div>

          {/* Bottom: Credit Approval and Automation - left-aligned like preceding text */}
          <div className="mt-8 lg:mt-0 lg:-mt-10 text-left">
            <div className="max-w-[560px]">
              <h2
                className="text-base lg:text-lg font-medium text-[#2C14DD] leading-tight mb-3"
                style={fontStyle}
              >
                Signal ≠ Score
              </h2>
              <p
                className="text-sm lg:text-base text-black leading-relaxed"
                style={{ ...fontStyle, fontWeight: 400 }}
              >
                Seeing more about your business should help a real person make a better decision — not turn into another hidden number you can't question.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
