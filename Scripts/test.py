import time
import pyautogui
import keyboard
import random

def press_5():
    keyboard.press_and_release('5')
    time.sleep(random.uniform(20, 30))

def find_picture():
    while True:
        picture_location = pyautogui.locateOnScreen('extraction.png')
        if picture_location is not None:
            print("Picture found!")
            break
        press_5()

def start_macro():
    # Continuously press '5' for one hour
    start_time = time.time()
    while time.time() - start_time < 3600:
        press_5()

    # After 1 hour, initiate the picture search
    find_picture()

Bind the script to a key (e.g., F1)
keyboard.add_hotkey('F1', start_macro)

Keep the script running
keyboard.wait('esc')