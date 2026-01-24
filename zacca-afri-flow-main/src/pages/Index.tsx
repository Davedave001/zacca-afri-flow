import { Header } from "@/components/Header";
import { HeroSection } from "@/components/HeroSection";
import { AboutSection } from "@/components/AboutSection";
import { CTASection } from "@/components/CTASection";
import { Footer } from "@/components/Footer";

const Index = () => {
  return (
    <main className="min-h-screen bg-background">
      <Header />
      <HeroSection />
      <AboutSection />
      <CTASection />
      <Footer />
    </main>
  );
};

export default Index;