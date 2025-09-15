import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { 
  BarChart3, 
  Shield, 
  TrendingDown, 
  Users, 
  Clock, 
  CheckCircle,
  ArrowRight,
  Zap
} from "lucide-react";

export const LendersSection = () => {
  const benefits = [
    {
      icon: Shield,
      title: "Enhanced Risk Assessment",
      description: "AI-powered credit verification reduces default rates by 60%",
      metric: "60% lower defaults",
      color: "text-primary"
    },
    {
      icon: BarChart3,
      title: "Real-time Debtor Analytics", 
      description: "Live business performance data and payment behavior tracking",
      metric: "24/7 monitoring",
      color: "text-terracotta"
    },
    {
      icon: TrendingDown,
      title: "Automated Collections",
      description: "Smart contract-based automatic deductions and payment scheduling", 
      metric: "95% collection rate",
      color: "text-gold"
    },
    {
      icon: Users,
      title: "Verified Borrower Profiles",
      description: "Blockchain-secured business records and transaction histories",
      metric: "100% verified data",
      color: "text-primary"
    }
  ];

  const dashboardFeatures = [
    "Live portfolio performance tracking",
    "Automated risk scoring updates", 
    "Smart contract management",
    "Regulatory compliance reporting",
    "Cross-platform integration APIs",
    "Custom lending criteria setup"
  ];

  return (
    <section className="py-24 relative bg-gradient-to-br from-background to-muted/20">
      <div className="container mx-auto px-6">
        {/* Section Header */}
        <div className="text-center mb-16">
          <Badge 
            variant="secondary" 
            className="bg-primary/10 text-primary border-primary/20 mb-4"
          >
            For Financial Institutions
          </Badge>
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-6">
            Next-Gen <span className="text-gradient-primary">Lending Platform</span>
          </h2>
          <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
            Join the future of African lending with AI-powered risk assessment, real-time analytics, and blockchain security
          </p>
        </div>

        {/* Main Benefits Grid */}
        <div className="grid md:grid-cols-2 gap-8 mb-16">
          {benefits.map((benefit, index) => (
            <Card 
              key={index}
              className="feature-card p-8 group cursor-pointer"
              style={{ animationDelay: `${index * 100}ms` }}
            >
              <div className="flex items-start gap-6">
                <div className={`w-16 h-16 rounded-2xl bg-card border border-primary/20 flex items-center justify-center group-hover:animate-pulse-glow flex-shrink-0`}>
                  <benefit.icon className={`w-8 h-8 ${benefit.color}`} />
                </div>
                
                <div className="flex-1">
                  <h3 className="text-xl font-bold text-foreground mb-3 group-hover:text-primary transition-colors">
                    {benefit.title}
                  </h3>
                  <p className="text-muted-foreground mb-4 leading-relaxed">
                    {benefit.description}
                  </p>
                  <Badge 
                    variant="secondary" 
                    className={`bg-${benefit.color.split('-')[1]}/10 text-${benefit.color} border-${benefit.color}/20`}
                  >
                    {benefit.metric}
                  </Badge>
                </div>
              </div>
            </Card>
          ))}
        </div>

        {/* Dashboard Preview */}
        <Card className="feature-card p-8 lg:p-12 mb-16">
          <div className="grid lg:grid-cols-2 gap-8 items-center">
            <div className="space-y-6">
              <h3 className="text-3xl font-bold text-foreground">
                Intelligent <span className="text-gradient-primary">Lending Dashboard</span>
              </h3>
              <p className="text-lg text-muted-foreground leading-relaxed">
                Comprehensive analytics and management tools designed for modern financial institutions. 
                Monitor portfolios, assess risks, and manage collections with unprecedented precision.
              </p>
              
              {/* Features List */}
              <div className="space-y-3">
                {dashboardFeatures.map((feature, index) => (
                  <div key={index} className="flex items-center gap-3">
                    <CheckCircle className="w-5 h-5 text-primary flex-shrink-0" />
                    <span className="text-foreground/80">{feature}</span>
                  </div>
                ))}
              </div>

              <Button 
                size="lg" 
                className="bg-primary hover:bg-primary/90 text-background font-semibold px-8 py-4 rounded-xl glow-on-hover group"
              >
                Request Demo
                <ArrowRight className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
              </Button>
            </div>

            {/* Dashboard Mockup */}
            <div className="relative">
              <div className="w-full h-80 bg-gradient-to-br from-card to-muted/30 rounded-2xl border border-primary/10 p-6 relative overflow-hidden">
                {/* Mock Dashboard Elements */}
                <div className="space-y-4">
                  <div className="flex justify-between items-center">
                    <div className="text-sm font-medium text-foreground">Portfolio Overview</div>
                    <Badge variant="secondary" className="bg-primary/10 text-primary">Live</Badge>
                  </div>
                  
                  {/* Mock Chart Area */}
                  <div className="h-32 bg-gradient-to-r from-primary/10 to-terracotta/10 rounded-lg flex items-end justify-around p-4">
                    {[40, 65, 45, 80, 60, 90, 70].map((height, i) => (
                      <div 
                        key={i}
                        className="bg-primary/60 rounded-t animate-fade-up"
                        style={{ 
                          height: `${height}%`, 
                          width: '8%',
                          animationDelay: `${i * 100}ms` 
                        }}
                      />
                    ))}
                  </div>

                  {/* Mock Stats */}
                  <div className="grid grid-cols-3 gap-3">
                    <div className="bg-primary/10 rounded-lg p-3 text-center">
                      <div className="text-lg font-bold text-primary">98.5%</div>
                      <div className="text-xs text-muted-foreground">Success Rate</div>
                    </div>
                    <div className="bg-terracotta/10 rounded-lg p-3 text-center">
                      <div className="text-lg font-bold text-terracotta">2.1s</div>
                      <div className="text-xs text-muted-foreground">Avg. Processing</div>
                    </div>
                    <div className="bg-gold/10 rounded-lg p-3 text-center">
                      <div className="text-lg font-bold text-gold">15.2M</div>
                      <div className="text-xs text-muted-foreground">Total Volume</div>
                    </div>
                  </div>
                </div>

                {/* Animated Elements */}
                <div className="absolute top-4 right-4">
                  <Zap className="w-6 h-6 text-primary animate-pulse" />
                </div>
              </div>
            </div>
          </div>
        </Card>

        {/* Partnership CTA */}
        <div className="text-center bg-gradient-to-r from-primary/5 via-transparent to-terracotta/5 rounded-2xl p-12">
          <h3 className="text-3xl font-bold text-foreground mb-4">
            Ready to Transform Your Lending?
          </h3>
          <p className="text-lg text-muted-foreground mb-8 max-w-2xl mx-auto">
            Join leading African financial institutions already using Zacca.ai to reduce risks, 
            increase profits, and serve underbanked communities.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button 
              size="lg" 
              className="bg-primary hover:bg-primary/90 text-background font-semibold px-8 py-4 rounded-xl glow-on-hover"
            >
              Schedule Partnership Call
            </Button>
            <Button 
              variant="outline" 
              size="lg"
              className="border-primary/30 text-primary hover:bg-primary/10 font-semibold px-8 py-4 rounded-xl"
            >
              Download Whitepaper
            </Button>
          </div>
        </div>
      </div>
    </section>
  );
};