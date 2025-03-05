Config = {}

Config.ServerID = "YOUR_DISCORD_SERVER_ID" -- Your Discord server ID
Config.BotToken = "YOUR_DISCORD_BOT_TOKEN" -- Your Discord bot token
Config.RequiredChannelID = "REQUIRED_CHANNEL_ID" -- Voice channel ID players must be in

Config.VoiceCheckInterval = 5 * 60 * 1000 -- Interval for background voice check (default: 5 minutes)

Config.KickMessage = "❌ Must remain in designated voice channel" -- Customizable kick message
Config.VerificationMessage = "🔍 Verifying Discord Voice Channel..." -- Message shown during verification
