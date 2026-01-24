import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { 
  Smartphone, 
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
  Lightbulb
} from "lucide-react";
import erpImage from "@/assets/ERP.png";
import smallBusinessImage from "@/assets/AFRICAN SMALL BUSINESS.png";
import informalMsmeImage from "@/assets/INFORMAL AFRICAN MSME.png";

export default function ManagerAI() {
  const features = [
    {
      icon: <FileText className="w-8 h-8" />,
      title: "Expense Monitoring",
      description: "Track and categorize business expenses automatically with AI-powered insights."
    },
    {
      icon: <Calculator className="w-8 h-8" />,
      title: "Invoice Creation",
      description: "Generate professional invoices instantly using AI from simple text descriptions."
    },
    {
      icon: <Database className="w-8 h-8" />,
      title: "Inventory Management",
      description: "Smart inventory tracking with automated reorder alerts and stock optimization."
    },
    {
      icon: <Target className="w-8 h-8" />,
      title: "Budgeting",
      description: "AI-powered budget planning and real-time financial goal tracking."
    },
    {
      icon: <Shield className="w-8 h-8" />,
      title: "Tax & Compliance",
      description: "Automated tax calculations and compliance reporting for seamless regulatory adherence."
    },
    {
      icon: <TrendingUp className="w-8 h-8" />,
      title: "Revenue Monitoring",
      description: "Real-time revenue tracking with predictive analytics and growth insights."
    },
    {
      icon: <BarChart3 className="w-8 h-8" />,
      title: "Excel Sync",
      description: "Seamless integration with existing Excel files and spreadsheet workflows."
    },
    {
      icon: <PieChart className="w-8 h-8" />,
      title: "Business Health Analytics",
      description: "Comprehensive business performance metrics and actionable insights dashboard."
    }
  ];

  const challenges = [
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Rigid & Expensive ERPs",
      description: "Conventional ERPs are inaccessible and unattractive to MSMEs due to high costs and complexity."
    },
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Lite ERP Limitations",
      description: "Alternative ERPs still require heavy user input, manual data transfers, and high internet bandwidth."
    },
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Informal Record Keeping",
      description: "MSMEs rely on spreadsheets and social media messages, making credible business records challenging."
    },
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Connectivity Constraints",
      description: "Businesses use normal data bundles, not WiFi, limiting access to bandwidth-intensive solutions."
    }
  ];

  const statistics = [
    {
      number: "98%",
      label: "of businesses are MSMEs",
      description: "Constituting 30% of employment opportunities in Kenya"
    },
    {
      number: "90%",
      label: "have record challenges",
      description: "Struggling with credible business records for financial statements"
    },
    {
      number: "$1.08B",
      label: "credit gap",
      description: "Due to lack of formal accepted business records"
    },
    {
      number: "35%",
      label: "women credit users",
      description: "Despite making up nearly half the population"
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
                  <Smartphone className="w-4 h-4 mr-2" />
                  Mobile-First ERP Solution
                </Badge>
                <h1 className="text-5xl font-bold text-white mb-6 leading-tight">
                  ManagER.ai
                </h1>
                <p className="text-xl text-white/90 leading-relaxed mb-8">
                  A simplified Enterprise Resource Planning (ERP) system designed for formal and informal businesses, 
                  powered by AI and optimized for mobile connectivity.
                </p>
                <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
                  <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                    <Smartphone className="w-5 h-5 mr-2" />
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
                    src={erpImage}
                    alt="ManagER.ai ERP system interface"
                    className="w-full h-64 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                      e.currentTarget.parentElement.innerHTML = `
                        <div class="w-full h-64 bg-gradient-to-br from-white/20 via-white/10 to-white/20 rounded-xl flex items-center justify-center">
                          <div class="text-center">
                            <div class="w-16 h-16 bg-gradient-to-br from-accent to-white rounded-full mx-auto mb-3 flex items-center justify-center">
                              <span class="text-primary text-2xl font-bold">AI</span>
                            </div>
                            <span class="text-white text-sm font-medium">ERP System</span>
                          </div>
                        </div>
                      `;
                    }}
                  />
                  <div className="text-center">
                    <h4 className="text-lg font-bold text-white mb-2">AI-Powered ERP</h4>
                    <p className="text-white/80 text-sm">
                      Streamlined business management for MSMEs with minimal manual input.
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
                The Challenge
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Why Traditional ERPs <span className="text-red-600">Fail MSMEs</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                The rigidity and cost of conventional ERPs make them inaccessible and unattractive to MSMEs, 
                creating a massive gap in business management solutions.
              </p>
            </div>

            {/* Problem Details */}
            <div className="grid lg:grid-cols-2 gap-12 items-center mb-16">
              <div className="space-y-6">
                {challenges.map((challenge, index) => (
                  <div key={index} className="flex items-start gap-4">
                    {challenge.icon}
                    <div>
                      <h3 className="text-2xl font-bold text-foreground mb-3">{challenge.title}</h3>
                      <p className="text-muted-foreground leading-relaxed">
                        {challenge.description}
                      </p>
                    </div>
                  </div>
                ))}
              </div>
              
              <div className="relative">
                <div className="bg-gradient-to-br from-red-50 to-red-100 rounded-3xl p-8 border-2 border-red-200 relative overflow-hidden">
                  <img
                    src={smallBusinessImage}
                    alt="African small business struggling with traditional ERP systems"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <div className="text-center">
                    <FileText className="w-12 h-12 text-red-500 mx-auto mb-3" />
                    <h4 className="text-lg font-bold text-foreground mb-2">Current Reality</h4>
                    <p className="text-muted-foreground text-sm">
                      MSMEs use spreadsheets and social media messages as their primary business records, 
                      making formal financial statements nearly impossible.
                    </p>
                  </div>
                </div>
              </div>
            </div>

            {/* Statistics */}
            <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
              {statistics.map((stat, index) => (
                <Card key={index} className="p-6 text-center border-2 border-red-200 hover:border-red-300 transition-all duration-300">
                  <div className="text-4xl font-bold text-red-600 mb-2">{stat.number}</div>
                  <div className="text-lg font-semibold text-foreground mb-2">{stat.label}</div>
                  <div className="text-sm text-muted-foreground">{stat.description}</div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Solution Section */}
      <section className="py-20 bg-gradient-to-br from-green-50 to-green-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-green-500 text-white font-semibold px-4 py-2">
                <Lightbulb className="w-4 h-4 mr-2" />
                Our Solution
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                ManagER.ai: <span className="text-green-600">The Future of MSME Management</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto mb-8">
                A mobile-based solution that reduces manual input through Generative AI and operates 
                efficiently on low data bandwidth, enabling seamless and affordable record keeping.
              </p>
            </div>

            <div className="grid lg:grid-cols-2 gap-12 items-center mb-16">
              <div className="space-y-6">
                <div className="flex items-start gap-4">
                  <Zap className="w-8 h-8 text-green-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">AI-Powered Automation</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Generative AI creates content from text and images, dramatically reducing manual data entry 
                      and making business management effortless.
                    </p>
                  </div>
                </div>
                
                <div className="flex items-start gap-4">
                  <Globe className="w-8 h-8 text-green-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">Low Bandwidth Design</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Optimized for normal data bundles from Safaricom and Airtel, ensuring accessibility 
                      for businesses without WiFi connectivity.
                    </p>
                  </div>
                </div>

                <div className="flex items-start gap-4">
                  <Shield className="w-8 h-8 text-green-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">Blockchain Security</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Audited financial statements stored securely on blockchain, providing credibility 
                      and transparency for credit applications.
                    </p>
                  </div>
                </div>
              </div>
              
              <div className="relative">
                <div className="bg-gradient-to-br from-green-50 to-green-100 rounded-3xl p-8 border-2 border-green-200 relative overflow-hidden">
                  <img
                    src={informalMsmeImage}
                    alt="Informal African MSME using ManagER.ai mobile solution"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <div className="text-center">
                    <Smartphone className="w-12 h-12 text-green-500 mx-auto mb-3" />
                    <h4 className="text-lg font-bold text-foreground mb-2">Mobile-First Design</h4>
                    <p className="text-muted-foreground text-sm">
                      Designed specifically for mobile devices with minimal data usage, 
                      perfect for MSMEs using standard data bundles.
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
                ManagER.ai provides a complete suite of business management tools designed specifically 
                for MSMEs, from expense tracking to compliance reporting.
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

      {/* Benefits Section */}
      <section className="py-20 bg-gradient-to-br from-accent/10 to-accent/20">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-accent text-primary font-semibold px-4 py-2">
                <Award className="w-4 h-4 mr-2" />
                Key Benefits
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Why Choose <span className="text-accent">ManagER.ai</span>
              </h2>
            </div>

            <div className="grid md:grid-cols-3 gap-8">
              <Card className="p-8 text-center border-2 border-accent/20 hover:border-accent/40 transition-all duration-300">
                <Users className="w-16 h-16 text-accent mx-auto mb-6" />
                <h3 className="text-2xl font-bold text-foreground mb-4">Designed for MSMEs</h3>
                <p className="text-muted-foreground leading-relaxed">
                  Built specifically for small and medium enterprises, addressing their unique 
                  challenges and resource constraints.
                </p>
              </Card>

              <Card className="p-8 text-center border-2 border-accent/20 hover:border-accent/40 transition-all duration-300">
                <Zap className="w-16 h-16 text-accent mx-auto mb-6" />
                <h3 className="text-2xl font-bold text-foreground mb-4">AI-Powered Efficiency</h3>
                <p className="text-muted-foreground leading-relaxed">
                  Reduce manual work by up to 80% with intelligent automation and 
                  generative AI content creation.
                </p>
              </Card>

              <Card className="p-8 text-center border-2 border-accent/20 hover:border-accent/40 transition-all duration-300">
                <Globe className="w-16 h-16 text-accent mx-auto mb-6" />
                <h3 className="text-2xl font-bold text-foreground mb-4">Low Data Usage</h3>
                <p className="text-muted-foreground leading-relaxed">
                  Optimized for standard data bundles, making it accessible to businesses 
                  without WiFi connectivity.
                </p>
              </Card>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-gradient-to-br from-primary to-primary/80">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center">
            <h2 className="text-4xl font-bold text-white mb-6">
              Ready to Transform Your <span className="text-accent">Business Management?</span>
            </h2>
            <p className="text-xl text-white/90 leading-relaxed mb-8">
              Join thousands of MSMEs already using ManagER.ai to streamline their operations, 
              improve record keeping, and access better credit opportunities.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <Smartphone className="w-5 h-5 mr-2" />
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
