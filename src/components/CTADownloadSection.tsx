import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Icon } from "@iconify/react";
import ctaMockupImage from "@/assets/CTA IMAGE 2.png";
import ctaBackgroundImage from "@/assets/cta-new.jpg";

export const CTADownloadSection = () => {
  const [email, setEmail] = useState("");

  return (
    <section className="relative py-16 lg:py-24 bg-white">
      <div className="container mx-auto px-4 sm:px-6 relative z-10 w-full">
        {/* Overlay with Rounded Corners */}
        <div className="relative rounded-2xl lg:rounded-3xl overflow-hidden">
          {/* Background Image */}
          <div 
            className="absolute inset-0 bg-cover bg-center bg-no-repeat"
            style={{
              backgroundImage: `url(${ctaBackgroundImage})`
            }}
          >
            {/* Overlay for better text readability */}
            <div className="absolute inset-0 bg-[#3117ce]/90"></div>
          </div>

          <div className="relative grid lg:grid-cols-2 min-h-[500px] lg:min-h-[600px]">
            {/* Left Column - Content */}
            <div className="flex items-center py-12 lg:py-16 px-6 lg:px-12 xl:px-16">
              <div className="space-y-8 w-full">
                {/* Main Headline */}
                <div>
                  <h2
                    className="text-3xl sm:text-4xl md:text-5xl lg:text-6xl font-bold text-white mb-6"
                    style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                  >
                    Get Started
                  </h2>
                  <p
                    className="text-white/90 text-base sm:text-lg leading-relaxed max-w-lg"
                    style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                  >
                    See the full picture on every borrower, not just what a credit report shows. Join the banks, SACCOs, MFIs, and digital lenders already using Zacca to make faster, evidence-backed lending decisions.
                  </p>
                </div>

                {/* Email Input Section */}
                <div className="space-y-3">
                  <p 
                    className="text-white text-lg font-medium"
                    style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                  >
                    Why wait?
                  </p>
                  <div className="flex flex-col sm:flex-row gap-3 max-w-lg">
                    <input
                      type="email"
                      placeholder="Enter your email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      className="flex-1 px-4 py-3 rounded-xl bg-white text-gray-900 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-white/50 text-sm font-medium"
                      style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                    />
                    <Button 
                      size="lg" 
                      className="bg-[#08f5f8] hover:bg-[#08f5f8]/90 text-white font-semibold px-6 py-3 rounded-xl whitespace-nowrap transition-colors"
                      style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                    >
                      Join Today
                      <Icon icon="lucide:arrow-right" className="w-4 h-4 ml-2" />
                    </Button>
                  </div>
                </div>
              </div>
            </div>

            {/* Right Column - Phone Mockup */}
            <div className="hidden lg:flex items-center justify-center py-12 lg:py-16 px-6 lg:px-12 xl:px-16 relative">
              <div className="relative w-full h-full flex items-center justify-center">
                {/* Phone Mockup Image */}
                <div className="relative z-10">
                  <img 
                    src={ctaMockupImage} 
                    alt="Zacca.ai app interface"
                    className="w-auto h-[450px] lg:h-[550px] xl:h-[600px] object-contain drop-shadow-2xl"
                  />
                </div>
              </div>
            </div>

            {/* Mobile - Show mockup below content */}
            <div className="lg:hidden flex items-center justify-center py-8 px-6 relative overflow-hidden">
              <div className="relative z-10">
                <img 
                  src={ctaMockupImage} 
                  alt="Zacca.ai app interface"
                  className="w-auto h-[350px] object-contain drop-shadow-2xl"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
