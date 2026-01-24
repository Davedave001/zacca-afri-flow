import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { 
  Building2, 
  Shield, 
  TrendingUp, 
  CheckCircle,
  Users,
  Globe,
  Star,
  Lightbulb,
  Brain,
  BarChart3,
  FileText,
  ShieldCheck,
  Target,
  Award,
  Heart,
  Eye,
  CreditCard,
  Database,
  Zap
} from "lucide-react";

export default function About() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-background to-primary/5">
      <Header />
      
      {/* Hero Section */}
      <section className="relative pt-32 pb-20 bg-gradient-to-br from-primary via-primary/90 to-primary/80 overflow-hidden">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto text-center">
            <Badge className="mb-6 bg-accent text-primary font-semibold px-4 py-2">
              <Heart className="w-4 h-4 mr-2" />
              About Zacca.ai
            </Badge>
            <h1 className="text-5xl font-bold text-white mb-6 leading-tight">
              Building Africa's Financial Operating System
            </h1>
            <p className="text-xl text-white/90 leading-relaxed mb-8 max-w-4xl mx-auto">
              Zacca.ai is building a new financial operating system for Africa. We use AI and blockchain to turn 
              everyday business activity — from WhatsApp chats to M-Pesa payments — into verified financial records 
              that unlock credit, liquidity, and growth.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <Eye className="w-5 h-5 mr-2" />
                Learn More
              </Button>
              <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                <FileText className="w-5 h-5 mr-2" />
                Our Vision
              </Button>
            </div>
          </div>
        </div>
      </section>

      {/* Vision Section */}
      <section className="py-20 bg-gradient-to-br from-primary/5 to-primary/10">
        <div className="container mx-auto px-6">
          <div className="max-w-6xl mx-auto">
            <div className="text-center mb-16">
              <Badge className="mb-4 bg-primary text-white font-semibold px-4 py-2">
                <Target className="w-4 h-4 mr-2" />
                Our Vision
              </Badge>
              <h2 className="text-4xl font-bold text-foreground mb-6">
                A Future Where <span className="text-primary">Africa's Hustle</span> Has the Credit It Deserves
              </h2>
              <p className="text-xl text-muted-foreground max-w-3xl mx-auto mb-8">
                Our vision is simple: a future where Africa's hustle has the credit it deserves. 
                We're building the financial infrastructure that recognizes and rewards the hard work, 
                innovation, and entrepreneurial spirit that defines Africa's business landscape.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Call to Action */}
      <section className="py-20 bg-gradient-to-br from-primary to-primary/80">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center">
            <h2 className="text-4xl font-bold text-white mb-6">
              Join Us in Building <span className="text-accent">Africa's Financial Future</span>
            </h2>
            <p className="text-xl text-white/90 leading-relaxed mb-8">
              Be part of the transformation. Whether you're an SME looking to grow, or a financial institution 
              seeking better insights, Zacca.ai is here to help you succeed in Africa's dynamic business landscape.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="bg-white text-primary hover:bg-white/90 px-8 py-4">
                <Users className="w-5 h-5 mr-2" />
                Join Our Mission
              </Button>
              <Button variant="outline" size="lg" className="border-white text-white hover:bg-white hover:text-primary px-8 py-4">
                <FileText className="w-5 h-5 mr-2" />
                Learn More
              </Button>
            </div>
          </div>
        </div>
      </section>
      
      <Footer />
    </div>
  );
}
