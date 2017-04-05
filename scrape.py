import requests
from bs4 import BeautifulSoup

url = "http://headacheaustralia.org.au/types-of-headaches/"
dom_element = { "tag": "div", "class": "disorder-links", "id": ""}

# parse url
# arguments are @url
# @dictionary containing attribute to dom element with the links
# return href links
def get_links(url, dom_element):
    # get page and get and object
    # then parse
    page = requests.get(url)
    soup = BeautifulSoup(page.content, 'html.parser')

    div = soup.find(dom_element["tag"], attrs={"class":dom_element["class"]})
    links = [div.find('a')['href'] for a in div]

    return links

# print(get_links(url,dom_element))

links = get_links(url,dom_element)
page = requests.get(links[0])
soup = BeautifulSoup(page.content, 'html.parser')

div = soup.find('div', attrs= {"class": "bn-row first-row"})
header = div.find('h1', attrs={"class": "single-title"})
print(header)
