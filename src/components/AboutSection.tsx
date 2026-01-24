import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Brain, Shield, Target, Users, Zap, BarChart3, CheckCircle } from "lucide-react";

export const AboutSection = () => {
  const solutions = [
    {
      icon: Brain,
      title: "Dynamic Credit Scoring",
      description: "AI-powered credit verification reduces default rates by 60%",
      badge: "60% lower defaults",
      color: "text-accent",
      bgColor: "bg-accent/20"
    },
    {
      icon: BarChart3,
      title: "Real-time Analytics",
      description: "Live business performance data and payment behavior tracking",
      badge: "24/7 monitoring",
      color: "text-terracotta",
      bgColor: "bg-terracotta/20"
    },
    {
      icon: Zap,
      title: "Automated Collections",
      description: "Smart contract-based automatic deductions and payment scheduling",
      badge: "Smart Contracts",
      color: "text-gold",
      bgColor: "bg-gold/20"
    },
    {
      icon: Users,
      title: "Verified Profiles",
      description: "Blockchain-secured business records and transaction histories",
      badge: "Blockchain Secured",
      color: "text-primary",
      bgColor: "bg-primary/20"
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
            Top-notch Solutions
          </Button>
          <h2 className="text-4xl md:text-5xl lg:text-6xl font-semibold text-white mb-6">
            Next-Gen <span className="text-accent">Lending Platform</span>
          </h2>
          <p className="text-xl text-white/80 max-w-3xl mx-auto">
            Join the future of African lending with AI-powered risk assessment, real-time analytics, and blockchain security.
          </p>
        </div>

        {/* Solutions Grid */}
        <div className="grid md:grid-cols-2 gap-8 max-w-6xl mx-auto">
          {solutions.map((solution, index) => {
            const Icon = solution.icon;
            return (
              <Card 
                key={index}
                className="bg-white/5 backdrop-blur-md border-white/10 p-8 hover:bg-accent/10 transition-all duration-300 hover:shadow-2xl hover:shadow-accent/30 group"
              >
                <div className="flex items-start gap-4">
                  <div className={`w-14 h-14 ${solution.bgColor} rounded-xl flex items-center justify-center group-hover:bg-accent/30 transition-colors group-hover:scale-110`}>
                    <Icon className={`w-7 h-7 ${solution.color} group-hover:text-accent transition-colors`} />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-xl font-semibold text-white mb-2 group-hover:text-accent transition-colors">
                      {solution.title}
                    </h3>
                    <p className="text-white/80 mb-4 leading-relaxed">
                      {solution.description}
                    </p>
                    <div className="inline-flex items-center gap-2 bg-white/10 rounded-full px-3 py-1 group-hover:bg-accent/20 transition-colors">
                      <CheckCircle className="w-4 h-4 text-accent" />
                      <span className="text-sm font-semibold text-white group-hover:text-accent transition-colors">
                        {solution.badge}
                      </span>
                    </div>
                  </div>
                </div>
              </Card>
            );
          })}
        </div>
      </div>
    </section>
  );
};
