import { useState, useEffect } from "react";
import heroMockupImage from "@/assets/New Hero Mockup.png";
import heroBackgroundImage from "@/assets/Background New Hero- Here.png";
import { toast } from "sonner";

// Formspree form ID - from env or fallback (Vite inlines at build time; ensure Coolify passes env to build)
const FORMSPREE_FORM_ID = import.meta.env.VITE_FORMSPREE_FORM_ID || "mvzwogop";

const isValidEmail = (value: string) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
const isValidPhone = (value: string) => /^[\d\s\-\+\(\)]{8,20}$/.test(value.replace(/\s/g, ""));

export const HeroSection = () => {
  const [animated, setAnimated] = useState(false);
  const [contact, setContact] = useState("");
  const [status, setStatus] = useState<"idle" | "loading" | "success" | "error">("idle");

  useEffect(() => {
    setAnimated(true);
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    const trimmed = contact.trim();
    if (!trimmed) {
      toast.error("Please enter your email or phone number");
      return;
    }
    if (!isValidEmail(trimmed) && !isValidPhone(trimmed)) {
      toast.error("Please enter a valid email or phone number");
      return;
    }

    setStatus("loading");
    try {
      // Formspree accepts JSON with Accept header (see help.formspree.io)
      const res = await fetch(`https://formspree.io/f/${FORMSPREE_FORM_ID}`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({
          contact: trimmed,
          email: trimmed.includes("@") ? trimmed : undefined,
          _replyto: trimmed.includes("@") ? trimmed : undefined,
          _subject: `New Zacca waiting list signup: ${trimmed}`,
        }),
      });

      const data = await res.json().catch(() => ({}));

      if (res.ok) {
        setStatus("success");
        setContact("");
        toast.success("You're on the list! Check your inbox for a welcome message.");
      } else {
        setStatus("error");
        const errMsg = data?.errors?.map((e: { message: string }) => e.message).join(", ") || "Something went wrong. Please try again.";
        toast.error(errMsg);
      }
    } catch {
      setStatus("error");
      toast.error("Something went wrong. Please try again.");
    }
  };

  return (
    <section
      id="hero"
      className="relative min-h-screen flex items-center overflow-hidden pt-24 sm:pt-28 lg:pt-20 pb-8 w-full bg-cover bg-center bg-no-repeat"
      style={{
        backgroundImage: `url(${heroBackgroundImage})`,
      }}
    >
      <div className="container mx-auto px-4 sm:px-6 relative z-10 w-full">
        <div className="relative grid lg:grid-cols-2 gap-4 sm:gap-6 lg:gap-12 min-h-0 lg:min-h-[750px] items-center">
            {/* Left column - Hero content */}
            <div className="flex flex-col justify-center py-4 sm:py-6 lg:py-16 px-4 sm:px-6 lg:px-12 xl:px-16 order-2 lg:order-1">
              <div className={`flex flex-col gap-6 lg:gap-[60px] max-w-[795px] transition-all duration-1000 ${animated ? "opacity-100 translate-y-0" : "opacity-0 translate-y-4"}`}>
                {/* Headline & description */}
                <div className="flex flex-col gap-4">
                  <h1
                    className="text-2xl sm:text-3xl md:text-4xl lg:text-[42px] leading-tight text-black"
                    style={{
                      fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
                      fontWeight: 400,
                      lineHeight: "1.25",
                    }}
                  >
                    Transforming Informal Transactions into Africa&apos;s Most Valuable Credit Passport
                  </h1>
                  <p
                    className="text-base max-w-[547px] text-black leading-[1.55]"
                    style={{
                      fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
                      fontWeight: 400,
                      fontSize: "16.3697px",
                    }}
                  >
                    AI converts your mobile money and bank transactions into verified credit records. Get fair access to loans, insurance, and financial services.
                  </p>
                </div>

                {/* Contact form & CTA */}
                <form onSubmit={handleSubmit} className="flex flex-col gap-4 max-w-[547px]">
                  <div className="flex flex-col sm:flex-row gap-4 sm:gap-6">
                    <input
                      type="text"
                      placeholder="Enter email or phone number"
                      value={contact}
                      onChange={(e) => setContact(e.target.value)}
                      disabled={status === "loading"}
                      className="flex-1 min-w-0 px-6 py-3 rounded-[10px] bg-black text-white placeholder:text-white/70 focus:outline-none focus:ring-2 focus:ring-[#2C14DD]/50 disabled:opacity-70"
                      style={{
                        fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
                        fontWeight: 200,
                        fontSize: "14px",
                      }}
                    />
                    <button
                      type="submit"
                      disabled={status === "loading"}
                      className="px-8 py-3 rounded-[15px] text-white font-medium whitespace-nowrap hover:opacity-90 transition-opacity disabled:opacity-70 disabled:cursor-not-allowed"
                      style={{
                        fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
                        fontWeight: 500,
                        fontSize: "14px",
                        background: "linear-gradient(0deg, #2C14DD, #2C14DD)",
                      }}
                    >
                      {status === "loading" ? "Submitting..." : "Get Started"}
                    </button>
                  </div>
                  <p
                    className="text-black"
                    style={{
                      fontFamily: "'Euclid Circular B', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', sans-serif",
                      fontWeight: 400,
                      fontSize: "16.3697px",
                      lineHeight: "155%",
                    }}
                  >
                    Enter your email or phone number to join our waiting list.
                  </p>
                </form>
              </div>
            </div>

            {/* Right column - Phone mockup */}
            <div className="flex items-center justify-center py-4 sm:py-6 lg:py-16 px-4 sm:px-6 order-1 lg:order-2">
              <div className={`relative z-10 transition-all duration-1000 delay-300 ${animated ? "opacity-100 scale-100" : "opacity-0 scale-95"}`}>
                <img
                  src={heroMockupImage}
                  alt="Zacca.ai app interface"
                  className="w-auto h-[280px] sm:h-[350px] md:h-[420px] lg:h-[536px] object-contain drop-shadow-2xl"
                />
              </div>
            </div>
          </div>
      </div>
    </section>
  );
};
