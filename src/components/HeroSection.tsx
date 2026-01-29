import { Button } from "@/components/ui/button";
import { ArrowRight, Smartphone } from "lucide-react";
import { useState, useEffect } from "react";
import phoneMockupImage from "@/assets/New Mockup.png";

export const HeroSection = () => {
  const [animated, setAnimated] = useState(false);
  const [email, setEmail] = useState("");

  useEffect(() => {
    setAnimated(true);
  }, []);

  return (
    <section className="relative min-h-screen flex items-center overflow-hidden bg-white pt-24 pb-8">
      <div className="container mx-auto px-4 sm:px-6 relative z-10 w-full">
        {/* Overlay with Rounded Corners */}
        <div className="relative rounded-2xl lg:rounded-3xl overflow-hidden">
          {/* Split Background with Radial Gradients */}
          <div className="absolute inset-0 flex">
            {/* Left Side - Dark Purple/Blue Radial Background */}
            <div 
              className="w-full lg:w-1/2"
              style={{
                background: 'radial-gradient(ellipse 80% 100% at 30% 50%, #3117ce 0%, #2512a8 40%, #1a0d7a 80%, #150a5c 100%)'
              }}
            />
            {/* Right Side - Lighter Radial Gradient Background */}
            <div 
              className="hidden lg:block w-1/2 relative overflow-hidden"
              style={{
                background: 'radial-gradient(ellipse 100% 120% at 70% 50%, #5c3fe0 0%, #4a2dd4 30%, #3117ce 60%, #2512a8 100%)'
              }}
            >
              {/* Abstract curved shape for depth */}
              <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-white/10 rounded-full blur-3xl transform translate-x-1/4 -translate-y-1/4" />
              <div className="absolute bottom-0 left-0 w-[500px] h-[500px] bg-white/10 rounded-full blur-3xl transform -translate-x-1/4 translate-y-1/4" />
            </div>
          </div>

          <div className="relative grid lg:grid-cols-2 min-h-[600px] lg:min-h-[700px]">
            
            {/* Left Column - Content (Dark Background) */}
            <div className="flex items-center py-12 lg:py-16 px-6 lg:px-12 xl:px-16">
              <div className={`space-y-6 w-full transition-all duration-1000 delay-200 ${animated ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-4'}`}>
                {/* Small Uppercase Label */}
                <div className="space-y-1">
                  <p 
                    className="text-xs sm:text-sm font-semibold text-white/80 uppercase tracking-wider"
                    style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                  >
                    AI Support for Your Business
                  </p>
                </div>

                {/* Main Headline */}
                <div className="space-y-3">
                  <h1 
                    className="text-2xl sm:text-3xl md:text-4xl lg:text-[40px] text-white"
                    style={{
                      fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
                      fontWeight: 400,
                      lineHeight: 1.1,
                      letterSpacing: '-0.02em'
                    }}
                  >
                    <span className="block">Transforming Informal</span>
                    <span className="block">Transactions into Africa&apos;s</span>
                    <span className="block">Most Valuable Credit Passport</span>
                  </h1>
                </div>

                {/* Description */}
                <p 
                  className="text-sm sm:text-base lg:text-lg font-semibold text-white/90 max-w-xl leading-relaxed"
                  style={{ fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif" }}
                >
                  AI converts your WhatsApp chats and mobile money transactions into verified credit records. Get fair access to loans, insurance, and financial services.
                </p>

                {/* CTA Section - Input and Button */}
                <div className="flex flex-col sm:flex-row gap-3 max-w-lg">
                  <input
                    type="email"
                    placeholder="Start with your phone number"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="flex-1 px-4 py-2.5 sm:py-3 rounded-lg bg-white text-gray-900 placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-white/50 text-sm font-bold"
                  />
                  <Button 
                    size="lg" 
                    className="bg-white text-[#3117ce] hover:bg-white/90 font-bold px-5 sm:px-6 py-2.5 sm:py-3 rounded-lg shadow-lg hover:shadow-xl transition-all duration-300 whitespace-nowrap text-sm"
                  >
                    Get Started
                    <ArrowRight className="w-4 h-4 ml-2" />
                  </Button>
                </div>
              </div>
            </div>

            {/* Right Column - Phone Mockup (Light Background) */}
            <div className="hidden lg:flex items-center justify-center py-12 lg:py-16 px-6 lg:px-12 xl:px-16 relative">
              <div className={`relative w-full h-full flex items-center justify-center transition-all duration-1000 delay-400 ${animated ? 'opacity-100 scale-100' : 'opacity-0 scale-95'}`}>
                {/* Phone Mockup Image */}
                <div className="relative z-10">
                  <img 
                    src={phoneMockupImage} 
                    alt="Zacca.ai app interface showing transaction cards and AI processing"
                    className="w-auto h-[450px] lg:h-[550px] xl:h-[600px] object-contain drop-shadow-2xl"
                  />
                </div>
              </div>
            </div>

            {/* Mobile - Show mockup below content */}
            <div 
              className="lg:hidden flex items-center justify-center py-8 px-6 relative overflow-hidden"
              style={{
                background: 'radial-gradient(ellipse 100% 120% at 50% 50%, #5c3fe0 0%, #4a2dd4 30%, #3117ce 60%, #2512a8 100%)'
              }}
            >
              <div className="absolute top-0 right-0 w-[400px] h-[400px] bg-white/10 rounded-full blur-3xl transform translate-x-1/4 -translate-y-1/4" />
              <div className={`relative z-10 transition-all duration-1000 delay-400 ${animated ? 'opacity-100 scale-100' : 'opacity-0 scale-95'}`}>
                <img 
                  src={phoneMockupImage} 
                  alt="Zacca.ai app interface showing transaction cards and AI processing"
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
