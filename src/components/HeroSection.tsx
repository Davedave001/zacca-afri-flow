import { useState, useEffect } from "react";
import heroMockupImage from "@/assets/New Hero Mockup.png";
import appStoreImage from "@/assets/Google and Apple Store Image.png";
import heroBackgroundImage from "@/assets/Background New Hero- Here.png";

export const HeroSection = () => {
  const [animated, setAnimated] = useState(false);
  const [email, setEmail] = useState("");

  useEffect(() => {
    setAnimated(true);
  }, []);

  return (
    <section
      id="hero"
      className="relative min-h-screen flex items-center overflow-hidden pt-28 pb-16 w-full bg-cover bg-center bg-no-repeat"
      style={{
        backgroundImage: `url(${heroBackgroundImage})`,
      }}
    >
      <div className="container mx-auto px-4 sm:px-6 relative z-10 w-full">
        <div className="relative grid lg:grid-cols-2 gap-12 min-h-[600px] lg:min-h-[750px] items-center">
            {/* Left column - Hero content */}
            <div className="flex flex-col justify-center py-12 lg:py-16 px-6 lg:px-12 xl:px-16 order-2 lg:order-1">
              <div className={`flex flex-col gap-6 lg:gap-[60px] max-w-[795px] transition-all duration-1000 ${animated ? "opacity-100 translate-y-0" : "opacity-0 translate-y-4"}`}>
                {/* Headline & description */}
                <div className="flex flex-col gap-4">
                  <h1
                    className="text-2xl sm:text-3xl md:text-4xl lg:text-[42px] leading-tight text-black"
                    style={{
                      fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
                      fontWeight: 400,
                      lineHeight: "1.25",
                    }}
                  >
                    Transforming Informal Transactions into Africa&apos;s Most Valuable Credit Passport
                  </h1>
                  <p
                    className="text-base max-w-[547px] text-black leading-[1.55]"
                    style={{
                      fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
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
                        fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
                        fontWeight: 200,
                        fontSize: "14px",
                      }}
                    />
                    <button
                      className="px-8 py-3 rounded-[15px] text-white font-medium whitespace-nowrap hover:opacity-90 transition-opacity"
                      style={{
                        fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
                        fontWeight: 500,
                        fontSize: "14px",
                        background: "linear-gradient(0deg, #2C14DD, #2C14DD)",
                      }}
                    >
                      Get Started
                    </button>
                  </div>
                  <p
                    className="text-black"
                    style={{
                      fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
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
    </section>
  );
};
