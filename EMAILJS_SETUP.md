# EmailJS Setup – Welcome Email (Auto-Responder)

The welcome email is sent programmatically via [EmailJS](https://www.emailjs.com) when someone submits their **email** (not phone). No Formspree auto-responder needed.

## Security

- **All credentials in .env only** – never hardcoded or committed
- **Use Public Key only** – NEVER use or expose the EmailJS Private Key
- **.env is gitignored** – add vars to your hosting platform for production
- Service ID, Template ID, and Public Key are designed for client-side use; Private Key must stay server-side only

## 1. Create EmailJS Account

- Go to [emailjs.com](https://www.emailjs.com) and sign up (free tier: 200 emails/month)

## 2. Add Email Service

- **Email Services** → **Add New Service**
- Connect Gmail (or Outlook, Yahoo, etc.)
- Copy the **Service ID** (e.g. `service_abc123`)

## 3. Create Email Template

- **Email Templates** → **Create New Template**
- **Name:** Zacca Welcome
- **Subject:** `{{subject}}` (or hardcode: `Welcome to Zacca - You're on the list!`)
- **Content (HTML or plain):**

```
{{message}}
```

- **To Email:** `{{to_email}}` (this sends TO the visitor)
- **From Name:** Zacca
- **Reply To:** your support email
- Save and copy the **Template ID** (e.g. `template_xyz789`)

### Template Variables (must match exactly)

| Variable   | Description                    |
|-----------|--------------------------------|
| `to_email`| Visitor's email (recipient)    |
| `subject` | Email subject                 |
| `message` | Welcome message body          |

## 4. Get Public Key

- **Account** → **API Keys** → copy **Public Key**

## 5. Add to Environment

Add to `.env` and your hosting platform (Coolify):

```
VITE_EMAILJS_SERVICE_ID=service_xxxxx
VITE_EMAILJS_TEMPLATE_ID=template_xxxxx
VITE_EMAILJS_PUBLIC_KEY=your_public_key
```

## 6. Rebuild & Deploy

Vite inlines these at build time. Rebuild and redeploy after adding the variables.

---

**Note:** Welcome emails are only sent when the visitor enters an **email**. Phone submissions are recorded in Formspree but no email is sent (see Troubleshooting below if welcome emails are not received).

---

## Troubleshooting: Not Receiving Welcome Email

### 1. Template "To Email" field (most common)

In your EmailJS template, the **To Email** field MUST be set to exactly: `{{to_email}}`

If it is blank or a fixed address, the email will not reach the visitor. Edit the template and set **To Email** to `{{to_email}}`.

### 2. Template variables must match (case-sensitive)

| In template | Our code sends |
|-------------|----------------|
| `{{to_email}}` | visitor email |
| `{{subject}}` | Welcome subject |
| `{{message}}` | Welcome body |

### 3. Check spam folder

Welcome emails may land in spam. Ask the visitor to check spam/junk.

### 4. Production build env vars

Vite inlines env vars at **build time**. In Coolify, ensure `VITE_EMAILJS_*` vars are available during the **build step**, not just at runtime.

### 5. Test in EmailJS dashboard

Use **Test It** on the template to send a test email. If that works, the template config is correct. (you’ll still get notified).
