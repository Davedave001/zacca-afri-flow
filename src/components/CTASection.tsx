import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { ArrowRight, Smartphone, Users, Zap, MessageCircle, Shield, Clock, Heart, CheckCircle } from "lucide-react";

export const CTASection = () => {
  const features = [
    {
      icon: MessageCircle,
      title: "Chat to Credit",
      description: "Transform your WhatsApp business conversations into verifiable credit history",
      color: "text-primary",
      bgColor: "bg-primary/20"
    },
    {
      icon: Clock,
      title: "Instant Approval",
      description: "Get credit decisions in minutes, not months. Because opportunity waits for no one",
      color: "text-accent",
      bgColor: "bg-accent/20"
    },
    {
      icon: Heart,
      title: "Fair & Transparent",
      description: "Built for Kenyans, by Kenyans. We see the entrepreneur in everyone",
      color: "text-terracotta",
      bgColor: "bg-terracotta/20"
    }
  ];

  return (
    <section className="py-24 relative bg-gradient-to-br from-gray-900 via-gray-800 to-gray-900 overflow-hidden">
      {/* Background Pattern */}
      <div className="absolute inset-0 opacity-10">
        <div className="absolute top-1/4 -right-32 w-96 h-96 bg-gradient-to-br from-primary/20 to-accent/20 rounded-full blur-3xl animate-float" />
        <div className="absolute bottom-1/4 -left-32 w-96 h-96 bg-gradient-to-br from-terracotta/20 to-gold/20 rounded-full blur-3xl animate-float" style={{ animationDelay: '2s' }} />
      </div>

      <div className="container mx-auto px-6 relative z-10">
        <Card className="bg-white/5 backdrop-blur-md border-white/10 shadow-2xl max-w-5xl mx-auto p-8 lg:p-12 text-center">
          {/* Main CTA Content */}
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-white mb-6">
            Your <span className="text-accent">Dream Business</span>
            <br />
            <span className="text-white/80">Starts Here</span>
          </h2>
          
          <p className="text-xl text-white/80 mb-12 max-w-4xl mx-auto leading-relaxed">
            Join thousands of Kenyan entrepreneurs who've transformed their informal businesses into 
            credit-worthy enterprises. <span className="font-semibold text-accent">No collateral needed. No bias. Just opportunity.</span>
          </p>

          {/* Features Highlight */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
            {features.map((feature, index) => {
              const Icon = feature.icon;
              return (
                <div 
                  key={index}
                  className="flex flex-col items-center p-6 bg-white/5 rounded-2xl border border-white/10 hover:border-accent/50 transition-all duration-300 hover:shadow-xl hover:shadow-accent/20 group"
                >
                  <div className={`w-16 h-16 ${feature.bgColor} rounded-2xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}>
                    <Icon className={`w-8 h-8 ${feature.color}`} />
                  </div>
                  <h3 className="font-semibold text-white mb-2 text-lg group-hover:text-accent transition-colors">{feature.title}</h3>
                  <p className="text-sm text-white/70 text-center leading-relaxed">{feature.description}</p>
                </div>
              );
            })}
          </div>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button 
              size="lg" 
              className="bg-gradient-to-r from-primary to-accent hover:from-primary/90 hover:to-accent/90 text-white font-semibold px-8 py-6 rounded-xl shadow-2xl hover:shadow-primary/30 transition-all duration-300 group"
            >
              <Smartphone className="w-5 h-5 mr-2" />
              Get Started Now
              <ArrowRight className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
            </Button>
            <Button 
              variant="outline" 
              size="lg"
              className="border-2 border-white/60 text-white hover:bg-white/10 font-semibold px-8 py-6 rounded-xl backdrop-blur-md transition-all duration-300"
            >
              Learn More
            </Button>
          </div>

          {/* Trust Indicators */}
          <div className="mt-12 flex flex-wrap items-center justify-center gap-6">
            <div className="flex items-center gap-2 text-white/80">
              <CheckCircle className="w-5 h-5 text-accent" />
              <span className="text-sm font-semibold">10,000+ Active Users</span>
            </div>
            <div className="flex items-center gap-2 text-white/80">
              <Shield className="w-5 h-5 text-accent" />
              <span className="text-sm font-semibold">Bank-Grade Security</span>
            </div>
            <div className="flex items-center gap-2 text-white/80">
              <Zap className="w-5 h-5 text-accent" />
              <span className="text-sm font-semibold">24/7 Support</span>
            </div>
          </div>
        </Card>
      </div>
    </section>
  );
};
