import pngwingCircle from "@/assets/pngwing 4.png";
import service2Image from "@/assets/service2 1.png";
import group3Image from "@/assets/Group 3.png";

const fontStyle = {
  fontFamily: "Euclid Circular B, Inter, -apple-system, BlinkMacSystemFont, sans-serif",
};

export const AccordionSection = () => {
  return (
    <section id="about" className="relative py-16 lg:py-24 bg-white overflow-hidden scroll-mt-20">
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

      <div className="container mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="relative bg-white rounded-2xl max-w-6xl mx-auto">
          {/* Top row: Business Automation text | Side-by-side center images | Customer Analytics text */}
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 lg:gap-8 items-start lg:min-h-[380px]">
            {/* Left: Business Automation text only */}
            <div className="flex flex-col items-center lg:items-start lg:order-1">
              <div className="max-w-[309px]">
                <h2
                  className="text-base lg:text-lg font-medium text-[#2C14DD] leading-tight mb-3"
                  style={fontStyle}
                >
                  Business Automation on Zacca App
                </h2>
                <p
                  className="text-sm lg:text-base text-black leading-relaxed"
                  style={{ ...fontStyle, fontWeight: 400 }}
                >
                  Every transaction automatically updates your inventory, recording sales in real-time with zero manual effort.
                </p>
              </div>
            </div>

            {/* Center: Two images side by side, no gap, pushed up above titles */}
            <div className="flex justify-center items-end gap-0 min-h-[320px] lg:min-h-[380px] order-first lg:order-2 -mt-16 lg:-mt-24">
              {/* service2 - plaid shirt woman (teal circle) */}
              <img
                src={service2Image}
                alt="Business automation"
                className="w-44 h-52 lg:w-56 lg:h-72 object-contain"
              />
              {/* Group 3 - excited woman (purple circle) */}
              <img
                src={group3Image}
                alt="Customer using Zacca App"
                className="w-44 h-52 lg:w-56 lg:h-72 object-contain"
              />
            </div>

            {/* Right: Customer analytics text */}
            <div className="flex flex-col items-center lg:items-start lg:order-3">
              <div className="max-w-[309px]">
                <h2
                  className="text-base lg:text-lg font-medium text-[#2C14DD] leading-tight mb-3"
                  style={fontStyle}
                >
                  Customer analytics tracking
                </h2>
                <p
                  className="text-sm lg:text-base text-black leading-relaxed"
                  style={{ ...fontStyle, fontWeight: 400 }}
                >
                  Capture payer metadata to compute repeat customers, order frequency, and basket size—building comprehensive daily records.
                </p>
              </div>
            </div>
          </div>

          {/* Bottom: Credit Approval and Automation */}
          <div className="mt-6 lg:mt-8 text-center">
            <div className="max-w-[500px] mx-auto">
              <h2
                className="text-base lg:text-lg font-medium text-[#2C14DD] leading-tight mb-3"
                style={fontStyle}
              >
                Credit Approval and Automation
              </h2>
              <p
                className="text-sm lg:text-base text-black leading-relaxed"
                style={{ ...fontStyle, fontWeight: 400 }}
              >
                Credit limits are automatically adjusted to your transaction velocity and settlement behavior, aligned to your cash-flow realities.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
