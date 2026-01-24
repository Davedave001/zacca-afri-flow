import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { 
  BarChart3, 
  TrendingUp, 
  Shield, 
  Database, 
  FileText, 
  CheckCircle,
  Users,
  Globe,
  Zap,
  Star,
  Award,
  Target,
  Lightbulb,
  Smartphone,
  Building2,
  Clock,
  DollarSign,
  Brain,
  PiggyBank,
  Activity,
  Network,
  Camera
} from "lucide-react";
import analyticsImage from "@/assets/Analytics (1).png";
import apiImage from "@/assets/API (1).png";
import dataAnalyticsImage from "@/assets/data-analytics-hero.png.png";
import smallBusinessImage from "@/assets/AFRICAN SMALL BUSINESS.png";

export default function AnalyticsAsAService() {
  const serviceFeatures = [
    {
      icon: <BarChart3 className="w-8 h-8 text-primary" />,
      title: "360° Borrower View",
      description: "Unique Digital Number (UDN) enables lenders to have comprehensive borrower insights through Zacca.ai API.",
      benefits: ["Complete borrower profile", "Credit history analysis", "Risk assessment", "Behavioral patterns"]
    },
    {
      icon: <Database className="w-8 h-8 text-primary" />,
      title: "Interoperable Credit Database",
      description: "Common and interoperable credit database that lenders currently lack, providing unified data access.",
      benefits: ["Unified data platform", "Cross-lender insights", "Standardized metrics", "Real-time updates"]
    },
    {
      icon: <Brain className="w-8 h-8 text-primary" />,
      title: "Thought Leadership Data",
      description: "Premium SME and consumer credit data for decision-making and innovation in financial services.",
      benefits: ["Market insights", "Trend analysis", "Predictive modeling", "Strategic guidance"]
    },
    {
      icon: <Zap className="w-8 h-8 text-primary" />,
      title: "Plug-and-Play Analytics",
      description: "Analytics-as-a-Service engine transforms raw unstructured creditor data into invaluable insights.",
      benefits: ["No infrastructure needed", "Instant insights", "Scalable processing", "Cost-effective solution"]
    },
    {
      icon: <Network className="w-8 h-8 text-primary" />,
      title: "API Integration",
      description: "Seamless integration with banks, micro-finance, micro lenders, and insurers through robust API.",
      benefits: ["Easy integration", "Real-time data", "Secure access", "Customizable endpoints"]
    },
    {
      icon: <TrendingUp className="w-8 h-8 text-primary" />,
      title: "Innovation Acceleration",
      description: "Free local lenders from perpetual funding rounds, directing resources to higher liquidity for lending.",
      benefits: ["Reduced innovation costs", "Faster time-to-market", "Competitive advantage", "Resource optimization"]
    }
  ];

  const targetInstitutions = [
    {
      icon: <Building2 className="w-12 h-12 text-blue-500" />,
      title: "Banks",
      description: "Traditional banking institutions seeking advanced credit analytics and risk management capabilities.",
      benefits: ["Enhanced risk assessment", "Improved loan portfolio management", "Regulatory compliance", "Customer insights"]
    },
    {
      icon: <PiggyBank className="w-12 h-12 text-green-500" />,
      title: "Micro-Finance Institutions",
      description: "MFIs looking to optimize their lending processes and expand their customer base with data-driven insights.",
      benefits: ["Better credit decisions", "Reduced default rates", "Market expansion", "Operational efficiency"]
    },
    {
      icon: <Smartphone className="w-12 h-12 text-purple-500" />,
      title: "Digital Lenders",
      description: "Fintech companies and digital lending platforms requiring real-time credit assessment and analytics.",
      benefits: ["Real-time processing", "Automated decisions", "Scalable operations", "Customer experience"]
    },
    {
      icon: <Shield className="w-12 h-12 text-orange-500" />,
      title: "Insurers",
      description: "Insurance companies needing comprehensive risk profiles and behavioral data for policy underwriting.",
      benefits: ["Risk profiling", "Fraud detection", "Policy optimization", "Claims management"]
    }
  ];

  const dataSources = [
    {
      icon: <FileText className="w-8 h-8 text-green-500" />,
      title: "Zacca Operating System",
      description: "Credit layer data from our comprehensive operating system providing real-time business insights.",
      dataTypes: ["Transaction data", "Business performance", "Credit behavior", "Payment patterns"]
    },
    {
      icon: <Users className="w-8 h-8 text-blue-500" />,
      title: "SME & Consumer Data",
      description: "Premium SME and consumer credit data for comprehensive market analysis and trend identification.",
      dataTypes: ["Customer profiles", "Credit history", "Behavioral patterns", "Market trends"]
    },
    {
      icon: <Network className="w-8 h-8 text-purple-500" />,
      title: "Affiliated Fintechs",
      description: "Data from indigenous affiliated fintechs, digital lenders, and financial institutions.",
      dataTypes: ["Cross-platform data", "Industry benchmarks", "Competitive insights", "Market dynamics"]
    },
    {
      icon: <Database className="w-8 h-8 text-orange-500" />,
      title: "External Data Sources",
      description: "Integration with external data sources for comprehensive market intelligence and validation.",
      dataTypes: ["Market data", "Economic indicators", "Regulatory information", "Industry reports"]
    }
  ];

  const competitiveAdvantages = [
    {
      icon: <Award className="w-8 h-8 text-green-500" />,
      title: "Level Playing Field",
      description: "Enables local lenders to compete with foreign lenders who have access to Silicon Valley funding and innovative ideas.",
      impact: "Competitive parity with international players"
    },
    {
      icon: <DollarSign className="w-8 h-8 text-blue-500" />,
      title: "Cost Reduction",
      description: "Eliminates the need for expensive AI or blockchain infrastructure investments.",
      impact: "Significant cost savings and resource optimization"
    },
    {
      icon: <Clock className="w-8 h-8 text-purple-500" />,
      title: "Faster Innovation",
      description: "Accelerates innovation cycles without the burden of perpetual funding rounds.",
      impact: "Reduced time-to-market for new products"
    },
    {
      icon: <Target className="w-8 h-8 text-orange-500" />,
      title: "Focus on Core Business",
      description: "Allows lenders to direct resources to higher liquidity for lending instead of technology development.",
      impact: "Improved business focus and operational efficiency"
    }
  ];


  const statistics = [
    {
      value: "360°",
      label: "Borrower View",
      description: "Comprehensive borrower insights"
    },
    {
      value: "100%",
      label: "Data Coverage",
      description: "Complete credit database"
    },
    {
      value: "Real-time",
      label: "Analytics",
      description: "Instant data processing"
    },
    {
      value: "API-First",
      label: "Integration",
      description: "Seamless system integration"
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
                  <BarChart3 className="w-4 h-4 mr-2" />
                  Analytics-as-a-Service
                </Badge>
                <h1 className="text-5xl font-bold text-white mb-6 leading-tight">
                  Analytics-as-a-Service
                </h1>
                <p className="text-xl text-white/90 leading-relaxed mb-8">
                  Transform raw unstructured creditor data into invaluable insights without expensive AI or blockchain infrastructure. 
                  Our plug-and-play analytics engine provides 360° borrower views and thought leadership data for informed decision-making.
                </p>
                <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
                  <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                    <BarChart3 className="w-5 h-5 mr-2" />
                    Get Analytics
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
                    src={analyticsImage}
                    alt="Analytics-as-a-Service platform"
                    className="w-full h-64 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                      e.currentTarget.parentElement.innerHTML = `
                        <div class="w-full h-64 bg-gradient-to-br from-white/20 via-white/10 to-white/20 rounded-xl flex items-center justify-center">
                          <div class="text-center">
                            <div class="w-16 h-16 bg-gradient-to-br from-accent to-white rounded-full mx-auto mb-3 flex items-center justify-center">
                              <span class="text-primary text-2xl font-bold">AaaS</span>
                            </div>
                            <span class="text-white text-sm font-medium">Analytics Platform</span>
                          </div>
                        </div>
                      `;
                    }}
                  />
                  <div className="text-center">
                    <h4 className="text-lg font-bold text-white mb-2">Data Analytics Engine</h4>
                    <p className="text-white/80 text-sm">
                      Comprehensive analytics platform for credit data and borrower insights.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Statistics */}
      <section className="py-16 bg-gradient-to-br from-blue-50 to-blue-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-12">
              <Badge className="mb-4 bg-blue-500 text-white font-semibold px-4 py-2">
                <Activity className="w-4 h-4 mr-2" />
                Platform Overview
              </Badge>
              <h2 className="text-3xl font-bold text-foreground mb-4">
                Analytics-as-a-Service <span className="text-blue-600">Capabilities</span>
              </h2>
            </div>

            <div className="grid md:grid-cols-4 gap-8">
              {statistics.map((stat, index) => (
                <Card key={index} className="p-6 text-center border-2 border-blue-200 bg-blue-50">
                  <div className="text-4xl font-extrabold text-blue-600 mb-2">{stat.value}</div>
                  <h3 className="text-lg font-semibold text-foreground mb-1">{stat.label}</h3>
                  <p className="text-sm text-muted-foreground">{stat.description}</p>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Service Features */}
      <section className="py-20 bg-gradient-to-br from-green-50 to-green-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-green-500 text-white font-semibold px-4 py-2">
                <Lightbulb className="w-4 h-4 mr-2" />
                Core Features
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Comprehensive <span className="text-green-600">Analytics Platform</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Our Analytics-as-a-Service platform provides comprehensive credit data analysis, 
                borrower insights, and thought leadership data for informed financial decision-making.
              </p>
            </div>

            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
              {serviceFeatures.map((feature, index) => (
                <Card key={index} className="p-6 border-2 border-green-200 hover:border-green-300 transition-all duration-300 group hover:shadow-lg">
                  <div className="text-green-500 mb-4 group-hover:scale-110 transition-transform duration-300">
                    {feature.icon}
                  </div>
                  <h3 className="text-xl font-bold text-foreground mb-3">{feature.title}</h3>
                  <p className="text-muted-foreground leading-relaxed mb-4">{feature.description}</p>
                  <div className="space-y-2">
                    {feature.benefits.map((benefit, benefitIndex) => (
                      <div key={benefitIndex} className="flex items-center gap-2">
                        <CheckCircle className="w-4 h-4 text-green-500 flex-shrink-0" />
                        <span className="text-sm text-muted-foreground">{benefit}</span>
                      </div>
                    ))}
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Target Institutions */}
      <section className="py-20 bg-gradient-to-br from-purple-50 to-purple-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-purple-500 text-white font-semibold px-4 py-2">
                <Users className="w-4 h-4 mr-2" />
                Target Institutions
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Serving <span className="text-purple-600">Financial Institutions</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Our Analytics-as-a-Service platform serves a wide range of financial institutions, 
                from traditional banks to innovative fintech companies, providing tailored solutions for each sector.
              </p>
            </div>

            <div className="grid md:grid-cols-2 gap-8">
              {targetInstitutions.map((institution, index) => (
                <Card key={index} className="p-8 border-2 border-purple-200 hover:border-purple-300 transition-all duration-300">
                  <div className="text-center mb-6">
                    <div className="text-purple-500 mb-4 flex justify-center">
                      {institution.icon}
                    </div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">{institution.title}</h3>
                    <p className="text-muted-foreground leading-relaxed mb-4">{institution.description}</p>
                  </div>
                  <div className="space-y-3">
                    {institution.benefits.map((benefit, benefitIndex) => (
                      <div key={benefitIndex} className="flex items-center gap-3">
                        <CheckCircle className="w-5 h-5 text-purple-500 flex-shrink-0" />
                        <span className="text-foreground font-medium">{benefit}</span>
                      </div>
                    ))}
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Data Sources */}
      <section className="py-20 bg-gradient-to-br from-primary/5 to-primary/10">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-primary text-white font-semibold px-4 py-2">
                <Database className="w-4 h-4 mr-2" />
                Data Sources
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Comprehensive <span className="text-primary">Data Infrastructure</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Our data ownership infrastructure enables us to offer comprehensive analytics 
                from our suite of services and lab for thought leadership in the industry.
              </p>
            </div>

            <div className="grid md:grid-cols-2 gap-8">
              {dataSources.map((source, index) => (
                <Card key={index} className="p-6 border-2 border-primary/20 hover:border-primary/40 transition-all duration-300">
                  <div className="text-primary mb-4 flex justify-center">
                    {source.icon}
                  </div>
                  <h3 className="text-xl font-bold text-foreground mb-3 text-center">{source.title}</h3>
                  <p className="text-muted-foreground leading-relaxed mb-4 text-center">{source.description}</p>
                  <div className="space-y-2">
                    {source.dataTypes.map((type, typeIndex) => (
                      <div key={typeIndex} className="flex items-center gap-2">
                        <CheckCircle className="w-4 h-4 text-primary flex-shrink-0" />
                        <span className="text-sm text-muted-foreground">{type}</span>
                      </div>
                    ))}
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Competitive Advantages */}
      <section className="py-20 bg-gradient-to-br from-orange-50 to-orange-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-orange-500 text-white font-semibold px-4 py-2">
                <Award className="w-4 h-4 mr-2" />
                Competitive Advantages
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Leveling the <span className="text-orange-600">Playing Field</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Our Analytics-as-a-Service platform enables local lenders to compete effectively 
                with foreign lenders who have access to Silicon Valley funding and innovative ideas.
              </p>
            </div>

            <div className="grid md:grid-cols-2 gap-8">
              {competitiveAdvantages.map((advantage, index) => (
                <Card key={index} className="p-6 border-2 border-orange-200 hover:border-orange-300 transition-all duration-300">
                  <div className="text-orange-500 mb-4 flex justify-center">
                    {advantage.icon}
                  </div>
                  <h3 className="text-xl font-bold text-foreground mb-3 text-center">{advantage.title}</h3>
                  <p className="text-muted-foreground leading-relaxed mb-4 text-center">{advantage.description}</p>
                  <div className="text-center">
                    <Badge className="bg-orange-100 text-orange-700 font-semibold">
                      {advantage.impact}
                    </Badge>
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Visual Examples */}
      <section className="py-20 bg-gradient-to-br from-indigo-50 to-indigo-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-indigo-500 text-white font-semibold px-4 py-2">
                <Camera className="w-4 h-4 mr-2" />
                Platform Examples
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Analytics Platform <span className="text-indigo-600">In Action</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                See how our Analytics-as-a-Service platform transforms raw data into actionable insights 
                for financial institutions and lenders.
              </p>
            </div>

            <div className="grid lg:grid-cols-2 gap-12">
              <div className="space-y-8">
                <div className="bg-white rounded-2xl p-6 border-2 border-indigo-200">
                  <img
                    src={dataAnalyticsImage}
                    alt="Data analytics dashboard"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <h3 className="text-xl font-bold text-foreground mb-2">Data Analytics Dashboard</h3>
                  <p className="text-muted-foreground mb-4">
                    Comprehensive analytics dashboard providing real-time insights into credit data, 
                    borrower behavior, and market trends for informed decision-making.
                  </p>
                  <div className="flex flex-wrap gap-2">
                    <Badge className="bg-indigo-100 text-indigo-700">Real-time Analytics</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Interactive Dashboards</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Custom Reports</Badge>
                  </div>
                </div>

                <div className="bg-white rounded-2xl p-6 border-2 border-indigo-200">
                  <img
                    src={smallBusinessImage}
                    alt="SME analytics and insights"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <h3 className="text-xl font-bold text-foreground mb-2">SME Analytics</h3>
                  <p className="text-muted-foreground mb-4">
                    Specialized analytics for small and medium enterprises, providing insights into 
                    business performance, credit behavior, and growth opportunities.
                  </p>
                  <div className="flex flex-wrap gap-2">
                    <Badge className="bg-indigo-100 text-indigo-700">SME Focus</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Growth Insights</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Risk Assessment</Badge>
                  </div>
                </div>
              </div>

              <div className="space-y-8">
                <div className="bg-white rounded-2xl p-6 border-2 border-indigo-200">
                  <img
                    src={apiImage}
                    alt="API integration and connectivity"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <h3 className="text-xl font-bold text-foreground mb-2">API Integration</h3>
                  <p className="text-muted-foreground mb-4">
                    Seamless API integration enabling financial institutions to access analytics 
                    data and insights through their existing systems and workflows.
                  </p>
                  <div className="flex flex-wrap gap-2">
                    <Badge className="bg-indigo-100 text-indigo-700">Easy Integration</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Secure Access</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Real-time Data</Badge>
                  </div>
                </div>

                <div className="bg-white rounded-2xl p-6 border-2 border-indigo-200">
                  <div className="w-full h-48 bg-gradient-to-br from-indigo-100 to-indigo-200 rounded-xl mb-4 flex items-center justify-center">
                    <div className="text-center">
                      <BarChart3 className="w-16 h-16 text-indigo-500 mx-auto mb-3" />
                      <span className="text-indigo-700 font-medium">Analytics Engine</span>
                    </div>
                  </div>
                  <h3 className="text-xl font-bold text-foreground mb-2">Analytics Engine</h3>
                  <p className="text-muted-foreground mb-4">
                    Powerful analytics engine that processes raw unstructured creditor data 
                    and transforms it into valuable insights without requiring expensive infrastructure.
                  </p>
                  <div className="flex flex-wrap gap-2">
                    <Badge className="bg-indigo-100 text-indigo-700">Data Processing</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Insight Generation</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Cost Effective</Badge>
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
              Ready to Transform Your <span className="text-accent">Data into Insights?</span>
            </h2>
            <p className="text-xl text-white/90 leading-relaxed mb-8">
              Join our Analytics-as-a-Service platform and unlock the power of comprehensive credit data analysis. 
              Get 360° borrower views, thought leadership data, and plug-and-play analytics without expensive infrastructure.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <BarChart3 className="w-5 h-5 mr-2" />
                Start Analytics
              </Button>
              <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                <FileText className="w-5 h-5 mr-2" />
                Download Guide
              </Button>
            </div>
          </div>
        </div>
      </section>
      
      <Footer />
    </div>
  );
}
