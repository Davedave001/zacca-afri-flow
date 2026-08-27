import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { ArrowLeft, ArrowRight, Star, TrendingUp, Users, Heart, Quote } from "lucide-react";
import { useState } from "react";

export const ImpactStoriesSection = () => {
  const [currentStory, setCurrentStory] = useState(0);

  const stories = [
    {
      name: "Grace Wanjiku",
      business: "Mama Mboga - Eastleigh Market",
      image: "👩🏿‍💼",
      story: "Zacca saw my business before I even knew I had one. Through my WhatsApp orders and M-Pesa transactions, they gave me my first loan.",
      impact: "300% revenue growth",
      loan: "KSh 150,000",
      details: "Grace's daily WhatsApp vegetable orders and consistent M-Pesa transactions gave her lender the evidence to see her as creditworthy. Within days, she was approved to expand her stall and serve 3x more customers.",
      badge: "Real Impact",
      quote: "Now I can buy vegetables in bulk and my customers trust me more. My children are going to better schools."
    },
    {
      name: "Michael Ochieng",
      business: "Boda Boda Operator - Nakuru",
      image: "🏍️", 
      story: "I never thought my phone could help me get a loan. Zacca understood my business better than any bank ever did.",
      impact: "Doubled daily income",
      loan: "KSh 200,000",
      details: "Michael's ride-hailing app data and customer payment patterns showed consistent income. His lender saw the evidence and approved funding for a second motorbike, doubling his earning capacity.",
      badge: "Growth Story",
      quote: "With two bikes, I can now support my family and save for my children's future. Zacca believed in me when banks wouldn't."
    },
    {
      name: "Sarah Kiprotich",
      business: "Online Fashion Retailer - Nairobi",
      image: "👗",
      story: "From Instagram DMs to a real business loan - Zacca made my dreams possible.",
      impact: "5x inventory growth",
      loan: "KSh 500,000",
      details: "Sarah's Instagram sales records and customer testimonials were converted into verifiable business metrics her lender could review, unlocking significant working capital.",
      badge: "Digital Success",
      quote: "I went from selling clothes from my bedroom to having a proper inventory. My customers are happier and I'm building something real."
    },
    {
      name: "David Mwangi",
      business: "Hardware Store Owner - Eldoret",
      image: "🔧",
      story: "At 45, I thought I was too old for technology. Zacca showed me that my WhatsApp supplier chats were worth more than I knew.",
      impact: "40% profit increase", 
      loan: "KSh 800,000",
      details: "David's WhatsApp supplier communications and daily sales records gave his lender clear evidence of his established business relationships, and he was approved for inventory financing, leading to better supplier terms and increased profits.",
      badge: "Innovation",
      quote: "My suppliers now trust me more because they know I can pay upfront. Business is better than ever."
    }
  ];

  const nextStory = () => {
    setCurrentStory((prev) => (prev + 1) % stories.length);
  };

  const prevStory = () => {
    setCurrentStory((prev) => (prev - 1 + stories.length) % stories.length);
  };

  return (
    <section className="py-24 relative bg-gray-50">
      <div className="container mx-auto px-6">
        {/* Section Header */}
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-foreground mb-6">
            Real People, <span className="text-primary">Real Dreams</span>
            <br />
            <span className="text-muted-foreground">Real Impact</span>
          </h2>
          <p className="text-xl text-muted-foreground max-w-4xl mx-auto leading-relaxed">
            These are the faces behind our success stories. Real Kenyan entrepreneurs who believed in their dreams 
            and found a partner in Zacca.ai to make them reality.
          </p>
        </div>

        {/* Main Story Card */}
        <div className="max-w-6xl mx-auto mb-16">
          <Card className="bg-white border-0 shadow-xl p-8 lg:p-12 relative overflow-hidden">
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              {/* Story Content */}
              <div className="space-y-8">
                <Badge 
                  variant="secondary" 
                  className="bg-primary/10 text-primary border-primary/20 font-semibold px-4 py-2"
                >
                  <Heart className="w-4 h-4 mr-2" />
                  {stories[currentStory].badge}
                </Badge>
                
                <div>
                  <div className="text-6xl mb-6">{stories[currentStory].image}</div>
                  <h3 className="text-3xl lg:text-4xl font-bold text-foreground mb-3">
                    {stories[currentStory].name}
                  </h3>
                  <p className="text-xl text-primary font-semibold mb-6">
                    {stories[currentStory].business}
                  </p>
                </div>

                <div className="bg-primary/5 rounded-2xl p-6 border-l-4 border-primary">
                  <Quote className="w-6 h-6 text-primary mb-3" />
                  <blockquote className="text-lg text-foreground italic leading-relaxed mb-4">
                    "{stories[currentStory].story}"
                  </blockquote>
                  <p className="text-sm text-primary font-semibold">
                    - {stories[currentStory].name}
                  </p>
                </div>

                <p className="text-foreground/80 leading-relaxed text-lg">
                  {stories[currentStory].details}
                </p>

                {/* Personal Quote */}
                <div className="bg-gradient-to-r from-primary/10 to-accent/10 rounded-2xl p-6">
                  <p className="text-primary font-semibold text-lg mb-2">
                    "{stories[currentStory].quote}"
                  </p>
                  <p className="text-sm text-muted-foreground">
                    - {stories[currentStory].name}
                  </p>
                </div>

                {/* Impact Metrics */}
                <div className="grid grid-cols-2 gap-6 pt-4">
                  <div className="bg-white rounded-xl p-6 text-center shadow-sm border border-gray-100">
                    <TrendingUp className="w-8 h-8 text-primary mx-auto mb-3" />
                    <div className="text-sm text-muted-foreground mb-1">Business Impact</div>
                    <div className="text-2xl font-bold text-primary">{stories[currentStory].impact}</div>
                  </div>
                  <div className="bg-white rounded-xl p-6 text-center shadow-sm border border-gray-100">
                    <Star className="w-8 h-8 text-gold mx-auto mb-3" />
                    <div className="text-sm text-muted-foreground mb-1">Loan Received</div>
                    <div className="text-2xl font-bold text-gold">{stories[currentStory].loan}</div>
                  </div>
                </div>
              </div>

              {/* Visual Element */}
              <div className="relative">
                <div className="w-full h-96 bg-gradient-to-br from-primary/10 to-accent/10 rounded-3xl flex items-center justify-center relative overflow-hidden shadow-lg">
                  <div className="text-9xl opacity-30 animate-float">
                    {stories[currentStory].image}
                  </div>
                  
                  {/* Animated Success Indicators */}
                  <div className="absolute top-8 right-8 bg-white rounded-full p-4 shadow-lg animate-pulse">
                    <TrendingUp className="w-6 h-6 text-primary" />
                  </div>
                  <div className="absolute bottom-8 left-8 bg-white rounded-full p-4 shadow-lg animate-pulse" style={{animationDelay: '0.5s'}}>
                    <Star className="w-6 h-6 text-gold" />
                  </div>
                  
                  {/* Floating elements */}
                  <div className="absolute top-1/4 left-8 w-3 h-3 bg-primary/30 rounded-full animate-pulse" />
                  <div className="absolute bottom-1/4 right-12 w-2 h-2 bg-accent/40 rounded-full animate-pulse" style={{animationDelay: '1s'}} />
                </div>
              </div>
            </div>
          </Card>
        </div>

        {/* Navigation */}
        <div className="flex items-center justify-center gap-6 mb-16">
          <Button 
            variant="outline" 
            size="lg"
            onClick={prevStory}
            className="border-primary text-primary hover:bg-primary hover:text-white transition-all duration-300"
          >
            <ArrowLeft className="w-5 h-5 mr-2" />
            Previous
          </Button>
          
          <div className="flex gap-3">
            {stories.map((_, index) => (
              <button
                key={index}
                onClick={() => setCurrentStory(index)}
                className={`w-4 h-4 rounded-full transition-all duration-300 ${
                  index === currentStory ? 'bg-primary scale-125' : 'bg-gray-300 hover:bg-gray-400'
                }`}
              />
            ))}
          </div>
          
          <Button 
            variant="outline" 
            size="lg"
            onClick={nextStory}
            className="border-primary text-primary hover:bg-primary hover:text-white transition-all duration-300"
          >
            Next
            <ArrowRight className="w-5 h-5 ml-2" />
          </Button>
        </div>

        {/* Impact Statistics */}
        <div className="bg-white rounded-3xl p-12 shadow-lg">
          <div className="text-center mb-12">
            <h3 className="text-3xl font-bold text-foreground mb-4">
              Our <span className="text-primary">Collective Impact</span>
            </h3>
            <p className="text-lg text-muted-foreground">
              Together, we're building a more inclusive financial future for Kenya
            </p>
          </div>
          
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-8 text-center">
            <div className="p-6 bg-gradient-to-br from-primary/5 to-primary/10 rounded-2xl">
              <Users className="w-12 h-12 text-primary mx-auto mb-4" />
              <div className="text-4xl font-bold text-primary mb-2">2,500+</div>
              <div className="text-muted-foreground font-medium">Lives Transformed</div>
            </div>
            <div className="p-6 bg-gradient-to-br from-accent/5 to-accent/10 rounded-2xl">
              <TrendingUp className="w-12 h-12 text-accent mx-auto mb-4" />
              <div className="text-4xl font-bold text-accent mb-2">98.5%</div>
              <div className="text-muted-foreground font-medium">Success Rate</div>
            </div>
            <div className="p-6 bg-gradient-to-br from-terracotta/5 to-terracotta/10 rounded-2xl">
              <Star className="w-12 h-12 text-terracotta mx-auto mb-4" />
              <div className="text-4xl font-bold text-terracotta mb-2">KSh 2.1B+</div>
              <div className="text-muted-foreground font-medium">Credit Facilitated</div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};