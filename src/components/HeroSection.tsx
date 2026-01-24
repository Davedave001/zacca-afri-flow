import { Button } from "@/components/ui/button";
import { ArrowRight, Brain, Wallet, Shield, MessageCircle, TrendingUp, Smartphone, Zap } from "lucide-react";
import { useState } from "react";

export const HeroSection = () => {
  const [hoveredIcon, setHoveredIcon] = useState<number | null>(null);

  // Zacca services for radial diagram
  const services = [
    {
      icon: Brain,
      label: "AI Credit Scoring",
      color: "from-primary to-primary/80",
      position: "top",
      description: "Fair, transparent AI-powered credit assessment"
    },
    {
      icon: MessageCircle,
      label: "WhatsApp Credit",
      color: "from-accent to-accent/80",
      position: "top-right",
      description: "Transform conversations into credit history"
    },
    {
      icon: Wallet,
      label: "Smart Wallet",
      color: "from-gold to-gold/80",
      position: "right",
      description: "AI wallet that works while you sleep"
    },
    {
      icon: Shield,
      label: "Tokenized Collateral",
      color: "from-terracotta to-terracotta/80",
      position: "bottom-right",
      description: "Digital assets for collateral"
    },
    {
      icon: TrendingUp,
      label: "LiquiChain DAO",
      color: "from-ochre to-ochre/80",
      position: "bottom-left",
      description: "Decentralized lending marketplace"
    },
    {
      icon: Smartphone,
      label: "M-Pesa Integration",
      color: "from-accent/80 to-primary/60",
      position: "left",
      description: "Mobile money transaction analysis"
    }
  ];

  const getPositionClasses = (position: string) => {
    const positions: Record<string, string> = {
      "top": "top-0 left-1/2 -translate-x-1/2 -translate-y-1/2",
      "top-right": "top-1/4 right-0 translate-x-1/2 -translate-y-1/2",
      "right": "right-0 top-1/2 translate-x-1/2 -translate-y-1/2",
      "bottom-right": "bottom-1/4 right-0 translate-x-1/2 translate-y-1/2",
      "bottom-left": "bottom-1/4 left-0 -translate-x-1/2 translate-y-1/2",
      "left": "left-0 top-1/2 -translate-x-1/2 -translate-y-1/2"
    };
    return positions[position] || "";
  };

  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden bg-gradient-to-br from-gray-900 via-gray-800 to-gray-900 pt-16 pb-8">
      {/* Background Pattern */}
      <div className="absolute inset-0 opacity-10">
        <div className="absolute top-20 left-10 w-32 h-32 bg-primary/20 rounded-full blur-3xl animate-pulse"></div>
        <div className="absolute top-40 right-20 w-24 h-24 bg-accent/20 rounded-full blur-2xl animate-bounce"></div>
        <div className="absolute bottom-40 left-20 w-20 h-20 bg-accent/30 rounded-full blur-2xl animate-pulse"></div>
      </div>

      <div className="container mx-auto px-4 sm:px-6 relative z-10">
        <div className="max-w-7xl mx-auto">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            
            {/* Left Column - Content */}
            <div className="text-center lg:text-left space-y-6 lg:space-y-8">
              {/* Trust Badge */}
              <div className="inline-flex items-center gap-2 bg-white/10 backdrop-blur-md rounded-full px-4 py-2 border border-white/20 animate-fade-up">
                <Zap className="w-4 h-4 text-accent fill-accent" />
                <span className="text-white text-sm font-semibold">Trusted by 10,000+ African Entrepreneurs</span>
              </div>

              {/* Main Headline */}
              <div className="space-y-4 animate-fade-up animate-delay-200">
                <h1 className="text-3xl sm:text-4xl md:text-5xl lg:text-6xl font-semibold text-white leading-tight">
                  Transforming Informal Transactions into
                  <span className="text-accent block">Africa's Most Valuable</span>
                  <span className="text-accent">Credit Passport</span>
                </h1>
              </div>

              {/* Description */}
              <p className="text-lg sm:text-xl text-white/80 max-w-xl mx-auto lg:mx-0 animate-fade-up animate-delay-400">
                Give your business the flexibility to access credit through various channels like WhatsApp, M-Pesa, blockchain, and AI-powered assessment.
              </p>

              {/* CTA Buttons */}
              <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start animate-fade-up animate-delay-600">
                <Button 
                  size="lg" 
                  className="bg-gradient-to-r from-primary to-accent hover:from-primary/90 hover:to-accent/90 text-white font-semibold px-8 py-6 rounded-xl shadow-2xl hover:shadow-primary/30 transition-all duration-300 group transform hover:scale-105"
                >
                  <Smartphone className="w-5 h-5 mr-2" />
                  Get Started
                  <ArrowRight className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
                </Button>
                <Button 
                  variant="outline" 
                  size="lg"
                  className="border-2 border-white/60 text-white hover:bg-white/10 font-semibold px-8 py-6 rounded-xl backdrop-blur-md transition-all duration-300 group transform hover:scale-105"
                >
                  For Lenders
                </Button>
              </div>

              {/* Social Proof */}
              <div className="flex flex-wrap gap-6 items-center justify-center lg:justify-start animate-fade-up animate-delay-800">
                <div className="flex items-center gap-2 text-white/90">
                  <TrendingUp className="w-5 h-5 text-accent" />
                  <span className="text-sm font-semibold">40% Growth Rate</span>
                </div>
                <div className="flex items-center gap-2 text-white/90">
                  <Shield className="w-5 h-5 text-accent" />
                  <span className="text-sm font-semibold">Bank-Grade Security</span>
                </div>
              </div>
            </div>

            {/* Right Column - Radial Diagram */}
            <div className="relative h-[500px] lg:h-[600px] flex items-center justify-center animate-fade-up animate-delay-400">
              {/* Central Security/Trust Icon */}
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="relative w-32 h-32 lg:w-40 lg:h-40 bg-gradient-to-br from-gray-800 to-gray-700 rounded-full flex items-center justify-center shadow-2xl border-2 border-primary/30">
                  <Shield className="w-16 h-16 lg:w-20 lg:h-20 text-accent" />
                  <div className="absolute inset-0 rounded-full bg-accent/10 animate-ping"></div>
                </div>
              </div>

              {/* Service Icons in Radial Pattern */}
              {services.map((service, index) => {
                const Icon = service.icon;
                const isHovered = hoveredIcon === index;
                return (
                  <div
                    key={index}
                    className={`absolute ${getPositionClasses(service.position)} transition-all duration-300 ${
                      isHovered ? 'scale-110 z-20' : 'z-10'
                    }`}
                    onMouseEnter={() => setHoveredIcon(index)}
                    onMouseLeave={() => setHoveredIcon(null)}
                  >
                    {/* Connection Line */}
                    <div className={`absolute top-1/2 left-1/2 w-24 lg:w-32 h-0.5 bg-gradient-to-r from-white/20 to-transparent origin-left -translate-x-1/2 -translate-y-1/2 ${
                      isHovered ? 'opacity-100' : 'opacity-50'
                    }`}></div>
                    
                    {/* Service Icon Circle */}
                    <div className={`relative w-20 h-20 lg:w-24 lg:h-24 bg-gradient-to-br ${service.color} rounded-full flex items-center justify-center shadow-xl border-2 border-white/20 cursor-pointer group transition-all duration-300 ${
                      isHovered ? 'shadow-2xl shadow-accent/50' : ''
                    }`}>
                      <Icon className="w-10 h-10 lg:w-12 lg:h-12 text-white" />
                      
                      {/* Hover Tooltip */}
                      {isHovered && (
                        <div className="absolute -bottom-20 left-1/2 -translate-x-1/2 w-48 bg-gray-800/95 backdrop-blur-md rounded-lg p-3 border border-white/20 shadow-2xl z-30">
                          <p className="text-white font-semibold text-sm mb-1">{service.label}</p>
                          <p className="text-white/70 text-xs">{service.description}</p>
                        </div>
                      )}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        </div>
      </div>

      {/* Bottom Section - Stand With Security */}
      <div className="absolute bottom-8 left-8 z-20">
        <div className="bg-white/10 backdrop-blur-md rounded-full px-6 py-3 border border-white/20">
          <p className="text-white font-bold text-lg">Stand With Security</p>
        </div>
      </div>
    </section>
  );
};
