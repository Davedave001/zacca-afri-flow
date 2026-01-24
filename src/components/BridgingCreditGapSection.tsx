import { Button } from "@/components/ui/button";
import { Brain, Shield, TrendingUp, Zap, CheckCircle } from "lucide-react";

export const BridgingCreditGapSection = () => {
  const perks = [
    {
      icon: Brain,
      title: "AI-Powered Intelligence",
      description: "Advanced machine learning algorithms analyze your business patterns and create fair credit scores.",
      color: "text-primary",
      bgColor: "bg-primary/10"
    },
    {
      icon: Shield,
      title: "Bank-Grade Security",
      description: "Blockchain-secured transactions and data protection ensure your information stays safe.",
      color: "text-accent",
      bgColor: "bg-accent/10"
    },
    {
      icon: TrendingUp,
      title: "Real-Time Analytics",
      description: "Monitor your credit score and business performance in real-time with actionable insights.",
      color: "text-gold",
      bgColor: "bg-gold/10"
    },
    {
      icon: Zap,
      title: "Instant Access",
      description: "Get approved and funded in minutes, not months. Opportunity waits for no one.",
      color: "text-terracotta",
      bgColor: "bg-terracotta/10"
    }
  ];

  return (
    <section className="py-24 relative bg-gradient-to-br from-gray-900 via-gray-800 to-gray-900">
      <div className="container mx-auto px-6">
        {/* Section Header */}
        <div className="text-center mb-16">
          <Button 
            variant="outline" 
            className="mb-6 border-white/20 text-white/80 hover:bg-white/10 rounded-full px-6"
          >
            Our Perks
          </Button>
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-white mb-6">
            Bridging <span className="text-accent">The Credit Gap</span>
          </h2>
          <p className="text-xl text-white/80 max-w-4xl mx-auto leading-relaxed">
            Zacca.ai leverages cutting-edge AI and blockchain to create fair financial access for every African business, 
            turning everyday transactions into powerful credit opportunities.
          </p>
        </div>

        {/* Perks Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 max-w-7xl mx-auto">
          {perks.map((perk, index) => {
            const Icon = perk.icon;
            return (
              <div
                key={index}
                className="bg-white/5 backdrop-blur-md rounded-2xl p-8 border border-white/10 hover:border-accent/50 transition-all duration-300 hover:shadow-2xl hover:shadow-accent/20 group"
              >
                <div className={`w-14 h-14 ${perk.bgColor} rounded-xl flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}>
                  <Icon className={`w-7 h-7 ${perk.color}`} />
                </div>
                <h3 className="text-xl font-semibold text-white mb-3 group-hover:text-accent transition-colors">
                  {perk.title}
                </h3>
                <p className="text-white/70 leading-relaxed">
                  {perk.description}
                </p>
              </div>
            );
          })}
        </div>

        {/* Bottom CTA */}
        <div className="text-center mt-16">
          <div className="inline-flex items-center gap-2 bg-accent/20 backdrop-blur-md rounded-full px-6 py-3 border border-accent/30">
            <CheckCircle className="w-5 h-5 text-accent" />
            <span className="text-white font-semibold">No Collateral Needed • No Bias • Just Opportunity</span>
          </div>
        </div>
      </div>
    </section>
  );
};
