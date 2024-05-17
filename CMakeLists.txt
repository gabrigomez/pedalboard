cmake_minimum_required(VERSION 3.16)

project(PedalBoard VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appPedalBoard
    main.cpp
)

qt_add_qml_module(appPedalBoard
    URI PedalBoard
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES Title.qml
        QML_FILES PedalBoard.qml
        QML_FILES PedalPreview.qml
        QML_FILES Board.qml
        RESOURCES previews/Delay.png
        RESOURCES fonts/african.ttf fonts/Browser.ttf
        QML_FILES components/DelayPedal.qml
        RESOURCES components/assets/Button-Pedal-Checked.png components/assets/Button-Pedal-Checked@2x.png components/assets/Button-Pedal.png components/assets/Button-Pedal@2x.png components/assets/Guitar-Pedal-Background.png components/assets/Guitar-Pedal-Background@2x.png components/assets/Knob-Dial.png components/assets/Knob-Dial@2x.png components/assets/Knob-Markings.png components/assets/Knob-Markings@2x.png components/assets/LED-Checked.png components/assets/LED-Checked@2x.png components/assets/LED.png components/assets/LED@2x.png components/assets/Screw.png components/assets/Screw@2x.png components/assets/Switch-Checked.png components/assets/Switch-Checked@2x.png components/assets/Switch.png components/assets/Switch@2x.png
        RESOURCES components/fonts/Prisma.ttf components/fonts/RussoOne-Regular.ttf
        QML_FILES components/DistortionPedal.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPedalBoard PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appPedalBoard
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPedalBoard
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appPedalBoard
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
