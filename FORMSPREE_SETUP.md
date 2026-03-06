# Formspree Setup for Get Started Form

## Security

- **Form ID in .env**: The form ID is stored in `.env` (gitignored) — never committed
- **Production**: Set `VITE_FORMSPREE_FORM_ID` in your hosting platform (Vercel, Netlify, etc.) as an environment variable
- **Note**: Formspree form IDs are designed for client-side use. When the site is built, the ID is inlined in the bundle — this is expected. Formspree relies on rate limiting and spam protection, not ID secrecy.
- **Spam protection**: Enable Honeypot and optionally reCAPTCHA in Formspree dashboard → Settings → Spam Prevention

---

The hero section "Get Started" form uses [Formspree](https://formspree.io) to:
1. **Email you** when someone submits their email or phone number
2. **Send a welcome email** to visitors who submit an email address

## Setup Steps

### 1. Create Formspree Account
- Go to [formspree.io](https://formspree.io) and sign up (free tier: 50 submissions/month)

### 2. Create a Form
- Click "New Form"
- Name it (e.g. "Zacca Waiting List")
- Copy the **Form ID** from the endpoint (e.g. `xjqgklmn` from `https://formspree.io/f/xjqgklmn`)

### 3. Add Form ID to Your Project
- Create a `.env` file in the project root (copy from `.env.example`)
- Set `VITE_FORMSPREE_FORM_ID=your_form_id_here` with your actual form ID

### 4. Enable Auto-Responder (Welcome Email)
In your Formspree form settings:
- Go to **Settings** → **Notifications**
- Enable **Auto Responder**
- Set **Reply-To**: Use the form field that contains the visitor's email (Formspree will use `_replyto` from our submission)
- Set **Subject**: `Welcome to Zacca - You're on the list!`
- Set **Message**:

```
Welcome to the Zacca community!

Thank you for joining our waiting list. As you wait for our product release, you'll receive updates frequently and will be among the first users to test the product.

We're excited to have you on board!

— The Zacca Team
```

### 5. Email Notifications to You
By default, Formspree sends you an email for each submission with the contact (email or phone number). No extra setup needed.

---

**Note:** Auto-responder only works for email submissions. Visitors who enter a phone number will see a success message on the site but won't receive an email (you'll still get notified with their phone number).
