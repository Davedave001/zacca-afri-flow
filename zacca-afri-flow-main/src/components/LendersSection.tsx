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
  Zap,
  Building2,
  Award,
  Globe
} from "lucide-react";

export const LendersSection = () => {
  const benefits = [
    {
      icon: Shield,
      title: "Advanced Risk Management",
      description: "AI-powered credit assessment reduces default rates by 65% through comprehensive business analysis",
      metric: "65% lower defaults",
      color: "text-primary",
      bgColor: "bg-primary/10"
    },
    {
      icon: BarChart3,
      title: "Real-time Portfolio Analytics", 
      description: "Live business performance tracking and predictive risk modeling for informed lending decisions",
      metric: "24/7 monitoring",
      color: "text-accent",
      bgColor: "bg-accent/10"
    },
    {
      icon: TrendingDown,
      title: "Automated Collections",
      description: "Smart contract-based payment scheduling and automated recovery processes", 
      metric: "98% collection rate",
      color: "text-terracotta",
      bgColor: "bg-terracotta/10"
    },
    {
      icon: Users,
      title: "Verified Business Profiles",
      description: "Blockchain-secured transaction histories and community trust verification",
      metric: "100% verified data",
      color: "text-gold",
      bgColor: "bg-gold/10"
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

  const partners = [
    { name: "Kenya Commercial Bank", logo: "🏦" },
    { name: "Equity Bank", logo: "🏛️" },
    { name: "Cooperative Bank", logo: "🏢" },
    { name: "NCBA Bank", logo: "🏪" }
  ];

  return (
    <section className="py-24 relative bg-white">
      <div className="container mx-auto px-6">
        {/* Section Header */}
        <div className="text-center mb-20">
          <Badge 
            variant="secondary" 
            className="bg-primary/10 text-primary border-primary/20 mb-6 px-6 py-3 font-semibold"
          >
            <Building2 className="w-4 h-4 mr-2" />
            For Financial Institutions
          </Badge>
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-6">
            Trusted by <span className="text-primary">Leading Banks</span>
            <br />
            <span className="text-muted-foreground">Across Kenya</span>
          </h2>
          <p className="text-xl text-muted-foreground max-w-4xl mx-auto leading-relaxed">
            Join Kenya's most trusted financial institutions in revolutionizing lending through AI-powered risk assessment, 
            real-time analytics, and blockchain security. Reduce defaults, increase profits, and serve more Kenyans.
          </p>
        </div>

        {/* Trusted Partners */}
        <div className="text-center mb-16">
          <p className="text-lg text-muted-foreground mb-8">Trusted by leading financial institutions</p>
          <div className="flex flex-wrap justify-center items-center gap-8 opacity-60">
            {partners.map((partner, index) => (
              <div key={index} className="flex items-center gap-3 text-lg font-semibold text-foreground">
                <span className="text-2xl">{partner.logo}</span>
                <span>{partner.name}</span>
              </div>
            ))}
          </div>
        </div>

        {/* Main Benefits Grid */}
        <div className="grid md:grid-cols-2 gap-8 mb-20">
          {benefits.map((benefit, index) => (
            <Card 
              key={index}
              className="bg-white border-0 shadow-sm hover:shadow-xl transition-all duration-500 p-8 group cursor-pointer animate-fade-up"
              style={{ animationDelay: `${index * 100}ms` }}
            >
              <div className="flex items-start gap-6">
                <div className={`w-16 h-16 rounded-2xl ${benefit.bgColor} flex items-center justify-center group-hover:scale-110 transition-transform duration-300 flex-shrink-0`}>
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
                    className="bg-primary/10 text-primary border-primary/20 font-semibold"
                  >
                    {benefit.metric}
                  </Badge>
                </div>
              </div>
            </Card>
          ))}
        </div>

        {/* Dashboard Preview */}
        <Card className="bg-white border-0 shadow-xl p-8 lg:p-12 mb-20">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            <div className="space-y-8">
              <div className="inline-flex items-center gap-2 bg-primary/10 rounded-full px-4 py-2 mb-4">
                <Award className="w-4 h-4 text-primary" />
                <span className="text-sm font-semibold text-primary">Enterprise Solution</span>
              </div>
              <h3 className="text-3xl font-bold text-foreground">
                Professional <span className="text-primary">Lending Dashboard</span>
              </h3>
              <p className="text-lg text-muted-foreground leading-relaxed">
                Comprehensive analytics and management tools designed for Kenya's leading financial institutions. 
                Monitor portfolios, assess risks, and manage collections with bank-grade precision and security.
              </p>
              
              {/* Features List */}
              <div className="space-y-4">
                {dashboardFeatures.map((feature, index) => (
                  <div key={index} className="flex items-center gap-3">
                    <CheckCircle className="w-5 h-5 text-primary flex-shrink-0" />
                    <span className="text-foreground/80 font-medium">{feature}</span>
                  </div>
                ))}
              </div>

              <Button 
                size="lg" 
                className="bg-primary hover:bg-primary/90 text-white font-semibold px-8 py-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 group"
              >
                Schedule Demo
                <ArrowRight className="w-5 h-5 ml-2 group-hover:translate-x-1 transition-transform" />
              </Button>
            </div>

            {/* Dashboard Mockup */}
            <div className="relative">
              <div className="w-full h-96 bg-gradient-to-br from-primary/5 to-accent/5 rounded-3xl border border-gray-100 p-8 relative overflow-hidden shadow-lg">
                {/* Mock Dashboard Elements */}
                <div className="space-y-6">
                  <div className="flex justify-between items-center">
                    <div className="text-lg font-semibold text-foreground">Portfolio Overview</div>
                    <Badge variant="secondary" className="bg-green-100 text-green-800 border-green-200">
                      <div className="w-2 h-2 bg-green-500 rounded-full mr-2 animate-pulse"></div>
                      Live
                    </Badge>
                  </div>
                  
                  {/* Mock Chart Area */}
                  <div className="h-40 bg-white rounded-xl flex items-end justify-around p-4 shadow-sm">
                    {[40, 65, 45, 80, 60, 90, 70].map((height, i) => (
                      <div 
                        key={i}
                        className="bg-gradient-to-t from-primary to-accent rounded-t animate-fade-up"
                        style={{ 
                          height: `${height}%`, 
                          width: '10%',
                          animationDelay: `${i * 100}ms` 
                        }}
                      />
                    ))}
                  </div>

                  {/* Mock Stats */}
                  <div className="grid grid-cols-3 gap-4">
                    <div className="bg-white rounded-xl p-4 text-center shadow-sm">
                      <div className="text-2xl font-bold text-primary">98.5%</div>
                      <div className="text-sm text-muted-foreground">Success Rate</div>
                    </div>
                    <div className="bg-white rounded-xl p-4 text-center shadow-sm">
                      <div className="text-2xl font-bold text-accent">2.1s</div>
                      <div className="text-sm text-muted-foreground">Avg. Processing</div>
                    </div>
                    <div className="bg-white rounded-xl p-4 text-center shadow-sm">
                      <div className="text-2xl font-bold text-terracotta">KSh 15.2M</div>
                      <div className="text-sm text-muted-foreground">Total Volume</div>
                    </div>
                  </div>
                </div>

                {/* Animated Elements */}
                <div className="absolute top-6 right-6">
                  <Zap className="w-6 h-6 text-primary animate-pulse" />
                </div>
              </div>
            </div>
          </div>
        </Card>

        {/* Partnership CTA */}
        <div className="text-center bg-gradient-to-r from-primary/5 to-accent/5 rounded-3xl p-12">
          <h3 className="text-3xl font-bold text-foreground mb-6">
            Ready to <span className="text-primary">Transform</span> Your Lending?
          </h3>
          <p className="text-lg text-muted-foreground mb-8 max-w-3xl mx-auto leading-relaxed">
            Join Kenya's leading financial institutions already using Zacca.ai to reduce risks, 
            increase profits, and serve more Kenyans with fair, accessible credit.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button 
              size="lg" 
              className="bg-primary hover:bg-primary/90 text-white font-semibold px-8 py-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300"
            >
              Schedule Partnership Call
            </Button>
            <Button 
              variant="outline" 
              size="lg"
              className="border-primary text-primary hover:bg-primary hover:text-white font-semibold px-8 py-4 rounded-xl transition-all duration-300"
            >
              Download Case Study
            </Button>
          </div>
        </div>
      </div>
    </section>
  );
};