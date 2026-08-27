import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { ArrowRight, Smartphone, Users, Zap, MessageCircle, Shield, Clock, Heart, CheckCircle } from "lucide-react";

export const CTASection = () => {
  const features = [
    {
      icon: MessageCircle,
      title: "Chat to Credit",
      description: "Transform your WhatsApp business conversations into verifiable credit history",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Clock,
      title: "Fast, Evidence-Backed Decisions",
      description: "Your lender gets the evidence fast — not a stale bank statement. Because opportunity waits for no one",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    },
    {
      icon: Heart,
      title: "Fair & Transparent",
      description: "Built for Kenyans, by Kenyans. We see the entrepreneur in everyone",
      color: "text-[#3117ce]",
      bgColor: "bg-[#3117ce]/10"
    }
  ];

  return (
    <section className="py-24 relative bg-white overflow-hidden">
      {/* Background Pattern */}
      <div className="absolute inset-0 opacity-5">
        <div className="absolute top-1/4 -right-32 w-96 h-96 bg-[#3117ce] rounded-full blur-3xl animate-float" />
        <div className="absolute bottom-1/4 -left-32 w-96 h-96 bg-[#3117ce] rounded-full blur-3xl animate-float" style={{ animationDelay: '2s' }} />
      </div>

      <div className="container mx-auto px-6 relative z-10">
        <Card className="bg-white border-2 border-gray-200 shadow-2xl max-w-5xl mx-auto p-8 lg:p-12 text-center">
          {/* Main CTA Content */}
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-gray-900 mb-6">
            Your <span className="text-[#3117ce]">Dream Business</span>
            <br />
            <span className="text-gray-700">Starts Here</span>
          </h2>
          
          <p className="text-xl text-gray-700 mb-12 max-w-4xl mx-auto leading-relaxed">
            Join thousands of Kenyan entrepreneurs who've transformed their informal businesses into 
            credit-worthy enterprises. <span className="font-semibold text-[#3117ce]">No collateral needed. No bias. Just opportunity.</span>
          </p>

          {/* Features Highlight */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
            {features.map((feature, index) => {
              const Icon = feature.icon;
              return (
                <div 
                  key={index}
                  className="flex flex-col items-center p-6 bg-white rounded-2xl border-2 border-gray-200 hover:border-[#3117ce] transition-all duration-300 hover:shadow-xl hover:shadow-[#3117ce]/20 group"
                >
                  <div className={`w-16 h-16 ${feature.bgColor} rounded-2xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}>
                    <Icon className={`w-8 h-8 ${feature.color}`} />
                  </div>
                  <h3 className="font-semibold text-gray-900 mb-2 text-lg group-hover:text-[#3117ce] transition-colors">{feature.title}</h3>
                  <p className="text-sm text-gray-700 text-center leading-relaxed">{feature.description}</p>
              </div>
              );
            })}
            </div>
            
          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button 
              size="lg" 
              className="bg-[#3117ce] hover:bg-[#3117ce]/90 text-white font-semibold px-8 py-6 rounded-xl shadow-2xl hover:shadow-[#3117ce]/30 transition-all duration-300 group"
            >
              <Smartphone className="w-5 h-5 mr-2" />
              Get Started Now
              <ArrowRight className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
            </Button>
            <Button 
              variant="outline" 
              size="lg"
              className="border-2 border-[#3117ce] text-[#3117ce] hover:bg-[#3117ce]/10 font-semibold px-8 py-6 rounded-xl transition-all duration-300"
            >
              Learn More
            </Button>
              </div>

          {/* Trust Indicators */}
          <div className="mt-12 flex flex-wrap items-center justify-center gap-6">
            <div className="flex items-center gap-2 text-gray-700">
              <CheckCircle className="w-5 h-5 text-[#3117ce]" />
              <span className="text-sm font-semibold">10,000+ Active Users</span>
            </div>
            <div className="flex items-center gap-2 text-gray-700">
              <Shield className="w-5 h-5 text-[#3117ce]" />
              <span className="text-sm font-semibold">Bank-Grade Security</span>
              </div>
            <div className="flex items-center gap-2 text-gray-700">
              <Zap className="w-5 h-5 text-[#3117ce]" />
              <span className="text-sm font-semibold">24/7 Support</span>
            </div>
          </div>
        </Card>
      </div>
    </section>
  );
};
