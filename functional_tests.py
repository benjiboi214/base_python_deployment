import os

from selenium import webdriver
from selenium.webdriver import FirefoxOptions

host = os.getenv("DJANGO_EXTERNAL_HOST_NAME", "")
port = os.getenv("DJANGO_EXTERNAL_PORT_NUM", "")

opts = FirefoxOptions()
opts.add_argument("--headless")

browser = webdriver.Firefox(options=opts)
browser.get(f'http://{host}:{port}')


def test_deployment_successful():
    assert 'Page not found' in browser.title
