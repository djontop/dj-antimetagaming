# **dj-antimetagaming** 🎙🚫  
**A FiveM Anti-Metagaming Voice Channel Verification System**  

---

## **📌 Description**  
`dj-antimetagaming` is a **FiveM script** that enforces **Discord voice channel verification** to prevent **metagaming**. Players must be inside a **specific voice channel** before they can join the server, ensuring **fair roleplay** and discouraging out-of-game communication abuse.  

🔹 **On Connection:** Checks if the player is in the required Discord voice channel.  
🔹 **During Gameplay:** Periodically verifies players remain in the channel.  
🔹 **Instant Kick:** Players who are not in the designated voice channel are removed.  

### **⚠️ Disclaimer:**  
This system **can be bypassed** (e.g., multiple Discord accounts, alternative voice channels). However, **a true RP player will follow the rules and respect roleplay integrity.** This script enforces **basic compliance**, but full enforcement depends on server administration.  

---

## **✨ Features**  
✅ **Framework Agnostic** – Works with **any** FiveM server (QBCore, ESX, or standalone).  
✅ **Discord Voice Verification on Connection** – Prevents players from joining without being in the required channel.  
✅ **Automated Periodic Checks** – Ensures players remain in the voice channel every 5 minutes.  
✅ **Instant Kick for Violators** – If a player leaves the voice channel, they are kicked.  
✅ **Optimized & Secure API Requests** – Uses Discord’s API to fetch real-time voice channel membership.  
✅ **Fully Configurable** – Modify bot settings, check intervals, and more.  

---

## **📂 Installation Guide**  

### **1️⃣ Dependencies**  
- FiveM Server (Supports **QBCore, ESX, or Standalone**)  
- Discord Bot (with `Read Member` and `Read Voice State` permissions)  

### **2️⃣ Discord Bot Setup**  
1. **Create a Discord bot** via the [Discord Developer Portal](https://discord.com/developers/applications).  
2. **Enable Privileged Gateway Intents:**  
   - Go to **Bot Settings** → Enable **"Server Members Intent"** and **"Presence Intent"**.  
3. **Invite the bot** to your server using the following permissions:  
   ```
   https://discord.com/oauth2/authorize?client_id=YOUR_BOT_ID&permissions=268438528&scope=bot
   ```
4. **Ensure the bot has the "Read Voice State" permission** in your Discord server.  

---

## **3️⃣ Installation Steps**  
1. **Download & Extract** the script into your `resources` folder.  
2. Rename the folder to:  
   ```
   dj-antimetagaming
   ```
3. Add the following line to your `server.cfg`:  
   ```ini
   ensure dj-antimetagaming
   ```
4. **Edit Configuration:** Open `config.lua` and update:  
   ```lua
   VoiceVerification.Settings = {
       ServerID = "YOUR_DISCORD_SERVER_ID",
       BotToken = "YOUR_DISCORD_BOT_TOKEN",
       RequiredChannelID = "REQUIRED_CHANNEL_ID"
   }
   ```
5. **Restart your server.**  

---

## **🛠 How It Works**  
🔹 **On Player Connection:**  
- The script checks if the player is inside the designated voice channel.  
- If verified ✅ → They can join the server.  
- If not ❌ → They are **kicked with a message** explaining why.  

🔹 **During Gameplay (Every 5 Minutes):**  
- It verifies **all connected players** to ensure they remain in the voice channel.  
- Players who **leave the channel** get **instantly kicked**.
  
---

## **🚀 Planned Features**  
✔️ **Webhook Logging** – Logs verification failures & warnings to a Discord channel for admins.  
✔️ **Multiple Required Channels** – Allows multiple voice channels for verification.  
✔️ **Customizable Messages** – Easily modify warning & kick messages.  
✔️ **Admin Command to Check All Players** – Admins can check the voice channel status of all connected players at once.  
✔️ **Warning System** – Players receive warnings before being kicked for violations. Admins can **issue, view, or reset warnings**.  
✔️ **Ban System (Planned)** – Players who repeatedly violate voice verification **can be auto-banned**.  
✔️ **Admin Notification System** – Alerts admins when a player receives multiple warnings.  

---


🚀 **Enhance roleplay, prevent metagaming, and keep your FiveM server fair with `dj-antimetagaming`!** 🎙
