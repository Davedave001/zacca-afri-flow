# Hero Section Slideshow - Photo Upload Instructions

## 📸 How to Add Your Kenyan Entrepreneur Photos

The hero section now includes a full-width slideshow that will showcase real Kenyan entrepreneurs in action. Here's how to add your photos:

### 1. **Photo Requirements**
- **Format**: JPG, PNG, or WebP
- **Size**: 1920x1080 pixels (or similar high resolution)
- **Content**: Kenyan entrepreneurs in action (market vendors, boda riders, digital sellers, craft vendors)

### 2. **Upload Your Photos**
1. Place your photos in the `public/images/` directory
2. Create the directory if it doesn't exist: `mkdir public/images`
3. Name your photos descriptively:
   - `boda-rider-michael.jpg`
   - `market-vendor-grace.jpg`
   - `digital-seller-sarah.jpg`
   - `craft-vendor-amina.jpg`

### 3. **Update the Photo Paths**
In `src/components/HeroSection.tsx`, replace the placeholder URLs:

```typescript
const entrepreneurPhotos = [
  {
    src: "/images/boda-rider-michael.jpg", // Your boda rider photo
    alt: "Kenyan boda boda rider entrepreneur in action",
    title: "Michael - Boda Boda Operator",
    subtitle: "Nakuru County"
  },
  {
    src: "/images/market-vendor-grace.jpg", // Your market vendor photo
    alt: "Kenyan market vendor entrepreneur with fresh produce",
    title: "Grace - Market Vendor",
    subtitle: "Eastleigh Market"
  },
  {
    src: "/images/digital-seller-sarah.jpg", // Your digital seller photo
    alt: "Young Kenyan digital entrepreneur selling online",
    title: "Sarah - Digital Entrepreneur",
    subtitle: "Nairobi"
  },
  {
    src: "/images/craft-vendor-amina.jpg", // Your craft vendor photo
    alt: "Kenyan craft vendor entrepreneur with handmade goods",
    title: "Amina - Craft Vendor",
    subtitle: "Maasai Market"
  }
];
```

### 4. **Features of the Slideshow**
- ✅ **Auto-advance**: Changes every 5 seconds
- ✅ **Manual navigation**: Left/right arrow buttons
- ✅ **Dot indicators**: Click to jump to specific slides
- ✅ **Smooth transitions**: Fade effect between slides
- ✅ **Entrepreneur info**: Shows name and location for each photo
- ✅ **Responsive design**: Works on all devices

### 5. **Perfect Photo Types**
Based on your uploaded images, these would be perfect:
- **Boda boda rider** with passenger (transportation entrepreneur)
- **Market vendor** with fresh produce (food entrepreneur)
- **Digital seller** with smartphone/online business (tech entrepreneur)
- **Craft vendor** with handmade goods (artisan entrepreneur)

### 6. **Current Status**
The slideshow is ready and will work immediately once you:
1. Upload your photos to `public/images/`
2. Update the file paths in the code
3. Refresh your browser

The slideshow will automatically cycle through your authentic Kenyan entrepreneur photos, creating a powerful, human-centered hero section that showcases real people and real impact! 🇰🇪✨
