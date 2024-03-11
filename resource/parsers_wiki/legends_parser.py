import json
import requests
from bs4 import BeautifulSoup
import re

MAIN_LINK = 'https://brawlhalla.fandom.com/wiki/Brawlhalla_Wiki'
MAIN_LINK_PATH = 'https://brawlhalla.fandom.com'
HEADERS = {
    "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36 Edg/99.0.1150.55"
}


# response = requests.get('https://brawlhalla.fandom.com/wiki/Marauder_B%C3%B6dvar', headers=HEADERS)

# with open('skin.html', 'w', encoding='utf8') as file:
#     file.write(response.text)

# with open("skin.html") as file:
#     src = file.read()
#     # src = src.replace('<br>', '\n') # на блок с героем

# soup = BeautifulSoup(src, "lxml")

parser_legends = []

# --------------------------------------------------------------------------
# БЛОК С ГЛАВНОЙ СТРАНИЦЫ
# --------------------------------------------------------------------------
response = requests.get(MAIN_LINK, headers=HEADERS)
src = response.text
soup = BeautifulSoup(src, "lxml")
all_legends = soup.find_all(
    attrs={"style": "width:90px;display:inline-block;"})

for legend in all_legends:
    link = MAIN_LINK_PATH+legend.find('a')['href']
    name = legend.find('a')['title']

    print(f'legend: {name}')

    img_short = legend.find('img')['data-src']

# --------------------------------------------------------------------------
# БЛОК ГЕРОЯ
# --------------------------------------------------------------------------
    response = requests.get(link, headers=HEADERS)
    src = response.text
    src = src.replace('<br>', '\n')
    soup = BeautifulSoup(src, "lxml")

    img_block = soup.find(class_='infobox-swapper pose')
    img_main = img_block.find('a')['href']
    store_price = soup.find(
        'b', string='Store Price:').find_next().text.strip()
    released = soup.find('b', string='Released:').find_next().text.strip()

    parser_weapons_default = []

    id_weapons_default = soup.find('span', attrs={"id": "Weapons"})
    if id_weapons_default:
        weapons_default_block = id_weapons_default.find_next('div').find_all('table')
        for weapon in weapons_default_block:
            w_img = weapon.find('img')['data-src']
            w_name = weapon.find('img')['alt']
            w_type = weapon.find(
                'td', attrs={"style": "height: 25%"}).text.split()[0]

            parser_weapons_default.append({
                'img': w_img,
                'name': w_name,
                'type': w_type
            })

    id_skins = soup.find('span', attrs={"id": "List_of_Skins"})
    if id_skins == None:
        id_skins = soup.find('span', attrs={"id": "List_Of_Skins"})
    list_of_skins = id_skins.find_next('div').find_all(class_='wikitable')

    parser_skins = []

    for skin in list_of_skins:
        tr_blocks = skin.find_all('tr')
        s_name = tr_blocks[0].find('a').text

        print(f'\tskin: {s_name}')

        s_img = tr_blocks[1].find('img')['data-src']
        s_cost = None
        s_is_exclusive = False
        s_event = None
        extra_info = tr_blocks[2].text.replace(
            '\xa0', '').replace('В', '').split('\n')

        parser_extra_info = set()

        for extr in extra_info:
            if extr[0] == ' ':
                extr = extr[1:]
            if extr.find('Cost: ') != -1:
                s_cost = int(extr.replace('Cost: ', ''))
            elif extr.find('exclusive') != -1:
                s_is_exclusive = True
                s_event = extr.replace(' exclusive', '')
                parser_extra_info.add(s_event)
            else:
                parser_extra_info.add(extr)
        name_link_path = s_name
        if s_name.find(' (Male)') != -1:
            name_link_path = s_name.replace(' (Male)', '')
        if s_name.find(' (Female)') != -1:
            name_link_path = s_name.replace(' (Female)', '')
        s_link = MAIN_LINK_PATH + f'/wiki/{name_link_path}'

# --------------------------------------------------------------------------
# БЛОК СКИНА
# --------------------------------------------------------------------------
        response = requests.get(s_link, headers=HEADERS)
        src = response.text
        soup = BeautifulSoup(src, "lxml")

        extra_info_skin = soup.find('p', string=re.compile(
            'This skin can be obtained in several ways:'))
        if extra_info_skin:
            eis = extra_info_skin.find_next()
            eis_list_a = eis.find_all('a')
            for i in range(1, len(eis_list_a), 2):
                parser_extra_info.add(eis_list_a[i].text)

        parser_extra_info = list(parser_extra_info)

        parser_weapons_skin = []

        # weapon_skins = soup.find('p', string=re.compile(
        #     'This skin comes with unique Weapon Skins:'))
        weapon_skins = soup.find(
            'span', attrs={'id': 'Weapon_Skins'}).find_next('div')
        for w_s in weapon_skins.find_all('table'):
            w_s_img = w_s.find('img')['data-src']
            w_s_name = w_s.find('img')['alt']
            w_s_type = w_s.find(
                'td', attrs={"style": "height: 25%"}).text.split()[0]

            parser_weapons_skin.append({
                'img': w_s_img,
                'name': w_s_name,
                'tyep': w_s_type
            })

        s_is_crossover = False
        if soup.find('a', string=re.compile('Epic Crossover Skins')):
            s_is_crossover = True

        parser_skins.append({
            'name': s_name,
            'img': s_img,
            'cost': s_cost,
            'is_crossover': s_is_crossover,
            'is_exclusive': s_is_exclusive,
            'weapons': parser_weapons_skin,
            'extra_info': parser_extra_info,
        })

    parser_legends.append({
        'name': name,
        'img_short': img_short,
        'img_main': img_main,
        'cost': store_price,
        'release_info': released,
        'weapon_legends': parser_weapons_default,
        'legend_skins': parser_skins,
    })

with open("db_test.json", "w", encoding="utf-8") as file:
    json.dump(parser_legends, file, indent=4, ensure_ascii=False)
