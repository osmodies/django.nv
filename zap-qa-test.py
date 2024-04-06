cat > qa-tests.py <<EOL
import os
import time
from selenium.webdriver import Firefox
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.common.by import By

opts = Options()
opts.add_argument('--headless')

driver = Firefox(options=opts)

target = os.environ['TARGET']

try:
    # signup
    # url = http://localhost:8000/taskManager/register/
    # driver.get('http://localhost:8000' + '/taskManager/register/')
    driver.get(target + '/taskManager/register/')
    time.sleep(2)

    # enter the username, password, firstname,lastname etc.
    driver.find_element(By.ID, 'id_username').send_keys('user10')

    time.sleep(1)
    driver.find_element(By.ID, 'id_first_name').send_keys('user')

    time.sleep(1)
    driver.find_element(By.ID, 'id_last_name').send_keys('user')

    time.sleep(1)
    driver.find_element(By.ID, 'id_email').send_keys('user@user1.com')

    time.sleep(1)
    driver.find_element(By.ID, 'id_password').send_keys('user123')

    time.sleep(1)
    submit = driver.find_element("css selector", '.btn.btn-danger').click()

    time.sleep(2)

    # login
    driver.get(target + '/taskManager/login/')
    driver.find_element(By.ID, 'username').send_keys('user10')
    driver.find_element(By.NAME, "password").send_keys('user123')
    submit = driver.find_element(By.XPATH, "//button[@type='submit']")
    submit.click()

    time.sleep(2)

    # spider the URL's
    driver.get(target + "/taskManager/dashboard/")
    time.sleep(2)

    driver.get(target + "/taskManager/task_list/")
    time.sleep(2)

    driver.get(target + "/taskManager/project_list/")
    time.sleep(2)

    driver.get(target + "/taskManager/search/")
    time.sleep(2)

    # editing some data for better scan results
    driver.get(target + "/taskManager/profile/")
    time.sleep(5)
    driver.find_element(By.NAME, "first_name").send_keys('firstroot')
    driver.find_element(By.NAME, 'last_name').send_keys('lastroot')
    driver.find_element(By.XPATH, "//button[@type='submit']").click()

    time.sleep(2)
finally:
    driver.close()
EOL