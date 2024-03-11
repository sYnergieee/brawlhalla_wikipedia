import json
import requests
from bs4 import BeautifulSoup
import re

CHEST_LINK = 'https://brawlhalla.fandom.com/wiki/Chests'
MAIN_LINK_PATH = 'https://brawlhalla.fandom.com'
HEADERS = {
    "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36 Edg/99.0.1150.55"
}

parser_chests = []

response = requests.get(CHEST_LINK, headers=HEADERS)
src = response.text
soup = BeautifulSoup(src, "lxml")
all_chests = soup.find('span', attrs={"id": "List_of_Chests"}).find_next(
    'div').find_all('table')

for chest in all_chests:
    tr_block = chest.find('tr').find('a')
    chest_name = tr_block['title']

    print(chest_name)

    chest_link = MAIN_LINK_PATH+tr_block['href']
    response = requests.get(chest_link, headers=HEADERS)
    src = response.text
    soup = BeautifulSoup(src, "lxml")
    img = soup.find('img', attrs={"data-image-name": f'{chest_name}.png'})['src']
    b_block = soup.find('b', string='Cost:').find_next('td').text[1:]
    cost = int(b_block.replace(' (per unbox)', ''))

    parser_chests.append({
        'name': chest_name,
        'img': img,
        'cost': cost
    })

with open("chest_database.json", "w", encoding="utf-8") as file:
    json.dump(parser_chests, file, indent=4, ensure_ascii=False)
