import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
  Brain,
  Wallet,
  Users,
  Shield,
  MessageCircle,
  Smartphone
} from "lucide-react";

export const FeaturesSection = () => {
  const features = [
    {
      icon: MessageCircle,
      title: "Spotting Mismatches",
      description: "Flags cases where what a borrower said doesn't match what their transactions actually show.",
      benefits: ["Compares claims to real data", "Clear, simple rules", "Easy for a reviewer to check"],
      badge: "Rule-Based",
      color: "text-primary",
      bgColor: "bg-primary/10"
    },
    {
      icon: Brain,
      title: "Connection Mapping",
      description: "Shows how people in a lender's book are connected to each other, and how closely.",
      benefits: ["Maps relationships", "Spots coordinated fraud rings", "Easy to follow, not a black box"],
      badge: "Connection-Based",
      color: "text-accent",
      bgColor: "bg-accent/10"
    },
    {
      icon: Smartphone,
      title: "Guarantor Chain Risk",
      description: "Traces chains of loan guarantors to show what could happen if one person falls behind.",
      benefits: ["Follows guarantor chains", "Flags risky chains early", "Easy for a reviewer to check"],
      badge: "Early Warning",
      color: "text-terracotta",
      bgColor: "bg-terracotta/10"
    },
    {
      icon: Wallet,
      title: "Whole-Book Risk Modeling",
      description: "Models what a lender's whole loan book could lose, factoring in real-world events as they happen.",
      benefits: ["Accounts for weather, elections & markets", "Tests the whole loan book", "Never about a single borrower"],
      badge: "Whole-Book View",
      color: "text-gold",
      bgColor: "bg-gold/10"
    },
    {
      icon: Shield,
      title: "Privacy & Accountability",
      description: "Data is only accessed with permission, personal details are protected, and every step is logged for review.",
      benefits: ["Access needs permission", "Personal details protected", "Every step is logged"],
      badge: "Logged & Reviewable",
      color: "text-primary",
      bgColor: "bg-primary/10"
    },
    {
      icon: Users,
      title: "Careful Machine Learning",
      description: "Machine learning here only looks at broad group-level patterns — never an individual borrower's score.",
      benefits: ["Looks at group-level patterns", "Kept within tested limits", "Never scores one person"],
      badge: "Kept in Check",
      color: "text-accent",
      bgColor: "bg-accent/10"
    }
  ];

  return (
    <section className="py-24 relative bg-white">
      {/* Subtle AI-inspired Background Elements */}
      <div className="absolute inset-0 overflow-hidden">
        {/* Floating gradient orbs */}
        <div className="absolute top-1/4 -right-32 w-96 h-96 bg-gradient-to-br from-primary/5 to-accent/5 rounded-full blur-3xl animate-float" />
        <div className="absolute bottom-1/4 -left-32 w-96 h-96 bg-gradient-to-br from-terracotta/5 to-gold/5 rounded-full blur-3xl animate-float" style={{ animationDelay: '2s' }} />
        
        {/* Data-inspired dots */}
        {[...Array(12)].map((_, i) => (
          <div
            key={i}
            className="absolute w-1 h-1 bg-primary/20 rounded-full animate-pulse"
            style={{
              top: `${10 + (i % 4) * 20}%`,
              left: `${15 + (i % 3) * 25}%`,
              animationDelay: `${i * 0.3}s`,
            }}
          />
        ))}
      </div>

      <div className="container mx-auto px-6 relative z-10">
        {/* Section Header */}
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-6">
            We Point It Out. <span className="text-gradient-primary">You Decide.</span>
          </h2>
          <p className="text-xl text-muted-foreground max-w-4xl mx-auto leading-relaxed">
            Zacca looks at the real case in front of an underwriter and shows a flag, a connection, or a risk
            summary — never a score.
          </p>
        </div>

        {/* Features Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8 mb-20">
          {features.map((feature, index) => (
            <Card 
              key={index} 
              className="bg-white border-0 shadow-sm hover:shadow-xl transition-all duration-500 p-8 relative group cursor-pointer animate-fade-up"
              style={{ animationDelay: `${index * 100}ms` }}
            >
              {/* Badge */}
              <Badge 
                variant="secondary" 
                className="absolute top-6 right-6 bg-primary/10 text-primary border-primary/20 font-semibold"
              >
                {feature.badge}
              </Badge>

              {/* Icon with animated background */}
              <div className={`w-16 h-16 rounded-2xl ${feature.bgColor} flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300`}>
                <feature.icon className={`w-8 h-8 ${feature.color}`} />
              </div>

              {/* Content */}
              <h3 className="text-xl font-bold text-foreground mb-4 group-hover:text-primary transition-colors">
                {feature.title}
              </h3>
              
              <p className="text-muted-foreground mb-6 leading-relaxed">
                {feature.description}
              </p>

              {/* Benefits */}
              <div className="space-y-3">
                {feature.benefits.map((benefit, benefitIndex) => (
                  <div key={benefitIndex} className="flex items-center gap-3 text-sm">
                    <div className="w-2 h-2 bg-primary rounded-full animate-pulse" style={{ animationDelay: `${benefitIndex * 0.2}s` }} />
                    <span className="text-foreground/80 font-medium">{benefit}</span>
                  </div>
                ))}
              </div>

              {/* Subtle hover gradient */}
              <div className="absolute inset-0 bg-gradient-to-br from-primary/2 to-accent/2 opacity-0 group-hover:opacity-100 transition-opacity duration-300 rounded-lg pointer-events-none" />
            </Card>
          ))}
        </div>
      </div>
    </section>
  );
};