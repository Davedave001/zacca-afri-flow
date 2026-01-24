import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { 
  Coins, 
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
  ShieldCheck,
  Package,
  Truck,
  Wrench,
  Monitor,
  Smartphone as Phone,
  Car,
  ShoppingCart,
  FileCheck,
  QrCode,
  Tag,
  Camera,
  Video,
  Clipboard,
  Wallet,
  Banknote,
  Percent,
  Scale,
  Gavel,
  BookOpen,
  MapPin,
  Calendar,
  CheckSquare,
  XCircle,
  AlertOctagon,
  Info,
  ExternalLink,
  Download,
  Upload,
  RefreshCw,
  RotateCcw,
  Maximize,
  Minimize,
  Move,
  Copy,
  Edit,
  Trash2,
  Save,
  Send,
  Share2,
  Heart,
  ThumbsUp,
  ThumbsDown,
  MessageCircle,
  Bell,
  BellOff,
  Volume2,
  VolumeX,
  Play,
  Pause,
  SkipBack,
  SkipForward,
  Repeat,
  Shuffle,
  Volume1,
  Mic,
  MicOff,
  Headphones,
  Speaker,
  Radio,
  Tv,
  Laptop,
  Tablet,
  Watch,
  Gamepad2,
  Mouse,
  Keyboard,
  Printer,
  Scanner,
  HardDrive,
  Cpu,
  MemoryStick,
  Wifi,
  Bluetooth,
  Battery,
  BatteryLow,
  Plug,
  Power,
  PowerOff,
  Zap as Lightning,
  Sun,
  Moon,
  Cloud,
  CloudRain,
  CloudSnow,
  Wind,
  Thermometer,
  Droplets,
  Umbrella,
  TreePine,
  Leaf,
  Flower2,
  Bug,
  Fish,
  Bird,
  Cat,
  Dog,
  Rabbit,
  Turtle,
  Whale,
  Butterfly,
  Bee,
  Spider,
  Ant,
  Ladybug,
  Snail,
  Frog,
  Penguin,
  Owl,
  Eagle,
  Hawk,
  Dove,
  Crow,
  Parrot,
  Flamingo,
  Peacock,
  Swan,
  Duck,
  Chicken,
  Rooster,
  Turkey,
  Goose,
  Pigeon,
  Sparrow,
  Robin,
  Cardinal,
  Bluebird,
  Canary,
  Finch,
  Hummingbird,
  Woodpecker,
  Toucan,
  Pelican,
  Seagull,
  Albatross,
  Falcon,
  Vulture,
  Condor,
  Ostrich,
  Emu,
  Kiwi,
  Cassowary,
  Rhea,
  Secretary,
  Crane,
  Heron,
  Stork,
  Ibis,
  Spoonbill,
  Flamingo as FlamingoIcon,
  Pelican as PelicanIcon,
  Seagull as SeagullIcon,
  Albatross as AlbatrossIcon,
  Falcon as FalconIcon,
  Vulture as VultureIcon,
  Condor as CondorIcon,
  Ostrich as OstrichIcon,
  Emu as EmuIcon,
  Kiwi as KiwiIcon,
  Cassowary as CassowaryIcon,
  Rhea as RheaIcon,
  Secretary as SecretaryIcon,
  Crane as CraneIcon,
  Heron as HeronIcon,
  Stork as StorkIcon,
  Ibis as IbisIcon,
  Spoonbill as SpoonbillIcon
} from "lucide-react";
import tokenizationImage from "@/assets/Tokenization.png";
import motorbikeCollateralImage from "@/assets/Motobike Collateral.png";
import smartConsentImage from "@/assets/SMART CONSENT.png";
import iotTrackingImage from "@/assets/IoT tracking.png";
import smallBusinessImage from "@/assets/AFRICAN SMALL BUSINESS.png";

