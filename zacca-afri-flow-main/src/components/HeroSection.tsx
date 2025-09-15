import { Button } from "@/components/ui/button";
import { ArrowRight, Smartphone, TrendingUp, Users, DollarSign, Shield, ChevronLeft, ChevronRight } from "lucide-react";
import { useState, useEffect } from "react";
import heroImage from "@/assets/hero-nairobi-ai.jpg";
import mamaMbogaImage from "@/assets/mama-mboga-ai.jpg";
import blockchainImage from "@/assets/blockchain-network.jpg";

export const HeroSection = () => {
  const [currentSlide, setCurrentSlide] = useState(0);
  
  // Kenyan entrepreneur photos using existing assets
  const entrepreneurPhotos = [
    {
      src: heroImage,
      alt: "Futuristic Nairobi skyline with AI data streams",
      title: "Nairobi Tech Hub",
      subtitle: "Innovation Center"
    },
    {
      src: mamaMbogaImage,
      alt: "Mama mboga using AI-powered fintech",
      title: "Grace - Market Vendor",
      subtitle: "Eastleigh Market"
    },
    {
      src: blockchainImage,
      alt: "Blockchain network visualization",
      title: "Digital Infrastructure",
      subtitle: "Kenya's Fintech Revolution"
    },
    {
      src: heroImage, // Reusing for demo - you can add more images
      alt: "Kenyan entrepreneurs thriving with technology",
      title: "Tech Entrepreneurs",
      subtitle: "Nairobi"
    }
  ];

  // Auto-advance slideshow
  useEffect(() => {
    const timer = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % entrepreneurPhotos.length);
    }, 5000); // Change slide every 5 seconds

    return () => clearInterval(timer);
  }, [entrepreneurPhotos.length]);

  const nextSlide = () => {
    setCurrentSlide((prev) => (prev + 1) % entrepreneurPhotos.length);
  };

  const prevSlide = () => {
    setCurrentSlide((prev) => (prev - 1 + entrepreneurPhotos.length) % entrepreneurPhotos.length);
  };

  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden bg-white">
      {/* Full-Width Slideshow Background */}
      <div className="absolute inset-0 bg-gradient-to-br from-primary/10 to-accent/10">
        <div className="relative w-full h-full">
          {entrepreneurPhotos.map((photo, index) => (
            <div
              key={index}
              className={`absolute inset-0 transition-opacity duration-1000 ${
                index === currentSlide ? 'opacity-100' : 'opacity-0'
              }`}
            >
              <img 
                src={photo.src} 
                alt={photo.alt}
                className="w-full h-full object-cover"
                onError={(e) => {
                  console.log('Image failed to load:', photo.src);
                  e.currentTarget.style.display = 'none';
                }}
              />
              <div className="absolute inset-0 bg-gradient-to-r from-white/95 via-white/85 to-white/95" />
            </div>
          ))}
        </div>
      </div>
      
      {/* Subtle AI-inspired Design Flourishes */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        {/* Floating data dots */}
        {[...Array(8)].map((_, i) => (
          <div
            key={i}
            className="absolute w-2 h-2 bg-primary/20 rounded-full animate-float"
            style={{
              top: `${15 + i * 10}%`,
              left: `${10 + (i % 3) * 30}%`,
              animationDelay: `${i * 0.5}s`,
            }}
          />
        ))}
        
        {/* Gradient lines */}
        {[...Array(3)].map((_, i) => (
          <div
            key={i}
            className="absolute h-px w-32 bg-gradient-to-r from-transparent via-primary/30 to-transparent"
            style={{
              top: `${25 + i * 20}%`,
              right: `${10 + i * 5}%`,
              animationDelay: `${i * 1}s`,
            }}
          />
        ))}
      </div>

      {/* Slideshow Navigation */}
      <div className="absolute left-6 top-1/2 transform -translate-y-1/2 z-20">
        <button
          onClick={prevSlide}
          className="p-3 bg-white/80 backdrop-blur-sm rounded-full shadow-lg hover:bg-white transition-all duration-300 group"
        >
          <ChevronLeft className="w-6 h-6 text-primary group-hover:text-accent" />
        </button>
      </div>
      
      <div className="absolute right-6 top-1/2 transform -translate-y-1/2 z-20">
        <button
          onClick={nextSlide}
          className="p-3 bg-white/80 backdrop-blur-sm rounded-full shadow-lg hover:bg-white transition-all duration-300 group"
        >
          <ChevronRight className="w-6 h-6 text-primary group-hover:text-accent" />
        </button>
      </div>

      {/* Slide Indicators */}
      <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2 z-20">
        <div className="flex gap-3">
          {entrepreneurPhotos.map((_, index) => (
            <button
              key={index}
              onClick={() => setCurrentSlide(index)}
              className={`w-3 h-3 rounded-full transition-all duration-300 ${
                index === currentSlide 
                  ? 'bg-primary scale-125' 
                  : 'bg-white/60 hover:bg-white/80'
              }`}
            />
          ))}
        </div>
      </div>

      {/* Current Entrepreneur Info */}
      <div className="absolute top-8 left-8 z-20">
        <div className="bg-white/90 backdrop-blur-sm rounded-2xl p-6 shadow-lg animate-fade-up">
          <h3 className="text-xl font-bold text-primary mb-1">
            {entrepreneurPhotos[currentSlide].title}
          </h3>
          <p className="text-muted-foreground font-medium">
            {entrepreneurPhotos[currentSlide].subtitle}
          </p>
        </div>
      </div>

      <div className="container mx-auto px-6 relative z-10">
        <div className="max-w-5xl mx-auto text-center">
          {/* Trust Badge */}
          <div className="inline-flex items-center gap-2 bg-primary/10 border border-primary/20 rounded-full px-6 py-3 mb-8 animate-fade-up">
            <Shield className="w-4 h-4 text-primary" />
            <span className="text-sm font-semibold text-primary">Licensed & Regulated by CBK</span>
          </div>

          {/* Main Headline - Human-Centered */}
          <h1 className="text-4xl md:text-6xl lg:text-7xl font-bold leading-tight mb-8 animate-fade-up animate-delay-200">
            <span className="text-primary">Empowering</span>
            <br />
            <span className="text-foreground">Kenyan Dreams</span>
            <br />
            <span className="text-gradient-primary">Through AI & Trust</span>
          </h1>

          {/* Subheading - Impact-Driven */}
          <p className="text-lg md:text-xl text-muted-foreground mb-12 max-w-4xl mx-auto leading-relaxed animate-fade-up animate-delay-400">
            From mama mboga to tech startups, we're building a financial future where every Kenyan entrepreneur gets fair access to credit. 
            <span className="font-semibold text-primary"> No collateral needed. No bias. Just opportunity.</span>
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center items-center animate-fade-up animate-delay-600 mb-16">
            <Button 
              size="lg" 
              className="bg-primary hover:bg-primary/90 text-white font-semibold px-8 py-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 group"
            >
              <Smartphone className="w-5 h-5 mr-2" />
              Get Started Today
              <ArrowRight className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
            </Button>
            <Button 
              variant="outline" 
              size="lg"
              className="border-primary text-primary hover:bg-primary hover:text-white font-semibold px-8 py-4 rounded-xl transition-all duration-300"
            >
              Partner With Us
            </Button>
          </div>

          {/* Impact Stats */}
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-8 animate-fade-up animate-delay-800">
            <div className="text-center p-6 bg-white/80 backdrop-blur-sm rounded-2xl border border-gray-100 shadow-sm">
              <Users className="w-8 h-8 text-primary mx-auto mb-3" />
              <div className="text-3xl font-bold text-primary mb-2">250K+</div>
              <div className="text-muted-foreground font-medium">Entrepreneurs Empowered</div>
            </div>
            <div className="text-center p-6 bg-white/80 backdrop-blur-sm rounded-2xl border border-gray-100 shadow-sm">
              <DollarSign className="w-8 h-8 text-accent mx-auto mb-3" />
              <div className="text-3xl font-bold text-accent mb-2">$25M+</div>
              <div className="text-muted-foreground font-medium">Credit Facilitated</div>
            </div>
            <div className="text-center p-6 bg-white/80 backdrop-blur-sm rounded-2xl border border-gray-100 shadow-sm">
              <TrendingUp className="w-8 h-8 text-terracotta mx-auto mb-3" />
              <div className="text-3xl font-bold text-terracotta mb-2">98.5%</div>
              <div className="text-muted-foreground font-medium">Repayment Rate</div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};