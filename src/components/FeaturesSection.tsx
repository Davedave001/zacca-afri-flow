import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { 
  TrendingUp, 
  Brain, 
  Wallet, 
  Users, 
  Coins, 
  Shield,
  BarChart3,
  Zap,
  Globe,
  MessageCircle,
  Smartphone,
  Clock
} from "lucide-react";

export const FeaturesSection = () => {
  const features = [
    {
      icon: MessageCircle,
      title: "WhatsApp to Credit",
      description: "Transform your business conversations into verifiable credit history. Our AI reads between the lines.",
      benefits: ["Chat analysis", "Business pattern recognition", "Social proof scoring"],
      badge: "Revolutionary",
      color: "text-primary",
      bgColor: "bg-primary/10"
    },
    {
      icon: Brain,
      title: "AI Credit Scoring",
      description: "Fair, transparent scoring that sees your real business potential, not just traditional metrics.",
      benefits: ["Real-time updates", "No bias", "Context-aware"],
      badge: "AI-Powered",
      color: "text-accent",
      bgColor: "bg-accent/10"
    },
    {
      icon: Smartphone,
      title: "M-Pesa Integration",
      description: "Your mobile money transactions tell a story. We help lenders understand it.",
      benefits: ["Cash flow analysis", "Transaction patterns", "Payment history"],
      badge: "Smart",
      color: "text-terracotta",
      bgColor: "bg-terracotta/10"
    },
    {
      icon: Wallet,
      title: "Instant Access",
      description: "Get approved and funded in minutes, not months. Because opportunity waits for no one.",
      benefits: ["24/7 availability", "Instant decisions", "Same-day funding"],
      badge: "Fast",
      color: "text-gold",
      bgColor: "bg-gold/10"
    },
    {
      icon: Shield,
      title: "Bank-Grade Security",
      description: "Your data is protected with military-grade encryption and full regulatory compliance.",
      benefits: ["End-to-end encryption", "CBK licensed", "Data privacy"],
      badge: "Secure",
      color: "text-primary",
      bgColor: "bg-primary/10"
    },
    {
      icon: Users,
      title: "Community Network",
      description: "Leverage your social capital and community trust as part of your credit profile.",
      benefits: ["Social scoring", "Community validation", "Network effects"],
      badge: "Social",
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
            Technology That <span className="text-gradient-primary">Understands</span> Africa
          </h2>
          <p className="text-xl text-muted-foreground max-w-4xl mx-auto leading-relaxed">
            Built specifically for Kenyan entrepreneurs, our AI recognizes the unique patterns of informal business, 
            community trust, and mobile-first commerce that traditional banks miss.
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

        {/* Impact Stats */}
        <div className="bg-gradient-to-r from-primary/5 to-accent/5 rounded-3xl p-12">
          <div className="text-center mb-12">
            <h3 className="text-3xl font-bold text-foreground mb-4">
              Real Impact, <span className="text-primary">Real Numbers</span>
            </h3>
            <p className="text-lg text-muted-foreground">
              The proof is in the results we're delivering for Kenyan entrepreneurs
            </p>
          </div>
          
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-8">
            <div className="text-center p-6 bg-white/80 rounded-2xl shadow-sm">
              <BarChart3 className="w-10 h-10 text-primary mx-auto mb-4" />
              <div className="text-4xl font-bold text-primary mb-2">98.5%</div>
              <p className="text-muted-foreground font-medium">Credit Accuracy Rate</p>
            </div>
            
            <div className="text-center p-6 bg-white/80 rounded-2xl shadow-sm">
              <Clock className="w-10 h-10 text-accent mx-auto mb-4" />
              <div className="text-4xl font-bold text-accent mb-2">2min</div>
              <p className="text-muted-foreground font-medium">Average Approval Time</p>
            </div>
            
            <div className="text-center p-6 bg-white/80 rounded-2xl shadow-sm">
              <Globe className="w-10 h-10 text-terracotta mx-auto mb-4" />
              <div className="text-4xl font-bold text-terracotta mb-2">47</div>
              <p className="text-muted-foreground font-medium">Counties Served</p>
            </div>
            
            <div className="text-center p-6 bg-white/80 rounded-2xl shadow-sm">
              <Users className="w-10 h-10 text-gold mx-auto mb-4" />
              <div className="text-4xl font-bold text-gold mb-2">250K+</div>
              <p className="text-muted-foreground font-medium">Lives Transformed</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};