export default function TokenizedCollateral() {
  const tokenizationCriteria = [
    {
      icon: <FileCheck className="w-8 h-8 text-primary" />,
      title: "Proof of Ownership",
      description: "Receipt, M-Pesa confirmation, WhatsApp/Email proof of purchase, warranty card, or seller statement tied to token metadata.",
      examples: ["Purchase receipts", "M-Pesa transaction codes", "WhatsApp conversations", "Email confirmations", "Warranty cards"]
    },
    {
      icon: <DollarSign className="w-8 h-8 text-primary" />,
      title: "Verifiable Market Value",
      description: "Market price lookup from trusted resale platforms recorded as a value band (min–max resale).",
      examples: ["Jiji marketplace", "OLX platform", "PigiaMe listings", "Manufacturer catalogs", "Market price APIs"]
    },
    {
      icon: <Camera className="w-8 h-8 text-primary" />,
      title: "Condition & Usability",
      description: "Multiple images, video walkthroughs, or inspection by agent/partner added as 'condition grade' tags.",
      examples: ["360° photos", "Video demonstrations", "Agent inspections", "Condition grading", "Usability tests"]
    },
    {
      icon: <Fingerprint className="w-8 h-8 text-primary" />,
      title: "Uniqueness / Identifiability",
      description: "Tamper-proof token metadata with hash of ownership proof, verified value range, unique token ID, and owner pseudonymized ID.",
      examples: ["Serial numbers", "IMEI codes", "Chassis numbers", "Frame numbers", "QR/asset tags"]
    },
    {
      icon: <ShieldCheck className="w-8 h-8 text-primary" />,
      title: "Recoverability",
      description: "Signed consent for repossession if default occurs. LTV limits (50-70%) based on asset risk and liquidity.",
      examples: ["Repossession agreements", "LTV calculations", "Risk assessments", "Recovery procedures", "DAO-approved rules"]
    }
  ];

  const tokenizableAssets = [
    {
      category: "Physical Assets",
      icon: <Truck className="w-12 h-12 text-blue-500" />,
      assets: [
        {
          name: "Motorbikes / Boda bodas",
          liquidity: "Highly liquid",
          description: "Primary transportation assets with high resale value and demand"
        },
        {
          name: "Freezers & Fridges",
          liquidity: "Medium liquid",
          description: "Essential business equipment for food storage and preservation"
        },
        {
          name: "Sewing Machines",
          liquidity: "Medium liquid",
          description: "Textile and garment manufacturing equipment"
        },
        {
          name: "Irrigation Pumps",
          liquidity: "Medium liquid",
          description: "Agricultural equipment for water management"
        },
        {
          name: "Solar Kits",
          liquidity: "High liquid",
          description: "Renewable energy systems with growing market demand"
        }
      ]
    },
    {
      category: "Digital & Semi-Digital Assets",
      icon: <Smartphone className="w-12 h-12 text-green-500" />,
      assets: [
        {
          name: "Verified Receivables",
          liquidity: "High liquid",
          description: "Purchase orders, invoices, and confirmed business transactions"
        },
        {
          name: "Zacca Wallet Float",
          liquidity: "Very high liquid",
          description: "Digital wallet balances and transaction history"
        },
        {
          name: "Digital Licenses",
          liquidity: "Medium liquid",
          description: "Ride-hailing accounts, delivery app IDs, and digital permits"
        }
      ]
    },
    {
      category: "Inventory & Stock",
      icon: <Package className="w-12 h-12 text-purple-500" />,
      assets: [
        {
          name: "Non-perishable Goods",
          liquidity: "Medium liquid",
          description: "Spare parts, electronics, packaged food with longer shelf life"
        },
        {
          name: "Perishables",
          liquidity: "Low liquid",
          description: "Milk, vegetables, fish requiring immediate turnover"
        }
      ]
    }
  ];

  const strengtheningMechanisms = [
    {
      icon: <Tag className="w-8 h-8 text-orange-500" />,
      title: "Asset Tagging Partnership",
      description: "Partner with asset taggers (GS1 barcodes or QR stickers) for enhanced tracking and verification.",
      benefits: ["Unique identification", "Tamper-proof metadata", "Easy verification", "Standardized tracking"]
    },
    {
      icon: <Shield className="w-8 h-8 text-orange-500" />,
      title: "Micro-Insurance Integration",
      description: "Micro-insurers underwrite high-value items (motorbikes, machines) with insurance policy ID in token metadata.",
      benefits: ["Risk mitigation", "Asset protection", "Recovery assurance", "Lower default impact"]
    },
    {
      icon: <TrendingUp className="w-8 h-8 text-orange-500" />,
      title: "Gradual Collateralization",
      description: "Allow SMEs to start small (receivables, stock), graduate to larger assets as trust builds.",
      benefits: ["Risk management", "Trust building", "Scalable approach", "Lower barriers to entry"]
    }
  ];

  const ecosystemBenefits = [
    {
      icon: <Coins className="w-8 h-8 text-primary" />,
      title: "Tokenized CDOs",
      description: "Outstanding loan portfolio tokenization as collateralized debt obligations for enhanced liquidity."
    },
    {
      icon: <Globe className="w-8 h-8 text-primary" />,
      title: "International & Local Uptake",
      description: "6 million active crypto users in Kenya (10% of population) with $18.6 billion in cryptocurrency transactions (2022)."
    },
    {
      icon: <Building2 className="w-8 h-8 text-primary" />,
      title: "MSME Focus",
      description: "Initial focus on bringing liquidity to MSMEs space guided by current legislation including Movable Property Security Rights."
    },
    {
      icon: <Brain className="w-8 h-8 text-primary" />,
      title: "360° Ecosystem",
      description: "Zacca.ai comprehensive ecosystem enabling further innovation in asset tokenization and collateral management."
    }
  ];

  const riskSafeguards = [
    {
      risk: "Tokens may not be legally enforceable",
      safeguard: "Register assets in Movable Property Security Rights (MPSR) Act registry",
      value: "Tokens = legally recognized collateral, just like land titles or logbooks"
    },
    {
      risk: "Fake or duplicate assets",
      safeguard: "Multi-layer verification: receipts, M-Pesa codes, seller confirmations, AI image checks, serial numbers",
      value: "Prevents fraud + lenders only fund real, verifiable assets"
    },
    {
      risk: "Default with no recovery path",
      safeguard: "Recovery options: repossession agents, token auctions, resale via partners, insurance for high-value items",
      value: "Increases chances of recovering value, lowers loss ratios"
    },
    {
      risk: "Over-reliance on one asset type",
      safeguard: "SMEs can also tokenize receivables, stock, mobile money floats",
      value: "Diversifies risk; collateral pool isn't tied to one asset"
    },
    {
      risk: "Lender trust in process",
      safeguard: "DAO-based governance for fair recovery rules",
      value: "Shared enforcement builds trust among lenders & reduces disputes"
    }
  ];

  const statistics = [
    {
      value: "6M",
      label: "Active Crypto Users",
      description: "In Kenya (10% of population)"
    },
    {
      value: "$18.6B",
      label: "Cryptocurrency Transactions",
      description: "Valued in 2022"
    },
    {
      value: "50-70%",
      label: "LTV Limits",
      description: "Based on asset risk and liquidity"
    },
    {
      value: "100%",
      label: "Verification",
      description: "Multi-layer asset verification"
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
                  <Coins className="w-4 h-4 mr-2" />
                  Asset Tokenization
                </Badge>
                <h1 className="text-5xl font-bold text-white mb-6 leading-tight">
                  Tokenized Collateral
                </h1>
                <p className="text-xl text-white/90 leading-relaxed mb-8">
                  Transform your business assets into digital collateral through our comprehensive tokenization platform. 
                  From physical equipment to digital receivables, unlock liquidity while maintaining security and compliance.
                </p>
                <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
                  <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                    <Coins className="w-5 h-5 mr-2" />
                    Tokenize Assets
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
                    src={tokenizationImage}
                    alt="Tokenized Collateral platform"
                    className="w-full h-64 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                      e.currentTarget.parentElement.innerHTML = `
                        <div class="w-full h-64 bg-gradient-to-br from-white/20 via-white/10 to-white/20 rounded-xl flex items-center justify-center">
                          <div class="text-center">
                            <div class="w-16 h-16 bg-gradient-to-br from-accent to-white rounded-full mx-auto mb-3 flex items-center justify-center">
                              <span class="text-primary text-2xl font-bold">TC</span>
                            </div>
                            <span class="text-white text-sm font-medium">Tokenized Collateral</span>
                          </div>
                        </div>
                      `;
                    }}
                  />
                  <div className="text-center">
                    <h4 className="text-lg font-bold text-white mb-2">Digital Asset Platform</h4>
                    <p className="text-white/80 text-sm">
                      Secure, verifiable, and liquid collateral through blockchain technology.
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
                <BarChart3 className="w-4 h-4 mr-2" />
                Market Overview
              </Badge>
              <h2 className="text-3xl font-bold text-foreground mb-4">
                Kenya's <span className="text-blue-600">Digital Asset</span> Landscape
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

      {/* Ecosystem Benefits */}
      <section className="py-20 bg-gradient-to-br from-green-50 to-green-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-green-500 text-white font-semibold px-4 py-2">
                <Lightbulb className="w-4 h-4 mr-2" />
                Ecosystem Benefits
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Zacca.ai <span className="text-green-600">360° Ecosystem</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Our comprehensive ecosystem enables innovative asset tokenization and collateral management, 
                bringing liquidity to MSMEs through advanced blockchain technology.
              </p>
            </div>

            <div className="grid md:grid-cols-2 gap-8">
              {ecosystemBenefits.map((benefit, index) => (
                <Card key={index} className="p-6 border-2 border-green-200 hover:border-green-300 transition-all duration-300">
                  <div className="text-green-500 mb-4 flex justify-center">
                    {benefit.icon}
                  </div>
                  <h3 className="text-xl font-bold text-foreground mb-3">{benefit.title}</h3>
                  <p className="text-muted-foreground leading-relaxed">{benefit.description}</p>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Tokenization Criteria */}
      <section className="py-20 bg-gradient-to-br from-primary/5 to-primary/10">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-primary text-white font-semibold px-4 py-2">
                <Star className="w-4 h-4 mr-2" />
                Tokenization Criteria
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Comprehensive <span className="text-primary">Asset Verification</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Our five-pillar approach ensures every tokenized asset meets the highest standards 
                of verification, security, and recoverability.
              </p>
            </div>

            <div className="space-y-8">
              {tokenizationCriteria.map((criteria, index) => (
                <Card key={index} className="p-8 border-2 border-primary/20 hover:border-primary/40 transition-all duration-300">
                  <div className="grid lg:grid-cols-3 gap-8 items-start">
                    <div className="text-center lg:text-left">
                      <div className="text-primary mb-4 flex justify-center lg:justify-start">
                        {criteria.icon}
                      </div>
                      <h3 className="text-2xl font-bold text-foreground mb-3">{criteria.title}</h3>
                      <p className="text-muted-foreground leading-relaxed">{criteria.description}</p>
                    </div>
                    <div className="lg:col-span-2">
                      <h4 className="text-lg font-semibold text-foreground mb-3">Examples:</h4>
                      <div className="grid md:grid-cols-2 gap-3">
                        {criteria.examples.map((example, exampleIndex) => (
                          <div key={exampleIndex} className="flex items-center gap-2">
                            <CheckCircle className="w-4 h-4 text-green-500 flex-shrink-0" />
                            <span className="text-sm text-muted-foreground">{example}</span>
                          </div>
                        ))}
                      </div>
                    </div>
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Tokenizable Assets */}
      <section className="py-20 bg-gradient-to-br from-purple-50 to-purple-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-purple-500 text-white font-semibold px-4 py-2">
                <Package className="w-4 h-4 mr-2" />
                Asset Categories
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Examples of <span className="text-purple-600">Tokenizable Assets</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                From physical equipment to digital receivables, our platform supports a wide range 
                of assets suitable for tokenization and collateral management.
              </p>
            </div>

            <div className="space-y-12">
              {tokenizableAssets.map((category, index) => (
                <Card key={index} className="p-8 border-2 border-purple-200 hover:border-purple-300 transition-all duration-300">
                  <div className="text-center mb-8">
                    <div className="text-purple-500 mb-4 flex justify-center">
                      {category.icon}
                    </div>
                    <h3 className="text-3xl font-bold text-foreground mb-2">{category.category}</h3>
                  </div>
                  
                  <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {category.assets.map((asset, assetIndex) => (
                      <div key={assetIndex} className="p-4 bg-white rounded-lg border border-purple-100 hover:border-purple-200 transition-all duration-300">
                        <div className="flex items-center justify-between mb-2">
                          <h4 className="font-semibold text-foreground">{asset.name}</h4>
                          <Badge className="bg-purple-100 text-purple-700 text-xs">
                            {asset.liquidity}
                          </Badge>
                        </div>
                        <p className="text-sm text-muted-foreground">{asset.description}</p>
                      </div>
                    ))}
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Risk Safeguards */}
      <section className="py-20 bg-gradient-to-br from-red-50 to-red-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-red-500 text-white font-semibold px-4 py-2">
                <Shield className="w-4 h-4 mr-2" />
                Risk Management
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Derisking the <span className="text-red-600">Zacca Token</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Comprehensive safeguards and investor value propositions ensuring secure, 
                legally enforceable, and fraud-resistant tokenized collateral.
              </p>
            </div>

            <div className="space-y-6">
              {riskSafeguards.map((item, index) => (
                <Card key={index} className="p-6 border-2 border-red-200 hover:border-red-300 transition-all duration-300">
                  <div className="grid lg:grid-cols-3 gap-6">
                    <div className="lg:col-span-1">
                      <div className="flex items-center gap-2 mb-3">
                        <AlertTriangle className="w-5 h-5 text-red-500" />
                        <h4 className="font-semibold text-foreground">Risk Concern</h4>
                      </div>
                      <p className="text-sm text-muted-foreground">{item.risk}</p>
                    </div>
                    
                    <div className="lg:col-span-1">
                      <div className="flex items-center gap-2 mb-3">
                        <ShieldCheck className="w-5 h-5 text-green-500" />
                        <h4 className="font-semibold text-foreground">Zakayas Safeguard</h4>
                      </div>
                      <p className="text-sm text-muted-foreground">{item.safeguard}</p>
                    </div>
                    
                    <div className="lg:col-span-1">
                      <div className="flex items-center gap-2 mb-3">
                        <Award className="w-5 h-5 text-blue-500" />
                        <h4 className="font-semibold text-foreground">Investor Value Proposition</h4>
                      </div>
                      <p className="text-sm text-muted-foreground">{item.value}</p>
                    </div>
                  </div>
                </Card>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Strengthening Mechanisms */}
      <section className="py-20 bg-gradient-to-br from-orange-50 to-orange-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-orange-500 text-white font-semibold px-4 py-2">
                <Settings className="w-4 h-4 mr-2" />
                Strengthening Mechanisms
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Mechanisms to <span className="text-orange-600">Strengthen Collateral Framework</span>
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                Advanced partnerships and gradual implementation strategies to build robust, 
                scalable, and trustworthy collateral management systems.
              </p>
            </div>

            <div className="grid md:grid-cols-3 gap-8">
              {strengtheningMechanisms.map((mechanism, index) => (
                <Card key={index} className="p-6 text-center border-2 border-orange-200 hover:border-orange-300 transition-all duration-300">
                  <div className="text-orange-500 mb-6 flex justify-center">
                    {mechanism.icon}
                  </div>
                  <h3 className="text-xl font-bold text-foreground mb-4">{mechanism.title}</h3>
                  <p className="text-muted-foreground leading-relaxed mb-4">{mechanism.description}</p>
                  <div className="space-y-2">
                    {mechanism.benefits.map((benefit, benefitIndex) => (
                      <div key={benefitIndex} className="flex items-center gap-2">
                        <CheckCircle className="w-4 h-4 text-orange-500 flex-shrink-0" />
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

      {/* Visual Examples */}
      <section className="py-20 bg-gradient-to-br from-indigo-50 to-indigo-100">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-indigo-500 text-white font-semibold px-4 py-2">
                <Camera className="w-4 h-4 mr-2" />
                Visual Examples
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                Real-World <span className="text-indigo-600">Tokenization</span> Examples
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
                See how different types of assets are tokenized and managed through our platform, 
                from motorbikes to digital receivables.
              </p>
            </div>

            <div className="grid lg:grid-cols-2 gap-12">
              <div className="space-y-8">
                <div className="bg-white rounded-2xl p-6 border-2 border-indigo-200">
                  <img
                    src={motorbikeCollateralImage}
                    alt="Motorbike collateral tokenization"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <h3 className="text-xl font-bold text-foreground mb-2">Motorbike Collateral</h3>
                  <p className="text-muted-foreground mb-4">
                    Highly liquid physical assets with comprehensive verification including serial numbers, 
                    condition assessment, and market value validation.
                  </p>
                  <div className="flex flex-wrap gap-2">
                    <Badge className="bg-indigo-100 text-indigo-700">High Liquidity</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Serial Verification</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Market Value</Badge>
                  </div>
                </div>

                <div className="bg-white rounded-2xl p-6 border-2 border-indigo-200">
                  <img
                    src={smartConsentImage}
                    alt="Smart consent for tokenization"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <h3 className="text-xl font-bold text-foreground mb-2">Smart Consent</h3>
                  <p className="text-muted-foreground mb-4">
                    Automated consent management with legal compliance, recovery procedures, 
                    and transparent terms for all tokenized assets.
                  </p>
                  <div className="flex flex-wrap gap-2">
                    <Badge className="bg-indigo-100 text-indigo-700">Legal Compliance</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Recovery Rights</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Transparent Terms</Badge>
                  </div>
                </div>
              </div>

              <div className="space-y-8">
                <div className="bg-white rounded-2xl p-6 border-2 border-indigo-200">
                  <img
                    src={iotTrackingImage}
                    alt="IoT tracking for tokenized assets"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <h3 className="text-xl font-bold text-foreground mb-2">IoT Tracking</h3>
                  <p className="text-muted-foreground mb-4">
                    Real-time asset monitoring and tracking through IoT devices, ensuring 
                    continuous verification and security of tokenized collateral.
                  </p>
                  <div className="flex flex-wrap gap-2">
                    <Badge className="bg-indigo-100 text-indigo-700">Real-time Tracking</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Security Monitoring</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Asset Verification</Badge>
                  </div>
                </div>

                <div className="bg-white rounded-2xl p-6 border-2 border-indigo-200">
                  <img
                    src={smallBusinessImage}
                    alt="Small business asset tokenization"
                    className="w-full h-48 object-cover rounded-xl mb-4"
                    onError={(e) => {
                      e.currentTarget.style.display = 'none';
                    }}
                  />
                  <h3 className="text-xl font-bold text-foreground mb-2">Small Business Assets</h3>
                  <p className="text-muted-foreground mb-4">
                    Comprehensive tokenization of MSME assets including equipment, inventory, 
                    receivables, and digital assets for enhanced liquidity.
                  </p>
                  <div className="flex flex-wrap gap-2">
                    <Badge className="bg-indigo-100 text-indigo-700">MSME Focus</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Diverse Assets</Badge>
                    <Badge className="bg-indigo-100 text-indigo-700">Liquidity Access</Badge>
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
              Ready to <span className="text-accent">Tokenize Your Assets?</span>
            </h2>
            <p className="text-xl text-white/90 leading-relaxed mb-8">
              Transform your business assets into liquid digital collateral. Join our platform and unlock 
              the power of blockchain-based asset tokenization with comprehensive security and compliance.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <Coins className="w-5 h-5 mr-2" />
                Start Tokenizing
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
