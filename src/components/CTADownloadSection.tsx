import { useState } from "react";
import { Button } from "@/components/ui/button";
import { ArrowRight } from "lucide-react";
import ctaMockupImage from "@/assets/CTA IMAGE 2.png";
import ctaBackgroundImage from "@/assets/CTA IMAGE.png";

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
                    Download the App
                  </h2>
                </div>

                {/* App Store Buttons */}
                <div className="flex flex-col sm:flex-row gap-4">
                  <button className="flex items-center justify-center gap-3 px-6 py-4 bg-gray-800 hover:bg-gray-700 text-white rounded-xl transition-colors">
                    <svg className="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                      <path d="M17.05 20.28c-.98.95-2.05.88-3.08.4-1.09-.5-2.08-.48-3.24 0-1.44.62-2.2.44-3.06-.4C1.79 15.25 2.51 7.59 9.05 7.31c1.35.07 2.29.74 3.08.8 1.18-.24 2.31-.93 3.57-.84 1.51.12 2.65.72 3.4 1.8-3.12 1.87-2.38 5.98.48 7.13-.57 1.5-1.31 2.99-2.54 4.09l.01-.01zM12.03 7.25c-.15-2.23 1.66-4.07 3.74-4.25.29 2.58-2.34 4.5-3.74 4.25z"/>
                    </svg>
                    <div className="text-left">
                      <div className="text-xs">Get it on the</div>
                      <div className="text-sm font-semibold">App Store</div>
                    </div>
                  </button>
                  
                  <button className="flex items-center justify-center gap-3 px-6 py-4 bg-white hover:bg-gray-50 text-gray-900 rounded-xl transition-colors">
                    <svg className="w-7 h-7" viewBox="0 0 24 24" fill="currentColor">
                      <path d="M3,20.5V3.5C3,2.91 3.34,2.39 3.84,2.15L13.69,12L3.84,21.85C3.34,21.6 3,21.09 3,20.5M16.81,15.12L6.05,21.34L14.54,12L16.81,15.12M20.16,10.81C20.5,11.08 20.75,11.5 20.75,12C20.75,12.5 20.53,12.9 20.18,13.18L17.89,14.5L15.39,12L17.89,9.5L20.16,10.81M6.05,2.66L16.81,8.88L14.54,12L6.05,2.66Z"/>
                    </svg>
                    <div className="text-left">
                      <div className="text-xs">Download on</div>
                      <div className="text-sm font-semibold">Google Play</div>
                    </div>
                  </button>
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
                      <ArrowRight className="w-4 h-4 ml-2" />
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
