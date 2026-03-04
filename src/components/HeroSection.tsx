import { useState, useEffect } from "react";
import heroMockupImage from "@/assets/New Hero Mockup.png";
import appStoreImage from "@/assets/Google and Apple Store Image.png";

export const HeroSection = () => {
  const [animated, setAnimated] = useState(false);
  const [email, setEmail] = useState("");

  useEffect(() => {
    setAnimated(true);
  }, []);

  return (
    <section id="hero" className="relative min-h-screen flex items-center overflow-hidden pt-28 pb-16">
      <div className="container mx-auto px-4 sm:px-6 relative z-10 w-full">
        {/* Rounded container - Figma Frame 1000005101 */}
        <div
          className="relative rounded-[30px] overflow-hidden min-h-[700px] lg:min-h-[800px]"
          style={{ background: "#FFFDFA" }}
        >
          {/* Ellipse 1249 - Figma exact: semi-circle ellipse, bottom gradient */}
          <div
            className="absolute pointer-events-none"
            style={{
              width: "2066.67px",
              height: "925px",
              left: "-240.83px",
              top: "672.5px",
              background: "rgba(44, 20, 221, 0.8)",
              filter: "blur(65.5417px)",
              borderRadius: "50%",
            }}
          />

          {/* Mesh-like background with sparkles at intersections - visible in gradient area */}
          <div
            className="absolute inset-0 pointer-events-none overflow-hidden"
            style={{
              maskImage: "linear-gradient(to bottom, transparent 25%, rgba(0,0,0,0.3) 50%, black 75%)",
              WebkitMaskImage: "linear-gradient(to bottom, transparent 25%, rgba(0,0,0,0.3) 50%, black 75%)",
            }}
          >
            <svg className="absolute inset-0 w-full h-full" preserveAspectRatio="xMidYMid slice">
              <defs>
                <pattern id="mesh-grid" width="80" height="80" patternUnits="userSpaceOnUse">
                  {/* Diagonal mesh lines */}
                  <line x1="0" y1="0" x2="80" y2="80" stroke="rgba(255,255,255,0.2)" strokeWidth="0.4" />
                  <line x1="0" y1="80" x2="80" y2="0" stroke="rgba(255,255,255,0.2)" strokeWidth="0.4" />
                  <line x1="40" y1="0" x2="40" y2="80" stroke="rgba(255,255,255,0.12)" strokeWidth="0.35" />
                  <line x1="0" y1="40" x2="80" y2="40" stroke="rgba(255,255,255,0.12)" strokeWidth="0.35" />
                  <line x1="0" y1="0" x2="80" y2="40" stroke="rgba(255,255,255,0.1)" strokeWidth="0.3" />
                  <line x1="0" y1="40" x2="80" y2="0" stroke="rgba(255,255,255,0.1)" strokeWidth="0.3" />
                  <line x1="0" y1="80" x2="80" y2="40" stroke="rgba(255,255,255,0.1)" strokeWidth="0.3" />
                  <line x1="0" y1="40" x2="80" y2="80" stroke="rgba(255,255,255,0.1)" strokeWidth="0.3" />
                  {/* Sparkles at intersections */}
                  <circle cx="0" cy="0" r="1" fill="rgba(255,255,255,0.8)" />
                  <circle cx="40" cy="40" r="1.2" fill="rgba(255,255,255,0.9)" />
                  <circle cx="80" cy="80" r="1" fill="rgba(255,255,255,0.8)" />
                  <circle cx="80" cy="0" r="1" fill="rgba(255,255,255,0.8)" />
                  <circle cx="0" cy="80" r="1" fill="rgba(255,255,255,0.8)" />
                  <circle cx="40" cy="0" r="0.8" fill="rgba(255,255,255,0.7)" />
                  <circle cx="40" cy="80" r="0.8" fill="rgba(255,255,255,0.7)" />
                  <circle cx="0" cy="40" r="0.8" fill="rgba(255,255,255,0.7)" />
                  <circle cx="80" cy="40" r="0.8" fill="rgba(255,255,255,0.7)" />
                </pattern>
              </defs>
              <rect width="100%" height="100%" fill="url(#mesh-grid)" />
            </svg>
          </div>

          <div className="relative grid lg:grid-cols-2 gap-12 min-h-[600px] lg:min-h-[750px] items-center">
            {/* Left column - Hero content */}
            <div className="flex flex-col justify-center py-12 lg:py-16 px-6 lg:px-12 xl:px-16 order-2 lg:order-1">
              <div className={`flex flex-col gap-6 lg:gap-[60px] max-w-[795px] transition-all duration-1000 ${animated ? "opacity-100 translate-y-0" : "opacity-0 translate-y-4"}`}>
                {/* Headline & description */}
                <div className="flex flex-col gap-4">
                  <h1
                    className="text-2xl sm:text-3xl md:text-4xl lg:text-[42px] leading-tight text-black"
                    style={{
                      fontFamily: "'DM Sans', 'Inter', sans-serif",
                      fontWeight: 400,
                      lineHeight: "1.25",
                    }}
                  >
                    Transforming Informal Transactions into Africa&apos;s Most Valuable Credit Passport
                  </h1>
                  <p
                    className="text-base max-w-[547px] text-black leading-[1.55]"
                    style={{
                      fontFamily: "'DM Sans', 'Inter', sans-serif",
                      fontWeight: 400,
                      fontSize: "16.3697px",
                    }}
                  >
                    AI converts your mobile money and bank transactions into verified credit records. Get fair access to loans, insurance, and financial services.
                  </p>
                </div>

                {/* Email form & CTA */}
                <div className="flex flex-col gap-4 max-w-[547px]">
                  <div className="flex flex-col sm:flex-row gap-4 sm:gap-6">
                    <input
                      type="email"
                      placeholder="Enter email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      className="flex-1 min-w-0 px-6 py-3 rounded-[10px] bg-[#1C1E23] text-white placeholder:text-white/70 focus:outline-none focus:ring-2 focus:ring-[#2C14DD]/50"
                      style={{
                        fontFamily: "'Inter', sans-serif",
                        fontWeight: 200,
                        fontSize: "18.8555px",
                      }}
                    />
                    <button
                      className="px-8 py-3 rounded-[15px] text-white font-medium whitespace-nowrap hover:opacity-90 transition-opacity"
                      style={{
                        fontFamily: "'DM Sans', 'Inter', sans-serif",
                        fontWeight: 500,
                        fontSize: "20.88px",
                        background: "linear-gradient(0deg, #2C14DD, #2C14DD)",
                      }}
                    >
                      Get Started
                    </button>
                  </div>
                  <p
                    className="text-black"
                    style={{
                      fontFamily: "'DM Sans', 'Inter', sans-serif",
                      fontWeight: 400,
                      fontSize: "16.3697px",
                      lineHeight: "155%",
                    }}
                  >
                    Enter your email to join our waiting list.
                  </p>

                  {/* App store badges */}
                  <div className="mt-4">
                    <img
                      src={appStoreImage}
                      alt="Download on Google Play and App Store"
                      className="h-12 w-auto object-contain"
                    />
                  </div>
                </div>
              </div>
            </div>

            {/* Right column - Phone mockup */}
            <div className="flex items-center justify-center py-8 lg:py-16 px-6 order-1 lg:order-2">
              <div className={`relative z-10 transition-all duration-1000 delay-300 ${animated ? "opacity-100 scale-100" : "opacity-0 scale-95"}`}>
                <img
                  src={heroMockupImage}
                  alt="Zacca.ai app interface"
                  className="w-auto h-[350px] sm:h-[450px] lg:h-[536px] object-contain drop-shadow-2xl"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
