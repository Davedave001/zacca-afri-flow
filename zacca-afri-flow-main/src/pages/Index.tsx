import { HeroSection } from "@/components/HeroSection";
import { AboutSection } from "@/components/AboutSection";
import { HowItWorksSection } from "@/components/HowItWorksSection";
import { FeaturesSection } from "@/components/FeaturesSection";
import { ImpactStoriesSection } from "@/components/ImpactStoriesSection";
import { LendersSection } from "@/components/LendersSection";
import { CTASection } from "@/components/CTASection";
import { Footer } from "@/components/Footer";

const Index = () => {
  return (
    <main className="min-h-screen bg-background">
      <HeroSection />
      <AboutSection />
      <HowItWorksSection />
      <FeaturesSection />
      <ImpactStoriesSection />
      <LendersSection />
      <CTASection />
      <Footer />
    </main>
  );
};

export default Index;