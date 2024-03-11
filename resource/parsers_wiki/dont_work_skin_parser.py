import json
import requests
from bs4 import BeautifulSoup
import re

SKIN_LINK = 'https://brawlhalla.fandom.com/wiki/Epic_Skins#Epic_Crossover_Skins'
MAIN_LINK_PATH = 'https://brawlhalla.fandom.com'
HEADERS = {
    "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36 Edg/99.0.1150.55"
}

parser_skins = []

response = requests.get(SKIN_LINK, headers=HEADERS)
src = response.text
soup = BeautifulSoup(src, "lxml")

all_skins = soup.find_all('table', class_="wikitable")

for s in all_skins:
    try:
        all_tr = s.find_all('tr')
        parser_skins.append({"name": all_tr[0].text.strip(), "img": all_tr[1].find_all('img')[1]['data-src']})
    except Exception as e:
        ...
with open("dont_work_skins_database.json", "w", encoding="utf-8") as file:
    json.dump(parser_skins, file, indent=4, ensure_ascii=False)
