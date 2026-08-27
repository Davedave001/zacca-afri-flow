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
      title: "Contradiction Detection",
      description: "Flags where what a borrower stated doesn't match what the transaction data shows.",
      benefits: ["Stated vs. observed", "Threshold-based", "Reconstructable"],
      badge: "Deterministic",
      color: "text-primary",
      bgColor: "bg-primary/10"
    },
    {
      icon: Brain,
      title: "Fraud-Ring Linkage Graphs",
      description: "Shows who's linked to whom, and how tightly, across a lender's book.",
      benefits: ["Relationship mapping", "Coordinated-fraud detection", "Transparent graph logic"],
      badge: "Graph-Based",
      color: "text-accent",
      bgColor: "bg-accent/10"
    },
    {
      icon: Smartphone,
      title: "Guarantor Cascade-Risk",
      description: "Traces SACCO and chama guarantor chains to model what one default could cascade into.",
      benefits: ["Chain-of-guarantor tracing", "Threshold alerts", "Reviewer-reconstructable"],
      badge: "Threshold-Based",
      color: "text-terracotta",
      bgColor: "bg-terracotta/10"
    },
    {
      icon: Wallet,
      title: "Portfolio & Real-Time Risk",
      description: "Macro-adjusted Monte Carlo loss simulation for a whole book, layered with live event shocks.",
      benefits: ["Weather, election & market shocks", "Whole-book stress testing", "Aggregate-only output"],
      badge: "Aggregate-Only",
      color: "text-gold",
      bgColor: "bg-gold/10"
    },
    {
      icon: Shield,
      title: "Governance & Audit",
      description: "Consent-gated at every read, PII-redacted, and logged to a W3C PROV-O decision graph.",
      benefits: ["Consent-gated access", "PII redaction", "PROV-O audit trail"],
      badge: "Audited",
      color: "text-primary",
      bgColor: "bg-primary/10"
    },
    {
      icon: Users,
      title: "Bounded Learned Layer",
      description: "A trained confidence estimator and a segment-level PD model — scoped to calibration and portfolio segments, never an individual score.",
      benefits: ["Confidence estimation", "Segment-level PD", "Never an individual score"],
      badge: "Bounded",
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
            Signal, <span className="text-gradient-primary">Not Verdict</span>
          </h2>
          <p className="text-xl text-muted-foreground max-w-4xl mx-auto leading-relaxed">
            Zacca Aetherius runs deterministic wedges against the case in front of an underwriter — a flag, a graph,
            or a risk map. Never a score.
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
              Enforced, <span className="text-primary">Not Promised</span>
            </h3>
            <p className="text-lg text-muted-foreground">
              The boundary between signal and verdict is enforced in code review, not just the pitch
            </p>
          </div>

          <div className="grid grid-cols-2 lg:grid-cols-4 gap-8">
            <div className="text-center p-6 bg-white/80 rounded-2xl shadow-sm">
              <BarChart3 className="w-10 h-10 text-primary mx-auto mb-4" />
              <div className="text-4xl font-bold text-primary mb-2">3</div>
              <p className="text-muted-foreground font-medium">Deterministic Wedges Shipped</p>
            </div>

            <div className="text-center p-6 bg-white/80 rounded-2xl shadow-sm">
              <Clock className="w-10 h-10 text-accent mx-auto mb-4" />
              <div className="text-4xl font-bold text-accent mb-2">100%</div>
              <p className="text-muted-foreground font-medium">Cases Reviewed by a Human</p>
            </div>

            <div className="text-center p-6 bg-white/80 rounded-2xl shadow-sm">
              <Globe className="w-10 h-10 text-terracotta mx-auto mb-4" />
              <div className="text-4xl font-bold text-terracotta mb-2">0</div>
              <p className="text-muted-foreground font-medium">Individual Credit Scores Produced</p>
            </div>

            <div className="text-center p-6 bg-white/80 rounded-2xl shadow-sm">
              <Users className="w-10 h-10 text-gold mx-auto mb-4" />
              <div className="text-4xl font-bold text-gold mb-2">PROV-O</div>
              <p className="text-muted-foreground font-medium">Audit Standard, Every Decision</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};