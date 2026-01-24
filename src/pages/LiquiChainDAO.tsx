import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { 
  Network, 
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
  Receipt,
  Link,
  Eye,
  Search,
  Filter,
  Settings,
  Activity,
  TrendingDown,
  AlertCircle,
  UserCheck,
  Fingerprint,
  Hash,
  Layers,
  GitBranch,
  ShieldCheck
} from "lucide-react";
import daoImage from "@/assets/DAO.png";
import daoImage2 from "@/assets/DAO (1).png";
import smallBusinessImage from "@/assets/AFRICAN SMALL BUSINESS.png";

export default function LiquiChainDAO() {
  const problems = [
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "High Nonperforming Loans",
      description: "40% nonperforming loans in micro lending vs 16.4% in commercial secured borrowing as of Dec 2024."
    },
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Easy Loan Access",
      description: "High delinquency attributed to ease of loan access and lack of regulatory framework to curb predatory lending."
    },
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Mobile Number Exploitation",
      description: "Borrowers default from lender 'x', get new mobile line, and approach lender 'y' with no visibility."
    },
    {
      icon: <AlertTriangle className="w-8 h-8 text-red-500" />,
      title: "Debt Collection Harassment",
      description: "Mobile debt collectors debt-shaming and harassing defaulters, leaving most depressed."
    }
  ];

  const solutionFeatures = [
    {
      icon: <Network className="w-8 h-8" />,
      title: "Interoperable Debt Repayment",
      description: "Facilitates seamless debt repayment across multiple lending companies through unified systems."
    },
    {
      icon: <BarChart3 className="w-8 h-8" />,
      title: "Risk Scoring & Data Exchange",
      description: "Advanced risk scoring algorithms and secure data exchange among participating lenders."
    },
    {
      icon: <Shield className="w-8 h-8" />,
      title: "Permissioned Blockchain Network",
      description: "Secured and trusted network functioning as a decentralized autonomous organization (DAO)."
    },
    {
      icon: <Fingerprint className="w-8 h-8" />,
      title: "Unique Identification Number (UIN)",
      description: "Blockchain-hashed UIN based on national ID, KRA-PIN, and mobile number for consistent identity."
    },
    {
      icon: <Eye className="w-8 h-8" />,
      title: "Unified Debtor Profile Engine",
      description: "360-degree view of borrowers across all participating lenders and platforms."
    },
    {
      icon: <Activity className="w-8 h-8" />,
      title: "Enhanced Collection System",
      description: "Automated loan recovery through Zacca.ai wallet integration and smart contract execution."
    }
  ];

  const daoBenefits = [
    {
      step: "1",
      title: "No Innovation Struggle",
      description: "You don't have to struggle to innovate yet you don't have the financial capacity. We've done the dirty work and now users enjoy using our AI-powered wallet."
    },
    {
      step: "2", 
      title: "API Integration",
      description: "All you need is our API (a bridging technology between us and your business), and Vuaala! All the creditor data in our ecosystem is available to you. Approve loans faster! Avoid defaulters hoping from one lender to another. Have a 360-degree view of your borrowers."
    },
    {
      step: "3",
      title: "Analytics-as-a-Service",
      description: "You are stranded with raw unstructured creditor data, our analytics-as-a-service engine will turn all this to invaluable insights without you having to own an expensive AI or blockchain infrastructure."
    },
    {
      step: "4",
      title: "DAO Marketplace",
      description: "Join a marketplace (DAO) where our AIs help you send personalized loan/insurance offers to potential borrowers, recover defaulted loans, and earn from our token (stocks on a blockchain marketplace)."
    },
    {
      step: "5",
      title: "Focus on High-Value Service",
      description: "We free you from the stress of AI, and you focus on high-value service delivery to your customers."
    }
  ];

  const statistics = [
    {
      value: "40%",
      label: "Nonperforming Loans",
      description: "In micro lending sector"
    },
    {
      value: "16.4%",
      label: "Commercial Loans",
      description: "Nonperforming rate for secured borrowing"
    },
    {
      value: "100%",
      label: "Visibility",
      description: "360-degree borrower view across lenders"
    },
    {
      value: "0%",
      label: "Harassment",
      description: "Eliminates debt collection harassment"
    }
  ];

  const technicalFeatures = [
    {
      icon: <GitBranch className="w-12 h-12 text-primary" />,
      title: "Decentralized Autonomous Organization",
      description: "Commercial banks clearing house without centralized authority, governed by participating lenders."
    },
    {
      icon: <Hash className="w-12 h-12 text-primary" />,
      title: "Blockchain-Hashed UIN",
      description: "Unique Identification Number based on national ID, KRA-PIN, and mobile number, constant across all mobile lines."
    },
    {
      icon: <Layers className="w-12 h-12 text-primary" />,
      title: "Unified Debtor Engine",
      description: "Comprehensive borrower profiles with dashboard analytics for all participating lenders."
    },
    {
      icon: <ShieldCheck className="w-12 h-12 text-primary" />,
      title: "Permissioned Blockchain",
      description: "Secured and trusted network ensuring data integrity and privacy for all participants."
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
                  <Network className="w-4 h-4 mr-2" />
                  Decentralized Autonomous Organization
                </Badge>
                <h1 className="text-5xl font-bold text-white mb-6 leading-tight">
                  LiquiChain DAO
                </h1>
                <p className="text-xl text-white/90 leading-relaxed mb-8">
                  A liquidity solution for lenders and consumers through enhanced collection of loan repayments, 
                  interoperable debt management, and unified debtor profiling across the lending ecosystem.
                </p>
                <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
                  <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                    <Network className="w-5 h-5 mr-2" />
                    Join the DAO
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
                    src={daoImage}
                    alt="LiquiChain DAO decentralized network"
                    className="w-full h-64 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                      e.currentTarget.parentElement.innerHTML = `
                        <div class="w-full h-64 bg-gradient-to-br from-white/20 via-white/10 to-white/20 rounded-xl flex items-center justify-center">
                          <div class="text-center">
                            <div class="w-16 h-16 bg-gradient-to-br from-accent to-white rounded-full mx-auto mb-3 flex items-center justify-center">
                              <span class="text-primary text-2xl font-bold">DAO</span>
                            </div>
                            <span class="text-white text-sm font-medium">LiquiChain Network</span>
                          </div>
                        </div>
                      `;
                    }}
                  />
                  <div className="text-center">
                    <h4 className="text-lg font-bold text-white mb-2">Decentralized Network</h4>
                    <p className="text-white/80 text-sm">
                      Secure, interoperable lending ecosystem powered by blockchain technology.
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
                The <span className="text-red-600">Crisis</span> in Micro Lending
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Nonperforming loans in the non-secured category among micro and macro lenders 
                is at alarming levels, creating systemic risks in the lending ecosystem.
              </p>
            </div>

            {/* Statistics */}
            <div className="grid md:grid-cols-4 gap-8 mb-16">
              {statistics.map((stat, index) => (
                <Card key={index} className="p-6 text-center border-2 border-red-200 bg-red-50">
                  <div className="text-5xl font-extrabold text-red-600 mb-2">{stat.value}</div>
                  <h3 className="text-lg font-semibold text-foreground mb-1">{stat.label}</h3>
                  <p className="text-sm text-muted-foreground">{stat.description}</p>
                </Card>
              ))}
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
                LiquiChain DAO: <span className="text-green-600">The Future of Lending</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto mb-8">
                A secured and trusted network functioning as a decentralized autonomous organization 
                with unified debtor profile engine and enhanced collection capabilities.
              </p>
            </div>

            <div className="grid lg:grid-cols-2 gap-12 items-center mb-16">
              <div className="space-y-6">
                <div className="flex items-start gap-4">
                  <Network className="w-8 h-8 text-green-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">Interoperable System</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Facilitates interoperable debt repayment, risk scoring, and data exchange 
                      among lending companies through unified protocols.
                    </p>
                  </div>
                </div>
                
                <div className="flex items-start gap-4">
                  <Shield className="w-8 h-8 text-green-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">Permissioned Blockchain</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      Secured and trusted network functioning as a decentralized autonomous organization 
                      (DAO) - a commercial banks clearing house without centralized authority.
                    </p>
                  </div>
                </div>

                <div className="flex items-start gap-4">
                  <Fingerprint className="w-8 h-8 text-green-500 mt-1 flex-shrink-0" />
                  <div>
                    <h3 className="text-2xl font-bold text-foreground mb-3">Unique Identification</h3>
                    <p className="text-muted-foreground leading-relaxed">
                      UIN based on national ID, KRA-PIN, and mobile number, hashed on blockchain. 
                      Constant irrespective of number of mobile lines an individual has.
                    </p>
                  </div>
                </div>
              </div>
              
              <div className="relative">
                <div className="bg-gradient-to-br from-green-50 to-green-100 rounded-3xl p-8 border-2 border-green-200 relative overflow-hidden">
                  <img
                    src={daoImage2}
                    alt="LiquiChain DAO technical architecture"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <div className="text-center">
                    <GitBranch className="w-12 h-12 text-green-500 mx-auto mb-3" />
                    <h4 className="text-lg font-bold text-foreground mb-2">DAO Architecture</h4>
                    <p className="text-muted-foreground text-sm">
                      Decentralized autonomous organization with unified debtor engine 
                      and comprehensive analytics dashboard.
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
                Core Features
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Comprehensive <span className="text-primary">Lending Solutions</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                LiquiChain DAO provides a complete suite of tools for interoperable debt management, 
                risk assessment, and enhanced collection capabilities.
              </p>
            </div>

            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
              {solutionFeatures.map((feature, index) => (
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

      {/* Technical Architecture */}
      <section className="py-20 bg-gradient-to-br from-blue-50 to-blue-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-blue-500 text-white font-semibold px-4 py-2">
                <Settings className="w-4 h-4 mr-2" />
                Technical Architecture
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Built on <span className="text-blue-600">Blockchain Technology</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Advanced technical infrastructure ensuring security, transparency, and interoperability 
                across the entire lending ecosystem.
              </p>
            </div>

            <div className="grid md:grid-cols-2 gap-8">
              {technicalFeatures.map((feature, index) => (
                <Card key={index} className="p-8 text-center border-2 border-blue-200 hover:border-blue-300 transition-all duration-300">
                  <div className="text-blue-500 mb-6 flex justify-center">
                    {feature.icon}
                  </div>
                  <h3 className="text-2xl font-bold text-foreground mb-4">{feature.title}</h3>
                  <p className="text-muted-foreground leading-relaxed">{feature.description}</p>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Benefits for Lenders */}
      <section className="py-20 bg-gradient-to-br from-purple-50 to-purple-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-purple-500 text-white font-semibold px-4 py-2">
                <Award className="w-4 h-4 mr-2" />
                Benefits for Lenders
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Why Join <span className="text-purple-600">LiquiChain DAO</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Transform your lending operations with our comprehensive DAO ecosystem 
                designed to solve critical industry challenges.
              </p>
            </div>

            <div className="space-y-8">
              {daoBenefits.map((benefit, index) => (
                <Card key={index} className="p-8 border-2 border-purple-200 hover:border-purple-300 transition-all duration-300">
                  <div className="grid lg:grid-cols-3 gap-8 items-center">
                    <div className="text-center lg:text-left">
                      <div className="text-4xl font-bold text-purple-600 mb-2">{benefit.step}</div>
                      <h4 className="text-2xl font-bold text-foreground mb-3">{benefit.title}</h4>
                    </div>
                    <div className="lg:col-span-2">
                      <p className="text-lg text-foreground leading-relaxed">{benefit.description}</p>
                    </div>
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Target Audience */}
      <section className="py-20 bg-gradient-to-br from-orange-50 to-orange-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              <div>
                <Badge className="mb-4 bg-orange-500 text-white font-semibold px-4 py-2">
                  <Users className="w-4 h-4 mr-2" />
                  Target Audience
                </Badge>
                <h2 className="text-4xl font-bold text-foreground mb-6">
                  Built for <span className="text-orange-600">Lending Companies</span>
                </h2>
                <p className="text-xl text-muted-foreground leading-relaxed mb-8">
                  Participating lenders will be members and governors of the DAO, 
                  gaining access to unified debtor profiles and enhanced collection capabilities.
                </p>
                <div className="space-y-4">
                  <div className="flex items-center gap-3">
                    <CheckCircle className="w-6 h-6 text-orange-500" />
                    <span className="text-foreground font-medium">360-degree borrower visibility</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="w-6 h-6 text-orange-500" />
                    <span className="text-foreground font-medium">Eliminate borrower hopping between lenders</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="w-6 h-6 text-orange-500" />
                    <span className="text-foreground font-medium">Automated loan recovery through Zacca.ai wallet</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle className="w-6 h-6 text-orange-500" />
                    <span className="text-foreground font-medium">Access to comprehensive analytics and insights</span>
                  </div>
                </div>
              </div>
              
              <div className="relative">
                <div className="bg-gradient-to-br from-orange-50 to-orange-100 rounded-3xl p-8 border-2 border-orange-200 relative overflow-hidden">
                  <img
                    src={smallBusinessImage}
                    alt="Lending companies using LiquiChain DAO"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <div className="text-center">
                    <Building2 className="w-12 h-12 text-orange-500 mx-auto mb-3" />
                    <h4 className="text-lg font-bold text-foreground mb-2">Lending Ecosystem</h4>
                    <p className="text-muted-foreground text-sm">
                      Comprehensive platform for lending companies to manage risk, 
                      enhance collections, and access unified borrower data.
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
              Ready to Transform Your <span className="text-accent">Lending Operations?</span>
            </h2>
            <p className="text-xl text-white/90 leading-relaxed mb-8">
              Join LiquiChain DAO and become part of the future of interoperable lending. 
              Access unified debtor profiles, enhance collections, and eliminate borrower fraud.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <Network className="w-5 h-5 mr-2" />
                Join the DAO
              </Button>
              <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                <FileText className="w-5 h-5 mr-2" />
                Download Whitepaper
              </Button>
            </div>
          </div>
        </div>
      </section>
      
      <Footer />
    </div>
  );
}

