import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { 
  ArrowRight, 
  Brain, 
  Shield, 
  TrendingUp, 
  Users, 
  CheckCircle, 
  AlertTriangle,
  BarChart3,
  Target,
  Zap,
  Globe,
  Clock,
  DollarSign,
  FileText,
  Award,
  Lightbulb,
  ArrowLeft
} from "lucide-react";
import { Link } from "react-router-dom";
import bodaBodaImage from "@/assets/Boda Boda Guy at South C.png";
import vegetableVendorImage from "@/assets/Vegetable Vender at City Market.png";
import dataAnalyticsImage from "@/assets/data-analytics-hero.png.png";

const DynamicCreditScoring = () => {
  const features = [
    {
      icon: Brain,
      title: "AI-Powered Analysis",
      description: "Advanced machine learning algorithms analyze communication patterns, transaction behaviors, and business context to create accurate credit profiles."
    },
    {
      icon: Shield,
      title: "Inclusive Methodology",
      description: "Designed for the 65% unbanked population in Kenya, considering informal business activities and digital transaction patterns."
    },
    {
      icon: TrendingUp,
      title: "Real-Time Scoring",
      description: "Dynamic credit scores that update in real-time based on current business performance and transaction patterns."
    },
    {
      icon: Users,
      title: "Behavioral Insights",
      description: "Analyzes borrower behavior patterns, communication styles, and business relationships to assess creditworthiness."
    }
  ];

  const methodologySteps = [
    {
      step: "01",
      title: "Data Collection",
      description: "Secure integration with WhatsApp, M-Pesa, phone calls, and business communications",
      details: "Our AI securely processes communication data, transaction confirmations, receipts, and delivery notes to build comprehensive business profiles."
    },
    {
      step: "02", 
      title: "Context Analysis",
      description: "AI extracts meaning from transactions and communications",
      details: "Unlike traditional methods that see 'KES 50,000 sent', our AI understands 'KES 50,000 = stock purchase from supplier', providing crucial business context."
    },
    {
      step: "03",
      title: "Credit Assessment",
      description: "Multi-dimensional scoring based on real business activity",
      details: "Evaluates sales volume, order frequency, repeat clients, fulfillment rates, and stock turnover to create accurate credit profiles."
    },
    {
      step: "04",
      title: "Dynamic Scoring",
      description: "Continuous monitoring and score updates",
      details: "Credit scores adapt in real-time based on business performance, payment behavior, and market conditions."
    }
  ];

  const benefits = [
    {
      icon: Target,
      title: "65% Reduction in Unbanked",
      description: "Our methodology addresses the core issue of financial exclusion by considering informal business activities."
    },
    {
      icon: Zap,
      title: "50% Lower Default Rates",
      description: "More accurate risk assessment leads to better loan performance and reduced defaults."
    },
    {
      icon: Globe,
      title: "87% Access Improvement",
      description: "Enables access to loans above US$25 for previously excluded populations."
    },
    {
      icon: Clock,
      title: "Real-Time Decisions",
      description: "Instant credit decisions based on current business performance, not just historical data."
    }
  ];

  const stats = [
    { value: "65%", label: "Unbanked Population", description: "Adults without formal bank accounts" },
    { value: "45%", label: "Digital Borrowers", description: "Lack formal credit ratings" },
    { value: "87%", label: "Struggle with Access", description: "Cannot access loans above US$25" },
    { value: "50%", label: "Default Rate", description: "Current digital borrowing defaults" }
  ];

  return (
    <main className="min-h-screen bg-background">
      <Header />
      
      {/* Hero Section */}
      <section className="pt-20 pb-16 bg-gradient-to-br from-primary/5 via-accent/5 to-primary/10">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center mb-12">
            <div className="flex items-center justify-center gap-2 mb-6">
              <Link to="/" className="flex items-center gap-2 text-primary hover:text-accent transition-colors">
                <ArrowLeft className="w-4 h-4" />
                <span className="text-sm font-medium">Back to Platform</span>
              </Link>
            </div>
            
            <Badge className="bg-primary/10 text-primary border-primary/20 px-4 py-2 mb-6">
              <Brain className="w-4 h-4 mr-2" />
              AI-Powered Credit Solutions
            </Badge>
            
            <h1 className="text-5xl md:text-6xl font-bold text-foreground mb-6">
              Dynamic Credit <span className="text-primary">Scoring</span>
            </h1>
            
            <p className="text-xl text-muted-foreground leading-relaxed mb-8">
              A revolutionary methodology for evaluating creditworthiness that leverages advanced AI tools 
              to create inclusive, accurate, and adaptable credit assessments based on real business activity.
            </p>
            
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-primary hover:bg-primary/90 text-white px-8 py-4">
                Learn More
                <ArrowRight className="w-5 h-5 ml-2" />
              </Button>
              <Button variant="outline" size="lg" className="border-primary text-primary hover:bg-primary hover:text-white px-8 py-4">
                View Methodology
              </Button>
            </div>
          </div>
        </div>
      </section>

      {/* Problem Statement */}
      <section className="py-20 bg-white">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <h2 className="text-4xl font-bold text-foreground mb-6">
                The <span className="text-red-600">Credit Gap</span> Challenge
              </h2>
              <p className="text-xl text-muted-foreground max-w-4xl mx-auto">
                Current credit scoring methodologies fail to serve the majority of Kenyans, 
                creating barriers to financial inclusion and economic growth.
              </p>
            </div>

            {/* Statistics Grid */}
            <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 mb-16">
              {stats.map((stat, index) => (
                <Card key={index} className="p-6 text-center border-2 border-red-100 hover:border-red-200 transition-all duration-300">
                  <div className="text-3xl font-bold text-red-600 mb-2">{stat.value}</div>
                  <div className="text-lg font-semibold text-foreground mb-1">{stat.label}</div>
                  <div className="text-sm text-muted-foreground">{stat.description}</div>
                </Card>
              ))}
            </div>

            {/* Problem Details */}
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              <div className="space-y-6">
                <div className="flex items-start gap-4">
                  <AlertTriangle className="w-8 h-8 text-red-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">Rigid Traditional Methods</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Conventional creditworthiness referencing methodology is rigid and hinges on historical data 
                      with no consideration for income level and employment opportunities in the informal sector.
                    </p>
                  </div>
                </div>
                
                <div className="flex items-start gap-4">
                  <BarChart3 className="w-8 h-8 text-red-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">High Default Rates</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Current credit scoring has been attributed to high unbanked and underbanked populations 
                      in addition to high default rates in digital borrowing category (50%).
                    </p>
                  </div>
                </div>
              </div>
              
              <div className="relative">
                <div className="bg-gradient-to-br from-red-50 to-red-100 rounded-3xl p-8 border-2 border-red-200 relative overflow-hidden">
                  <img
                    src={bodaBodaImage}
                    alt="Kenyan entrepreneur struggling with traditional credit access"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <div className="text-center">
                    <FileText className="w-12 h-12 text-red-500 mx-auto mb-3" />
                    <h4 className="text-lg font-bold text-foreground mb-2">Research Findings</h4>
                    <p className="text-muted-foreground text-sm">
                      Study by Prof. Omri Even-Tov reveals the extent of financial exclusion 
                      in Kenya's credit landscape.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Our Solution */}
      <section className="py-20 bg-gradient-to-br from-primary/5 to-accent/5">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Zacca.ai's <span className="text-primary">Dynamic Solution</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-4xl mx-auto">
                Our Dynamic Credit Scoring leverages advanced AI tools with a methodology that is 
                inclusive, accurate, efficient, and adaptable, considering a borrower's ability to earn.
              </p>
            </div>

            {/* Features Grid */}
            <div className="grid md:grid-cols-2 gap-8 mb-16">
              {features.map((feature, index) => (
                <Card key={index} className="p-8 border-2 border-primary/20 hover:border-primary/40 transition-all duration-300 hover:shadow-xl">
                  <div className="flex items-start gap-4">
                    <div className="w-12 h-12 bg-primary/10 rounded-xl flex items-center justify-center">
                      <feature.icon className="w-6 h-6 text-primary" />
                    </div>
                    <div>
                      <h3 className="text-xl font-bold text-foreground mb-3">{feature.title}</h3>
                      <p className="text-muted-foreground leading-relaxed">{feature.description}</p>
                    </div>
                  </div>
                </Card>
              ))}
            </div>

            {/* Methodology Steps */}
            <div className="space-y-8">
              <h3 className="text-3xl font-bold text-center text-foreground mb-12">Our Methodology</h3>
              
              {methodologySteps.map((step, index) => (
                <Card key={index} className="p-8 border-2 border-primary/20 hover:border-primary/40 transition-all duration-300">
                  <div className="grid lg:grid-cols-3 gap-8 items-center">
                    <div className="text-center lg:text-left">
                      <div className="text-4xl font-bold text-primary mb-2">{step.step}</div>
                      <h4 className="text-2xl font-bold text-foreground mb-3">{step.title}</h4>
                      <p className="text-muted-foreground">{step.description}</p>
                    </div>
                    <div className="lg:col-span-2">
                      <p className="text-lg text-foreground leading-relaxed mb-4">{step.details}</p>
                      {index === 1 && (
                        <div className="mt-4">
                          <img
                            src={vegetableVendorImage}
                            alt="AI analyzing business communications and transactions"
                            className="w-full h-32 object-cover rounded-lg border border-primary/20"
                            onError={(e) => {
                              e.currentTarget.style.display = 'none';
                            }}
                          />
                        </div>
                      )}
                    </div>
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Benefits Section */}
      <section className="py-20 bg-white">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Transformative <span className="text-accent">Benefits</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-4xl mx-auto">
                Our Dynamic Credit Scoring methodology delivers measurable improvements 
                across all key financial inclusion metrics.
              </p>
            </div>

            <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
              {benefits.map((benefit, index) => (
                <Card key={index} className="p-6 text-center border-2 border-accent/20 hover:border-accent/40 transition-all duration-300 hover:shadow-xl">
                  <div className="w-16 h-16 bg-accent/10 rounded-2xl flex items-center justify-center mx-auto mb-4">
                    <benefit.icon className="w-8 h-8 text-accent" />
                  </div>
                  <h3 className="text-xl font-bold text-foreground mb-3">{benefit.title}</h3>
                  <p className="text-muted-foreground leading-relaxed">{benefit.description}</p>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Regulatory Compliance */}
      <section className="py-20 bg-gradient-to-br from-primary to-primary/80">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              <div className="text-center lg:text-left">
                <Award className="w-16 h-16 text-white mx-auto lg:mx-0 mb-6" />
                <h2 className="text-4xl font-bold text-white mb-6">
                  Regulatory <span className="text-accent">Compliance</span>
                </h2>
                <p className="text-xl text-white/90 leading-relaxed mb-8">
                  The Central Bank of Kenya has mandated all commercial banks to adopt a revised 
                  risk-based credit pricing. This presents a significant opportunity to introduce 
                  our Dynamic Credit Scoring methodology.
                </p>
                <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
                  <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                    <Shield className="w-5 h-5 mr-2" />
                    View Compliance Details
                  </Button>
                  <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                    <FileText className="w-5 h-5 mr-2" />
                    Download Whitepaper
                  </Button>
                </div>
              </div>
              
              <div className="relative">
                <div className="bg-white/10 backdrop-blur-sm rounded-3xl p-8 border border-white/20">
                  <img
                    src={dataAnalyticsImage}
                    alt="Data analytics and credit scoring technology"
                    className="w-full h-64 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                      e.currentTarget.parentElement.innerHTML = `
                        <div class="w-full h-64 bg-gradient-to-br from-white/20 via-white/10 to-white/20 rounded-xl flex items-center justify-center">
                          <div class="text-center">
                            <div class="w-16 h-16 bg-gradient-to-br from-accent to-white rounded-full mx-auto mb-3 flex items-center justify-center">
                              <span class="text-primary text-2xl font-bold">AI</span>
                            </div>
                            <span class="text-white text-sm font-medium">Data Analytics</span>
                          </div>
                        </div>
                      `;
                    }}
                  />
                  <div className="text-center">
                    <h4 className="text-lg font-bold text-white mb-2">Advanced Analytics</h4>
                    <p className="text-white/80 text-sm">
                      Our AI-powered platform provides comprehensive insights for regulatory compliance and risk assessment.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-gradient-to-br from-accent/5 to-primary/5">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center">
            <h2 className="text-4xl font-bold text-foreground mb-6">
              Ready to Transform <span className="text-primary">Credit Assessment</span>?
            </h2>
            <p className="text-xl text-muted-foreground mb-8">
              Join the future of inclusive credit scoring. Partner with Zacca.ai to implement 
              Dynamic Credit Scoring and unlock new opportunities for financial inclusion.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-primary hover:bg-primary/90 text-white px-10 py-5">
                <Users className="w-5 h-5 mr-2" />
                Partner With Us
                <ArrowRight className="w-5 h-5 ml-2" />
              </Button>
              <Button variant="outline" size="lg" className="border-primary text-primary hover:bg-primary hover:text-white px-10 py-5">
                <Lightbulb className="w-5 h-5 mr-2" />
                Schedule Demo
              </Button>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </main>
  );
};

export default DynamicCreditScoring;
