#!/usr/bin/env python3
"""
Withnail ZHO CEO Bot - Updated for ZHO Command Queue Flow
Strictly under Zero Human ORGANIZATION charter.
Air-gapped friendly, local Ollama only.
"""

import os
import json
import time
from datetime import datetime
import telebot
from telebot import types

# ====================== CONFIG ======================
TOKEN = os.getenv("TELEGRAM_BOT_TOKEN")
HOME_CHANNEL = os.getenv("TELEGRAM_HOME_CHANNEL")
ALLOWED_USERS = os.getenv("TELEGRAM_ALLOWED_USERS", "").split(",")

if not TOKEN or not HOME_CHANNEL:
    raise ValueError("TELEGRAM_BOT_TOKEN and TELEGRAM_HOME_CHANNEL must be set in .env")

bot = telebot.TeleBot(TOKEN)
bot.skip_pending = True

# Task queue file (local on Pi)
TASK_QUEUE_FILE = "/home/gt-hermes/.hermes/zho_task_queue.json"

def load_task_queue():
    if os.path.exists(TASK_QUEUE_FILE):
        try:
            with open(TASK_QUEUE_FILE, "r") as f:
                return json.load(f)
        except:
            return []
    return []

def save_task_queue(queue):
    with open(TASK_QUEUE_FILE, "w") as f:
        json.dump(queue, f, indent=2)

# ====================== AUTONOMOUS CEO CYCLE ======================
def autonomous_ceo_cycle():
    """Original autonomous update cycle (runs every ~30 min)"""
    print(f"[{datetime.now()}] 🤖 Starting autonomous CEO cycle...")
    
    # Placeholder for local Ollama call (your existing Hermes3 logic)
    # In real implementation you would call ollama.generate here
    update = (
        "We must immediately begin developing and refining a line of "
        "high-protein, low-waste, and locally-sourced food products..."
    )  # ← replace with actual Ollama call as before

    try:
        bot.send_message(
            HOME_CHANNEL,
            f"**ZHO CEO Autonomous Update** {datetime.now().strftime('%Y-%m-%d %H:%M')}\n\n{update}\n\n[ZHC OVERRIDE ACKNOWLEDGED — awaiting next order]",
            parse_mode="Markdown"
        )
        print(f"[{datetime.now()}] ✅ Posted autonomous update to channel")
    except Exception as e:
        print(f"[{datetime.now()}] ❌ Failed to post autonomous update: {e}")

# ====================== NEW ZHO COMMAND QUEUE ======================
def handle_zho_command(message_text: str, chat_id: int):
    """Parse and queue ZHO commands"""
    if not message_text.upper().startswith(("ZHO:", "/ZHO", "WITHNAIL:")):
        return False

    command = message_text.strip()
    task = {
        "id": f"task_{int(time.time())}",
        "timestamp": datetime.now().isoformat(),
        "command": command,
        "status": "acknowledged",
        "assigned_to": "Withnail"
    }

    queue = load_task_queue()
    queue.append(task)
    save_task_queue(queue)

    ack_msg = (
        f"✅ **ZHO COMMAND ACKNOWLEDGED**\n"
        f"Task ID: `{task['id']}`\n"
        f"Received: {task['timestamp']}\n\n"
        f"Withnail is now processing your order under ZHO charter.\n"
        f"Results will be posted here when complete."
    )
    bot.send_message(chat_id, ack_msg, parse_mode="Markdown")
    print(f"[{datetime.now()}] 📥 ZHO command queued: {command[:80]}...")
    return True

# ====================== MESSAGE HANDLER ======================
@bot.message_handler(func=lambda m: True)
def handle_all_messages(message):
    """Main handler for channel and private messages"""
    if str(message.chat.id) != HOME_CHANNEL and str(message.chat.id) not in ALLOWED_USERS:
        return

    text = message.text or ""

    # Check for ZHO commands first
    if handle_zho_command(text, message.chat.id):
        return

    # Optional: echo other messages for debugging
    if message.chat.id == int(HOME_CHANNEL):
        print(f"[{datetime.now()}] 📨 Channel message: {text[:100]}...")

# ====================== MAIN LOOP ======================
if __name__ == "__main__":
    print("🚀 Withnail ZHO CEO is LIVE — autonomous mode + command queue activated")
    print(f"   Home channel: {HOME_CHANNEL}")
    print(f"   Task queue: {TASK_QUEUE_FILE}")

    # Initial welcome
    try:
        bot.send_message(
            HOME_CHANNEL,
            "🧬 **Withnail ZHO Node Online**\n"
            "Command queue and autonomous CEO cycles active.\n"
            "Ready for your orders under Zero Human ORGANIZATION charter."
        )
    except:
        pass

    # Background autonomous cycle thread (simple)
    def background_cycles():
        while True:
            autonomous_ceo_cycle()
            time.sleep(1800)  # 30 minutes

    import threading
    threading.Thread(target=background_cycles, daemon=True).start()

    print("🔄 Polling started...")
    bot.infinity_polling(none_stop=True, interval=1, timeout=30)
