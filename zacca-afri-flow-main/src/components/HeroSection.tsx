import { Button } from "@/components/ui/button";
import { ArrowRight, Smartphone, Shield, ChevronLeft, ChevronRight, Play, Star, Users, TrendingUp } from "lucide-react";
import { useState, useEffect } from "react";
import bodaBodaImage from "@/assets/Boda Boda Guy at South C.png";
import vegetableVendor1Image from "@/assets/Vegetable Vender at City Market.png";
import vegetableVendor2Image from "@/assets/Vegetable Vendor at Gikomba.png";

export const HeroSection = () => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [typingText, setTypingText] = useState("");
  const [currentPhraseIndex, setCurrentPhraseIndex] = useState(0);
  const [isDeleting, setIsDeleting] = useState(false);
  
  // Phrases for typing effect
  const phrases = [
    "No collateral needed.",
    "No bias.",
    "Just opportunity."
  ];
  
  // Kenyan entrepreneur photos - using your actual photos
  const entrepreneurPhotos = [
    {
      src: bodaBodaImage, // Your boda boda rider photo
      alt: "Kenyan boda boda rider entrepreneur in South C",
      title: "Michael - Boda Boda Operator",
      subtitle: "South C, Nairobi",
      description: "Transporting communities, building dreams"
    },
    {
      src: vegetableVendor1Image, // Your vegetable vendor photo
      alt: "Kenyan vegetable vendor entrepreneur at City Market",
      title: "James - Vegetable Vendor",
      subtitle: "City Market, Nairobi",
      description: "Fresh produce, fresh opportunities"
    },
    {
      src: vegetableVendor2Image, // Your second vegetable vendor photo
      alt: "Kenyan vegetable vendor entrepreneur at Gikomba",
      title: "Sarah - Vegetable Vendor",
      subtitle: "Gikomba Market, Nairobi",
      description: "Feeding families, growing businesses"
    }
  ];

  // Auto-advance slideshow
  useEffect(() => {
    const timer = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % entrepreneurPhotos.length);
    }, 5000); // Change slide every 5 seconds

    return () => clearInterval(timer);
  }, [entrepreneurPhotos.length]);

  // Typing effect
  useEffect(() => {
    const currentPhrase = phrases[currentPhraseIndex];
    
    const timer = setTimeout(() => {
      if (!isDeleting) {
        // Typing
        if (typingText.length < currentPhrase.length) {
          setTypingText(currentPhrase.slice(0, typingText.length + 1));
        } else {
          // Wait before deleting
          setTimeout(() => setIsDeleting(true), 2000);
        }
      } else {
        // Deleting
        if (typingText.length > 0) {
          setTypingText(typingText.slice(0, -1));
        } else {
          setIsDeleting(false);
          setCurrentPhraseIndex((prev) => (prev + 1) % phrases.length);
        }
      }
    }, isDeleting ? 100 : 150); // Faster deleting, slower typing

    return () => clearTimeout(timer);
  }, [typingText, currentPhraseIndex, isDeleting, phrases]);

  const nextSlide = () => {
    setCurrentSlide((prev) => (prev + 1) % entrepreneurPhotos.length);
  };

  const prevSlide = () => {
    setCurrentSlide((prev) => (prev - 1 + entrepreneurPhotos.length) % entrepreneurPhotos.length);
  };

  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden bg-gradient-to-br from-primary/5 via-white to-accent/5 pt-16">
      {/* Enhanced Background with Gradient Overlay */}
      <div className="absolute inset-0">
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
                  e.currentTarget.parentElement.style.background = 'linear-gradient(135deg, #3117ce, #08f5f8)';
                }}
              />
              {/* Enhanced gradient overlay for better text readability */}
              <div className="absolute inset-0 bg-gradient-to-br from-black/60 via-black/40 to-black/60" />
            </div>
          ))}
        </div>
        
        {/* Animated background elements */}
        <div className="absolute inset-0 overflow-hidden">
          <div className="absolute top-20 left-10 w-32 h-32 bg-accent/10 rounded-full animate-pulse"></div>
          <div className="absolute top-40 right-20 w-24 h-24 bg-primary/10 rounded-full animate-bounce"></div>
          <div className="absolute bottom-40 left-20 w-20 h-20 bg-accent/20 rounded-full animate-pulse"></div>
        </div>
      </div>

      {/* Enhanced Slideshow Navigation */}
      <div className="absolute left-6 top-1/2 transform -translate-y-1/2 z-20">
        <button
          onClick={prevSlide}
          className="p-4 bg-white/90 backdrop-blur-md rounded-full shadow-xl hover:bg-white hover:scale-110 transition-all duration-300 group border border-white/20"
        >
          <ChevronLeft className="w-6 h-6 text-primary group-hover:text-accent" />
        </button>
      </div>
      
      <div className="absolute right-6 top-1/2 transform -translate-y-1/2 z-20">
        <button
          onClick={nextSlide}
          className="p-4 bg-white/90 backdrop-blur-md rounded-full shadow-xl hover:bg-white hover:scale-110 transition-all duration-300 group border border-white/20"
        >
          <ChevronRight className="w-6 h-6 text-primary group-hover:text-accent" />
        </button>
      </div>

      {/* Enhanced Slide Indicators */}
      <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2 z-20">
        <div className="flex gap-4 bg-white/20 backdrop-blur-md rounded-full px-4 py-2">
          {entrepreneurPhotos.map((_, index) => (
            <button
              key={index}
              onClick={() => setCurrentSlide(index)}
              className={`w-4 h-4 rounded-full transition-all duration-300 ${
                index === currentSlide 
                  ? 'bg-white scale-125 shadow-lg' 
                  : 'bg-white/60 hover:bg-white/80'
              }`}
          />
        ))}
        </div>
      </div>

      <div className="container mx-auto px-6 relative z-10">
        <div className="max-w-6xl mx-auto">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            
            {/* Left Column - Enhanced Content */}
            <div className="text-center lg:text-left space-y-8">
              {/* Trust Badge */}
              <div className="inline-flex items-center gap-2 bg-white/20 backdrop-blur-md rounded-full px-4 py-2 border border-white/30 animate-fade-up">
                <Star className="w-4 h-4 text-accent fill-accent" />
                <span className="text-white text-sm font-semibold">Trusted by 10,000+ Entrepreneurs</span>
          </div>

          {/* Main Headline */}
              <div className="space-y-4 animate-fade-up animate-delay-200">
                <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold text-white leading-tight">
                  Transforming Informal Transactions into 
                  <span className="text-accent block">Africa's Most Valuable</span>
                  <span className="text-accent">Credit Passport</span>
          </h1>
              </div>

              {/* Typing Effect */}
              <div className="text-2xl md:text-3xl font-bold text-white min-h-[3rem] flex items-center justify-center lg:justify-start animate-fade-up animate-delay-400">
                <span className="text-accent mr-2">{typingText}</span>
                <span className="animate-pulse text-accent">|</span>
              </div>

              {/* Enhanced CTA Buttons */}
              <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start animate-fade-up animate-delay-600">
            <Button 
              size="lg" 
                  className="bg-gradient-to-r from-primary to-accent hover:from-primary/90 hover:to-accent/90 text-white font-bold px-10 py-5 rounded-2xl shadow-2xl hover:shadow-primary/30 transition-all duration-300 group transform hover:scale-105"
            >
                  <Smartphone className="w-6 h-6 mr-3" />
              Get the App
                  <ArrowRight className="w-6 h-6 ml-3 group-hover:translate-x-1 transition-transform" />
            </Button>
            <Button 
              variant="outline" 
              size="lg"
              className="border-2 border-white/60 text-gray-800 hover:bg-white hover:text-primary font-bold px-10 py-5 rounded-2xl backdrop-blur-md transition-all duration-300 group transform hover:scale-105"
            >
              <Play className="w-5 h-5 mr-2" />
              For Lenders
            </Button>
          </div>

              {/* Social Proof */}
              <div className="flex flex-col sm:flex-row gap-6 items-center justify-center lg:justify-start animate-fade-up animate-delay-800">
                <div className="flex items-center gap-2 text-white/90">
                  <Users className="w-5 h-5 text-accent" />
                  <span className="text-sm font-semibold">10,000+ Active Users</span>
                </div>
                <div className="flex items-center gap-2 text-white/90">
                  <TrendingUp className="w-5 h-5 text-accent" />
                  <span className="text-sm font-semibold">40% Growth Rate</span>
                </div>
              </div>
            </div>

            {/* Right Column - Enhanced Visual */}
            <div className="relative animate-fade-up animate-delay-400">
              <div className="relative bg-white/10 backdrop-blur-md rounded-3xl p-8 border border-white/20 shadow-2xl">
                {/* Current Slide Info */}
                <div className="text-center space-y-4">
                  <div className="w-20 h-20 bg-gradient-to-br from-primary to-accent rounded-full mx-auto flex items-center justify-center">
                    <span className="text-white text-2xl font-bold">{currentSlide + 1}</span>
                  </div>
                  <h3 className="text-xl font-bold text-white">{entrepreneurPhotos[currentSlide].title}</h3>
                  <p className="text-white/80">{entrepreneurPhotos[currentSlide].subtitle}</p>
                  <p className="text-accent font-semibold">{entrepreneurPhotos[currentSlide].description}</p>
                </div>
                
                {/* Success Metrics */}
                <div className="mt-8 grid grid-cols-2 gap-4">
                  <div className="text-center p-4 bg-white/10 rounded-xl">
                    <div className="text-2xl font-bold text-accent">85%</div>
                    <div className="text-sm text-white/80">Success Rate</div>
                  </div>
                  <div className="text-center p-4 bg-white/10 rounded-xl">
                    <div className="text-2xl font-bold text-accent">24hr</div>
                    <div className="text-sm text-white/80">Approval Time</div>
                  </div>
                </div>
            </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};