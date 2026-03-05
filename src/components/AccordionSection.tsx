import pngwingCircle from "@/assets/pngwing 4.png";
import service2Image from "@/assets/service2 1.png";
import group3Image from "@/assets/Group 3.png";
import iphoneMockup from "@/assets/iMockup - iPhone 15 Pro Max (1).png";

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
          {/* Top row: Business Automation | Center images | Customer Analytics */}
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 lg:gap-6 items-start lg:min-h-[380px]">
            {/* Left: Business Automation + service2 */}
            <div className="flex flex-col lg:flex-row items-center gap-6 lg:block lg:order-1">
              <div className="flex-1 max-w-[309px] lg:max-w-none">
                <h2
                  className="text-xl lg:text-2xl font-semibold text-[#2C14DD] leading-tight mb-3"
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
              <div className="flex-shrink-0 w-48 h-56 lg:w-72 lg:h-80 overflow-visible">
                <img
                  src={service2Image}
                  alt="Business automation"
                  className="w-full h-full object-contain object-top"
                />
              </div>
            </div>

            {/* Center: Group 3 + iPhone mockup */}
            <div className="relative flex justify-center items-center min-h-[320px] lg:min-h-[380px] order-first lg:order-2">
              <div className="relative w-48 h-64 lg:w-56 lg:h-72">
                <img
                  src={group3Image}
                  alt="Customer using Zacca App"
                  className="absolute inset-0 w-full h-full object-contain object-center"
                />
                <img
                  src={iphoneMockup}
                  alt="Zacca App on iPhone"
                  className="absolute left-1/2 top-1/2 w-24 lg:w-32 h-auto object-contain"
                  style={{ transform: "translate(-50%, -50%) rotate(-18deg)" }}
                />
              </div>
            </div>

            {/* Right: Customer analytics */}
            <div className="flex flex-col items-center lg:items-start gap-4 lg:order-3">
              <div className="max-w-[309px]">
                <h2
                  className="text-xl lg:text-2xl font-semibold text-[#2C14DD] leading-tight mb-3"
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
          <div className="mt-12 lg:mt-16 text-center">
            <div className="max-w-[500px] mx-auto">
              <h2
                className="text-xl lg:text-2xl font-semibold text-[#2C14DD] leading-tight mb-3"
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
