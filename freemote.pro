# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = freemote

CONFIG += sailfishapp

SOURCES += src/freemote.cpp

OTHER_FILES += qml/freemote.qml \
    rpm/freemote.changes.in \
    rpm/freemote.spec \
    rpm/freemote.yaml \
    translations/*.ts \
    freemote.desktop

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/freemote-de.ts

