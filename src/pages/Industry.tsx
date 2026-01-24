import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { 
  Building2, 
  PiggyBank, 
  Smartphone, 
  Zap, 
  Shield, 
  TrendingUp, 
  CheckCircle,
  AlertTriangle,
  Users,
  Globe,
  Star,
  Lightbulb,
  Brain,
  Activity,
  Network,
  BarChart3,
  FileText,
  ShieldCheck
} from "lucide-react";

export default function Industry() {
  const industrySectors = [
    {
      icon: <Building2 className="w-12 h-12 text-blue-500" />,
      title: "Banks",
      color: "blue",
      problem: "Traditional banks struggle to extend credit to MSMEs because most lack audited financial statements, reliable credit histories, or collateral.",
      solutions: [
        {
          title: "Dynamic Credit Scoring",
          description: "Provides verified business records from MSMEs' daily transactions (e.g., M-Pesa, WhatsApp)."
        },
        {
          title: "CBK Compliance",
          description: "Enables banks to comply with CBK's revised Risk-Based Credit Pricing (RBCPM) by using AI-powered, real-time borrower insights."
        },
        {
          title: "Risk Reduction",
          description: "Reduces risk of defaults through LiquiChain DAO and automated debt deductions."
        }
      ]
    },
    {
      icon: <PiggyBank className="w-12 h-12 text-green-500" />,
      title: "Microfinance Institutions (MFIs)",
      color: "green",
      problem: "Many borrowers rely on informal savings groups (e.g., chamas) that aren't recognized in formal credit systems, especially in rural areas and among women-led businesses.",
      solutions: [
        {
          title: "Informal Activity Recognition",
          description: "Converts informal business activity into recognized financial records."
        },
        {
          title: "Inclusive Profiles",
          description: "Provides MFIs with access to borrower profiles that are more inclusive and gender-sensitive."
        },
        {
          title: "Scalable Growth",
          description: "Helps MFIs scale sustainably by connecting them to the Zacca DAO marketplace for shared borrower insights and liquidity."
        }
      ]
    },
    {
      icon: <Smartphone className="w-12 h-12 text-purple-500" />,
      title: "Digital Lenders",
      color: "purple",
      problem: "Borrower defaults are high (40–50% in unsecured loans). Borrowers easily bypass blacklists by acquiring new SIM cards. Regulators are cracking down on predatory lending and debt-shaming.",
      solutions: [
        {
          title: "Unified Identification",
          description: "Assigns borrowers a Unified Identification Number (UIN) hashed on blockchain — consistent across mobile numbers."
        },
        {
          title: "Real-time Verification",
          description: "Offers real-time credit risk verification, preventing serial defaulters from hopping lenders."
        },
        {
          title: "Automated Recovery",
          description: "Automates loan recovery through consent-driven deductions, reducing reliance on debt collectors."
        }
      ]
    },
    {
      icon: <Zap className="w-12 h-12 text-orange-500" />,
      title: "Fintech Companies",
      color: "orange",
      problem: "Many local fintechs lack the data infrastructure and AI capacity to innovate like Silicon Valley-backed players.",
      solutions: [
        {
          title: "Analytics-as-a-Service",
          description: "Offers Analytics-as-a-Service (AaaS) and APIs, giving fintechs access to structured SME and consumer credit data."
        },
        {
          title: "Plug-and-Play Tools",
          description: "Provides plug-and-play credit scoring and verification tools without requiring them to build heavy infrastructure."
        },
        {
          title: "AI Integration",
          description: "Supports fintechs in embedding AI-driven wallets, financial coaching, and tokenization into their services."
        }
      ]
    },
    {
      icon: <Shield className="w-12 h-12 text-red-500" />,
      title: "Insurers",
      color: "red",
      problem: "Limited visibility into borrower/SME financial health → difficult to design fair, affordable insurance products.",
      solutions: [
        {
          title: "360° Debtor Profiles",
          description: "Provides 360° debtor profiles and AI-generated business health insights."
        },
        {
          title: "Asset Tokenization",
          description: "Uses tokenization of assets (like motorbikes, farm equipment, receivables) to underwrite new types of micro-insurance products."
        },
        {
          title: "Marketplace Integration",
          description: "Helps insurers embed their services directly into the Zacca marketplace, reaching SMEs at the point of need."
        }
      ]
    }
  ];

  const keyStatistics = [
    {
      value: "40-50%",
      label: "Default Rate",
      description: "In unsecured digital loans"
    },
    {
      value: "360°",
      label: "Borrower View",
      description: "Comprehensive financial profiles"
    },
    {
      value: "Real-time",
      label: "Risk Assessment",
      description: "AI-powered insights"
    },
    {
      value: "UIN",
      label: "Unified ID",
      description: "Blockchain-hashed identification"
    }
  ];

  const ecosystemBenefits = [
    {
      icon: <Network className="w-8 h-8 text-primary" />,
      title: "Financial Operating System",
      description: "Zacca.ai is building a comprehensive financial operating system for Africa, providing tools for smarter, fairer, and more inclusive financial decisions."
    },
    {
      icon: <ShieldCheck className="w-8 h-8 text-primary" />,
      title: "Data Sovereignty",
      description: "Gives SMEs sovereignty over their business data while enabling financial institutions to make better decisions."
    },
    {
      icon: <TrendingUp className="w-8 h-8 text-primary" />,
      title: "Inclusive Growth",
      description: "Enables financial inclusion by recognizing informal business activities and providing access to formal financial services."
    },
    {
      icon: <Brain className="w-8 h-8 text-primary" />,
      title: "AI-Powered Insights",
      description: "Provides AI-driven analytics and insights that level the playing field for local financial institutions."
    }
  ];

  const getColorClasses = (color: string) => {
    const colorMap = {
      blue: {
        bg: "from-blue-50 to-blue-100",
        border: "border-blue-200",
        hoverBorder: "hover:border-blue-300",
        badge: "bg-blue-500",
        iconBg: "bg-blue-100",
        iconText: "text-blue-700"
      },
      green: {
        bg: "from-green-50 to-green-100",
        border: "border-green-200",
        hoverBorder: "hover:border-green-300",
        badge: "bg-green-500",
        iconBg: "bg-green-100",
        iconText: "text-green-700"
      },
      purple: {
        bg: "from-purple-50 to-purple-100",
        border: "border-purple-200",
        hoverBorder: "hover:border-purple-300",
        badge: "bg-purple-500",
        iconBg: "bg-purple-100",
        iconText: "text-purple-700"
      },
      orange: {
        bg: "from-orange-50 to-orange-100",
        border: "border-orange-200",
        hoverBorder: "hover:border-orange-300",
        badge: "bg-orange-500",
        iconBg: "bg-orange-100",
        iconText: "text-orange-700"
      },
      red: {
        bg: "from-red-50 to-red-100",
        border: "border-red-200",
        hoverBorder: "hover:border-red-300",
        badge: "bg-red-500",
        iconBg: "bg-red-100",
        iconText: "text-red-700"
      }
    };
    return colorMap[color as keyof typeof colorMap] || colorMap.blue;
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-background to-primary/5">
      <Header />
      
      {/* Hero Section */}
      <section className="relative pt-32 pb-20 bg-gradient-to-br from-primary via-primary/90 to-primary/80 overflow-hidden">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto text-center">
            <Badge className="mb-6 bg-accent text-primary font-semibold px-4 py-2">
              <Globe className="w-4 h-4 mr-2" />
              Industry Solutions
            </Badge>
            <h1 className="text-5xl font-bold text-white mb-6 leading-tight">
              Transforming Financial Services
            </h1>
            <p className="text-xl text-white/90 leading-relaxed mb-8 max-w-4xl mx-auto">
              Zacca.ai is building a financial operating system for Africa — giving banks, MFIs, digital lenders, 
              fintechs, and insurers the tools to make smarter, fairer, and more inclusive financial decisions, 
              while giving SMEs sovereignty over their business data.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <Building2 className="w-5 h-5 mr-2" />
                Explore Solutions
              </Button>
              <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                <FileText className="w-5 h-5 mr-2" />
                Learn More
              </Button>
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
                <BarChart3 className="w-4 h-4 mr-2" />
                Industry Overview
              </Badge>
              <h2 className="text-3xl font-bold text-foreground mb-4">
                Financial Services <span className="text-blue-600">Transformation</span>
              </h2>
            </div>

            <div className="grid md:grid-cols-4 gap-8">
              {keyStatistics.map((stat, index) => (
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

      {/* Industry Sectors */}
      <section className="py-20 bg-gradient-to-br from-gray-50 to-gray-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-primary text-white font-semibold px-4 py-2">
                <Users className="w-4 h-4 mr-2" />
                Industry Sectors
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Serving <span className="text-primary">Financial Institutions</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Our comprehensive platform addresses the unique challenges faced by different sectors 
                of the financial services industry across Africa.
              </p>
            </div>

            <div className="space-y-12">
              {industrySectors.map((sector, index) => {
                const colors = getColorClasses(sector.color);
                return (
                  <Card key={index} className={`p-8 border-2 ${colors.border} ${colors.hoverBorder} transition-all duration-300 bg-gradient-to-br ${colors.bg}`}>
                    <div className="grid lg:grid-cols-3 gap-8">
                      {/* Sector Header */}
                      <div className="lg:col-span-1">
                        <div className="text-center lg:text-left">
                          <div className="text-primary mb-4 flex justify-center lg:justify-start">
                            {sector.icon}
                          </div>
                          <h3 className="text-3xl font-bold text-foreground mb-4">{sector.title}</h3>
                          <Badge className={`${colors.badge} text-white font-semibold px-4 py-2`}>
                            Financial Institution
                          </Badge>
                        </div>
                      </div>

                      {/* Problem Statement */}
                      <div className="lg:col-span-2">
                        <div className="mb-6">
                          <div className="flex items-center gap-2 mb-3">
                            <AlertTriangle className="w-5 h-5 text-red-500" />
                            <h4 className="text-lg font-semibold text-foreground">Problem They Face</h4>
                          </div>
                          <p className="text-muted-foreground leading-relaxed">{sector.problem}</p>
                        </div>

                        {/* Solutions */}
                        <div>
                          <div className="flex items-center gap-2 mb-4">
                            <Lightbulb className="w-5 h-5 text-green-500" />
                            <h4 className="text-lg font-semibold text-foreground">How Zacca.ai Helps</h4>
                          </div>
                          <div className="space-y-4">
                            {sector.solutions.map((solution, solutionIndex) => (
                              <div key={solutionIndex} className="flex items-start gap-3">
                                <CheckCircle className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                                <div>
                                  <h5 className="font-semibold text-foreground mb-1">{solution.title}</h5>
                                  <p className="text-sm text-muted-foreground leading-relaxed">{solution.description}</p>
                                </div>
                              </div>
                            ))}
                          </div>
                        </div>
                      </div>
                    </div>
                  </Card>
                );
              })}
            </div>
          </div>
        </div>
      </section>

      {/* Ecosystem Benefits */}
      <section className="py-20 bg-gradient-to-br from-primary/5 to-primary/10">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-primary text-white font-semibold px-4 py-2">
                <Star className="w-4 h-4 mr-2" />
                Ecosystem Benefits
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Building Africa's <span className="text-primary">Financial Future</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Our comprehensive ecosystem provides the foundation for inclusive, innovative, 
                and sustainable financial services across Africa.
              </p>
            </div>

            <div className="grid md:grid-cols-2 gap-8">
              {ecosystemBenefits.map((benefit, index) => (
                <Card key={index} className="p-6 border-2 border-primary/20 hover:border-primary/40 transition-all duration-300">
                  <div className="text-primary mb-4 flex justify-center">
                    {benefit.icon}
                  </div>
                  <h3 className="text-xl font-bold text-foreground mb-3 text-center">{benefit.title}</h3>
                  <p className="text-muted-foreground leading-relaxed text-center">{benefit.description}</p>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Call to Action */}
      <section className="py-20 bg-gradient-to-br from-primary to-primary/80">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center">
            <h2 className="text-4xl font-bold text-white mb-6">
              Ready to Transform Your <span className="text-accent">Financial Services?</span>
            </h2>
            <p className="text-xl text-white/90 leading-relaxed mb-8">
              Join the Zacca.ai ecosystem and become part of Africa's financial operating system. 
              Access comprehensive tools for smarter, fairer, and more inclusive financial decisions.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <Building2 className="w-5 h-5 mr-2" />
                Join the Ecosystem
              </Button>
              <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                <FileText className="w-5 h-5 mr-2" />
                Download Overview
              </Button>
            </div>
          </div>
        </div>
      </section>
      
      <Footer />
    </div>
  );
}
