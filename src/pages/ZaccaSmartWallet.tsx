import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { 
  Wallet, 
  TrendingUp, 
  Shield, 
  BarChart3, 
  FileText, 
  Calculator,
  PieChart,
  CheckCircle,
  AlertTriangle,
  Users,
  Globe,
  Zap,
  Database,
  ArrowRight,
  Star,
  Award,
  Target,
  Lightbulb,
  Smartphone,
  CreditCard,
  Coins,
  Building2,
  Clock,
  DollarSign,
  Lock,
  Brain,
  MessageSquare,
  PiggyBank,
  Receipt
} from "lucide-react";
import smartWalletImage from "@/assets/smart wallet.png";
import financialPlanningImage from "@/assets/Financial Planning.png";
import smallBusinessImage from "@/assets/AFRICAN SMALL BUSINESS.png";

export default function ZaccaSmartWallet() {
  const features = [
    {
      icon: <Brain className="w-8 h-8" />,
      title: "AI Financial Scenario Modeling",
      description: "SMEs can simulate future financial decisions, such as taking on a new loan. AI evaluates the impact on future cash flow and overall financial health."
    },
    {
      icon: <MessageSquare className="w-8 h-8" />,
      title: "Embedded Finance in Social Media",
      description: "Fully embedded finance within all social media conversations, enabling seamless financial interactions."
    },
    {
      icon: <Target className="w-8 h-8" />,
      title: "Real-time Financial Coaching",
      description: "AI-powered coaching based on business goals and behaviors, providing personalized financial guidance."
    },
    {
      icon: <PiggyBank className="w-8 h-8" />,
      title: "Automated Savings & Investments",
      description: "Seamless automation of savings, bill payments, and investment strategies tailored to your business needs."
    },
    {
      icon: <Coins className="w-8 h-8" />,
      title: "Zacca Token Utility",
      description: "Power B2B/P2P payments, insurance fee payments, loan repayments, and DeFi yield farming."
    },
    {
      icon: <Lock className="w-8 h-8" />,
      title: "Gasless Blockchain Transactions",
      description: "Low transaction costs through gasless blockchain technology, eliminating traditional banking fees."
    },
    {
      icon: <Building2 className="w-8 h-8" />,
      title: "Digital Collateral Transformation",
      description: "Transform business equipment, stock, and verified receivables into digital assets for collateral."
    },
    {
      icon: <BarChart3 className="w-8 h-8" />,
      title: "Business Performance Broadcasting",
      description: "Your business performance is broadcasted to potential lenders, enabling smart loan and insurance offers."
    }
  ];

  const walletSteps = [
    {
      step: "1",
      title: "Professional Business Wallet",
      description: "You'll have a wallet designed for professional business operations, not just personal use."
    },
    {
      step: "2", 
      title: "AI Financial Planning",
      description: "Allow our AI to manage your money and provide comprehensive financial planning tailored to your business."
    },
    {
      step: "3",
      title: "Smart Business Assistant",
      description: "AI business assistant notifies you about pending expenses, unpaid suppliers, and critical business tasks."
    },
    {
      step: "4",
      title: "24/7 Active Wallet",
      description: "This is not a static wallet – it works for you while you sleep, continuously optimizing your finances."
    },
    {
      step: "5",
      title: "Credit Data Broadcasting",
      description: "Your business performance is broadcasted to potential lenders, who will be clamoring for your sovereign credit data."
    },
    {
      step: "6",
      title: "Smart Offers",
      description: "Receive smart loan and insurance offers based on your business performance and creditworthiness."
    },
    {
      step: "7",
      title: "Digital Collateral",
      description: "No collateral? No problem! We transform your business equipment, stock, and verified receivables into digital assets."
    }
  ];

  const problems = [
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Prohibitive Transaction Costs",
      description: "Existing mobile money wallets are characterized by high transaction fees that eat into business profits."
    },
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Limited Interoperability",
      description: "Lack of seamless integration between different payment systems and financial services."
    },
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Bank Mobile Wallet Limitations",
      description: "Banks' mobile wallets facilitate money transfer but lack comprehensive merchant services."
    },
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Cash Float Management Issues",
      description: "Managing cash float in commercial banks attracts banking fees and consumes valuable time."
    }
  ];

  const benefits = [
    {
      icon: <Zap className="w-16 h-16 text-accent" />,
      title: "AI-Powered Intelligence",
      description: "Advanced AI algorithms provide real-time financial insights and automated decision-making for your business."
    },
    {
      icon: <DollarSign className="w-16 h-16 text-accent" />,
      title: "Low Transaction Costs",
      description: "Gasless blockchain technology eliminates traditional banking fees, saving you money on every transaction."
    },
    {
      icon: <Shield className="w-16 h-16 text-accent" />,
      title: "Blockchain Security",
      description: "Enterprise-grade security powered by blockchain technology, ensuring your funds and data are always protected."
    }
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-background to-primary/5">
      <Header />
      
      {/* Hero Section */}
      <section className="relative pt-32 pb-20 bg-gradient-to-br from-primary via-primary/90 to-primary/80 overflow-hidden">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              <div className="text-center lg:text-left">
                <Badge className="mb-6 bg-accent text-primary font-semibold px-4 py-2">
                  <Wallet className="w-4 h-4 mr-2" />
                  AI-Powered Smart Wallet
                </Badge>
                <h1 className="text-5xl font-bold text-white mb-6 leading-tight">
                  Zacca Smart Wallet
                </h1>
                <p className="text-xl text-white/90 leading-relaxed mb-8">
                  An AI- and blockchain-powered alternative to existing mobile money wallets, 
                  designed for simplicity, intuitive use, and comprehensive business financial management.
                </p>
                <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
                  <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                    <Wallet className="w-5 h-5 mr-2" />
                    Get Started
                  </Button>
                  <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                    <FileText className="w-5 h-5 mr-2" />
                    Learn More
                  </Button>
                </div>
              </div>
              
              <div className="relative">
                <div className="bg-white/10 backdrop-blur-sm rounded-3xl p-8 border border-white/20">
                  <img
                    src={smartWalletImage}
                    alt="Zacca Smart Wallet interface"
                    className="w-full h-64 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                      e.currentTarget.parentElement.innerHTML = `
                        <div class="w-full h-64 bg-gradient-to-br from-white/20 via-white/10 to-white/20 rounded-xl flex items-center justify-center">
                          <div class="text-center">
                            <div class="w-16 h-16 bg-gradient-to-br from-accent to-white rounded-full mx-auto mb-3 flex items-center justify-center">
                              <span class="text-primary text-2xl font-bold">AI</span>
                            </div>
                            <span class="text-white text-sm font-medium">Smart Wallet</span>
                          </div>
                        </div>
                      `;
                    }}
                  />
                  <div className="text-center">
                    <h4 className="text-lg font-bold text-white mb-2">AI-Powered Wallet</h4>
                    <p className="text-white/80 text-sm">
                      Intelligent financial management that works for you 24/7.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Problem Statement */}
      <section className="py-20 bg-gradient-to-br from-red-50 to-red-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-red-500 text-white font-semibold px-4 py-2">
                <AlertTriangle className="w-4 h-4 mr-2" />
                Current Challenges
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Why Existing Wallets <span className="text-red-600">Fall Short</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Current mobile money wallets are characterized by prohibitive transaction costs, 
                limited interoperability, and lack comprehensive business services.
              </p>
            </div>

            <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
              {problems.map((problem, index) => (
                <Card key={index} className="p-6 text-center border-2 border-red-200 hover:border-red-300 transition-all duration-300">
                  <div className="text-red-500 mb-4 flex justify-center">
                    {problem.icon}
                  </div>
                  <h3 className="text-lg font-bold text-foreground mb-3">{problem.title}</h3>
                  <p className="text-muted-foreground text-sm leading-relaxed">{problem.description}</p>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Solution Overview */}
      <section className="py-20 bg-gradient-to-br from-green-50 to-green-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-green-500 text-white font-semibold px-4 py-2">
                <Lightbulb className="w-4 h-4 mr-2" />
                Our Solution
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Zacca Smart Wallet: <span className="text-green-600">The Future of Business Finance</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto mb-8">
                Targeted towards small and micro enterprises, our wallet eliminates transaction fees 
                through gasless blockchain technology while providing comprehensive AI-powered financial services.
              </p>
            </div>

            <div className="grid lg:grid-cols-2 gap-12 items-center mb-16">
              <div className="space-y-6">
                <div className="flex items-start gap-4">
                  <Zap className="w-8 h-8 text-green-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">AI-Powered Intelligence</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Advanced AI algorithms provide real-time financial insights, scenario modeling, 
                      and automated decision-making tailored to your business needs.
                    </p>
                  </div>
                </div>
                
                <div className="flex items-start gap-4">
                  <Globe className="w-8 h-8 text-green-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">Gasless Blockchain</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Low transaction costs through gasless blockchain technology, 
                      eliminating traditional banking fees and float management issues.
                    </p>
                  </div>
                </div>

                <div className="flex items-start gap-4">
                  <Shield className="w-8 h-8 text-green-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">Comprehensive Services</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Beyond simple money transfer – complete merchant services, 
                      embedded finance, and seamless integration with social media platforms.
                    </p>
                  </div>
                </div>
              </div>
              
              <div className="relative">
                <div className="bg-gradient-to-br from-green-50 to-green-100 rounded-3xl p-8 border-2 border-green-200 relative overflow-hidden">
                  <img
                    src={financialPlanningImage}
                    alt="AI financial planning and scenario modeling"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <div className="text-center">
                    <Brain className="w-12 h-12 text-green-500 mx-auto mb-3" />
                    <h4 className="text-lg font-bold text-foreground mb-2">AI Financial Planning</h4>
                    <p className="text-muted-foreground text-sm">
                      Simulate future financial decisions and evaluate their impact 
                      on your business's cash flow and overall financial health.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20 bg-gradient-to-br from-primary/5 to-primary/10">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-primary text-white font-semibold px-4 py-2">
                <Star className="w-4 h-4 mr-2" />
                Comprehensive Features
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Everything Your Business <span className="text-primary">Needs</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Zacca Smart Wallet provides a complete suite of AI-powered financial tools 
                designed specifically for small and micro enterprises.
              </p>
            </div>

            <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
              {features.map((feature, index) => (
                <Card key={index} className="p-6 border-2 border-primary/20 hover:border-primary/40 transition-all duration-300 group hover:shadow-lg">
                  <div className="text-primary mb-4 group-hover:scale-110 transition-transform duration-300">
                    {feature.icon}
                  </div>
                  <h3 className="text-xl font-bold text-foreground mb-3">{feature.title}</h3>
                  <p className="text-muted-foreground leading-relaxed">{feature.description}</p>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* How It Works */}
      <section className="py-20 bg-gradient-to-br from-accent/10 to-accent/20">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-accent text-primary font-semibold px-4 py-2">
                <Award className="w-4 h-4 mr-2" />
                How It Works
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Your Journey to <span className="text-accent">Smart Finance</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Experience the power of AI-driven financial management in 7 simple steps.
              </p>
            </div>

            <div className="space-y-8">
              {walletSteps.map((step, index) => (
                <Card key={index} className="p-8 border-2 border-accent/20 hover:border-accent/40 transition-all duration-300">
                  <div className="grid lg:grid-cols-3 gap-8 items-center">
                    <div className="text-center lg:text-left">
                      <div className="text-4xl font-bold text-accent mb-2">{step.step}</div>
                      <h4 className="text-2xl font-bold text-foreground mb-3">{step.title}</h4>
                    </div>
                    <div className="lg:col-span-2">
                      <p className="text-lg text-foreground leading-relaxed">{step.description}</p>
                    </div>
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Benefits Section */}
      <section className="py-20 bg-gradient-to-br from-blue-50 to-blue-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-blue-500 text-white font-semibold px-4 py-2">
                <Target className="w-4 h-4 mr-2" />
                Key Benefits
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Why Choose <span className="text-blue-600">Zacca Smart Wallet</span>
              </h2>
            </div>

            <div className="grid md:grid-cols-3 gap-8">
              {benefits.map((benefit, index) => (
                <Card key={index} className="p-8 text-center border-2 border-blue-200 hover:border-blue-300 transition-all duration-300">
                  <div className="text-blue-500 mb-6 flex justify-center">
                    {benefit.icon}
                  </div>
                  <h3 className="text-2xl font-bold text-foreground mb-4">{benefit.title}</h3>
                  <p className="text-muted-foreground leading-relaxed">{benefit.description}</p>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Target Audience */}
      <section className="py-20 bg-gradient-to-br from-purple-50 to-purple-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              <div>
                <Badge className="mb-4 bg-purple-500 text-white font-semibold px-4 py-2">
                  <Users className="w-4 h-4 mr-2" />
                  Target Audience
                </Badge>
                <h2 className="text-4xl font-bold text-foreground mb-6">
                  Built for <span className="text-purple-600">Small & Micro Enterprises</span>
                </h2>
                <p className="text-xl text-muted-foreground leading-relaxed mb-8">
                  Specifically designed for businesses that use alternative mobile payment systems 
                  (cash-in/cash-out) to bypass transaction fees, but face inherent float limitations.
                </p>
                <div className="space-y-4">
                  <div className="flex items-center gap-3">
                    <CheckCircle className="w-6 h-6 text-purple-500" />
                    <span className="text-foreground font-medium">Eliminate banking fees and time constraints</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="w-6 h-6 text-purple-500" />
                    <span className="text-foreground font-medium">Overcome cash float limitations</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="w-6 h-6 text-purple-500" />
                    <span className="text-foreground font-medium">Access comprehensive merchant services</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="w-6 h-6 text-purple-500" />
                    <span className="text-foreground font-medium">Leverage AI for financial optimization</span>
                  </div>
                </div>
              </div>
              
              <div className="relative">
                <div className="bg-gradient-to-br from-purple-50 to-purple-100 rounded-3xl p-8 border-2 border-purple-200 relative overflow-hidden">
                  <img
                    src={smallBusinessImage}
                    alt="Small and micro enterprises using Zacca Smart Wallet"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <div className="text-center">
                    <Building2 className="w-12 h-12 text-purple-500 mx-auto mb-3" />
                    <h4 className="text-lg font-bold text-foreground mb-2">Perfect for SMEs</h4>
                    <p className="text-muted-foreground text-sm">
                      Designed specifically for small and micro enterprises 
                      looking to optimize their financial operations.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-gradient-to-br from-primary to-primary/80">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center">
            <h2 className="text-4xl font-bold text-white mb-6">
              Ready to Transform Your <span className="text-accent">Business Finance?</span>
            </h2>
            <p className="text-xl text-white/90 leading-relaxed mb-8">
              Join thousands of SMEs already using Zacca Smart Wallet to optimize their financial operations, 
              reduce transaction costs, and access AI-powered business insights.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <Wallet className="w-5 h-5 mr-2" />
                Start Free Trial
              </Button>
              <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                <FileText className="w-5 h-5 mr-2" />
                Download Brochure
              </Button>
            </div>
          </div>
        </div>
      </section>
      
      <Footer />
    </div>
  );
}

