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
        RESOURCES previews/Distortion.png
        RESOURCES previews/Chorus.png
        RESOURCES previews/Fuzz.png
        RESOURCES fonts/african.ttf fonts/Browser.ttf
        QML_FILES components/DelayPedal.qml
        RESOURCES components/fonts/Prisma.ttf components/fonts/RussoOne-Regular.ttf
        QML_FILES components/DistortionPedal.qml
        RESOURCES components/assets/Black-Background.png components/assets/Blue-Background.png components/assets/Button-Pedal-Checked.png components/assets/Button-Pedal-Checked@2x.png components/assets/Button-Pedal.png components/assets/Button-Pedal@2x.png components/assets/Green-Background.png components/assets/Guitar-Pedal-Background.png components/assets/Guitar-Pedal-Background@2x.png components/assets/Knob-Dial.png components/assets/Knob-Dial@2x.png components/assets/Knob-Markings.png components/assets/Knob-Markings@2x.png components/assets/LED-Checked.png components/assets/LED-Checked@2x.png components/assets/LED.png components/assets/LED@2x.png components/assets/Pink-Background.png components/assets/Screw.png components/assets/Screw@2x.png components/assets/Switch-Checked.png components/assets/Switch-Checked@2x.png components/assets/Switch.png components/assets/Switch@2x.png components/assets/White-Background.png components/assets/Yellow-Background.png
        RESOURCES components/fonts/NeutronsDemoRegular.ttf
        QML_FILES components/ChorusPedal.qml
        RESOURCES components/fonts/JuicyFills.ttf
        RESOURCES components/fonts/TheAugusta.otf
        RESOURCES components/fonts/Varsity.ttf
        RESOURCES components/fonts/secrcode.ttf
        QML_FILES components/FuzzPedal.qml
        RESOURCES components/fonts/TheDukeofPrunes.ttf
        components/assets/CustomWhite-Background.png
        components/assets/CustomBlue-Background.png
        components/assets/LEDBIG.png
        components/assets/LEDBIG-Checked.png
        components/assets/Stomp.png
        components/assets/Stomp-Checked.png
        QML_FILES components/TremoloPedal.qml
        QML_FILES components/ReverbPedal.qml
        QML_FILES components/AmpPedal.qml

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
