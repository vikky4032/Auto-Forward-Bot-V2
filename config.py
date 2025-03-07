from os import environ 

class Config:
    API_ID = environ.get("API_ID", "अपना_API_ID")
    API_HASH = environ.get("API_HASH", "अपना_API_HASH")
    BOT_TOKEN = environ.get("BOT_TOKEN", "अपना_BOT_TOKEN") 
    BOT_SESSION = environ.get("BOT_SESSION", "bot") 
    DATABASE_URI = environ.get("DATABASE", "अपना_MongoDB_URI")
    DATABASE_NAME = environ.get("DATABASE_NAME", "forward-bot")
    BOT_OWNER_ID = [int(id) for id in environ.get("BOT_OWNER_ID", 'अपना_Telegram_User_ID').split()]

class temp(object): 
    lock = {}
    CANCEL = {}
    forwardings = 0
    BANNED_USERS = []
    IS_FRWD_CHAT = []
