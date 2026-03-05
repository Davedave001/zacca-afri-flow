import pngwingCircle from "@/assets/pngwing 4.png";
import service2Image from "@/assets/service2 1.png";
import group3Image from "@/assets/Group 3.png";

const fontStyle = {
  fontFamily: "Euclid Circular B, Inter, -apple-system, BlinkMacSystemFont, sans-serif",
};

export const AccordionSection = () => {
  return (
    <section id="about" className="relative pt-24 lg:pt-32 pb-16 lg:pb-24 bg-white overflow-hidden scroll-mt-20">
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
          <div className="grid grid-cols-1 lg:grid-cols-[1fr_auto_1fr] gap-6 lg:gap-6 items-start lg:min-h-[380px]">
            {/* Left: Business Automation - stretched further left */}
            <div className="flex flex-col items-center lg:items-start lg:order-1 lg:-ml-6 xl:-ml-12">
              <div className="max-w-[460px] lg:max-w-[520px] xl:max-w-[560px] w-full">
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

            {/* Center: Two images at original asset dimensions (service2: 379x441, Group3: 453x441) */}
            <div className="flex justify-center items-end gap-0 min-h-0 order-first lg:order-2 -mt-24 lg:-mt-36 w-full overflow-x-auto">
              <img
                src={service2Image}
                alt="Business automation"
                width={379}
                height={441}
                className="object-contain -mr-2 lg:-mr-3 w-auto h-auto max-w-full"
              />
              <img
                src={group3Image}
                alt="Customer using Zacca App"
                width={453}
                height={441}
                className="object-contain -ml-2 lg:-ml-3 w-auto h-auto max-w-full"
              />
            </div>

            {/* Right: Customer analytics - stretched further right */}
            <div className="flex flex-col items-center lg:items-start lg:order-3 lg:-mr-6 xl:-mr-12">
              <div className="max-w-[460px] lg:max-w-[520px] xl:max-w-[560px] w-full">
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

          {/* Bottom: Credit Approval and Automation - tight gap from images */}
          <div className="-mt-6 lg:-mt-10 text-center">
            <div className="max-w-[560px] mx-auto">
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
