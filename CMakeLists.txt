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
        QML_FILES pedals/DelayPedal.qml
        RESOURCES pedals/fonts/Prisma.ttf pedals/fonts/RussoOne-Regular.ttf
        QML_FILES pedals/DistortionPedal.qml
        pedals/assets/Knob-Dial-Classic.png
        RESOURCES pedals/assets/Black-Background.png pedals/assets/Blue-Background.png pedals/assets/Button-Pedal-Checked.png pedals/assets/Button-Pedal-Checked@2x.png pedals/assets/Button-Pedal.png pedals/assets/Button-Pedal@2x.png pedals/assets/Green-Background.png pedals/assets/Guitar-Pedal-Background.png pedals/assets/Guitar-Pedal-Background@2x.png pedals/assets/Knob-Dial.png pedals/assets/Knob-Dial@2x.png pedals/assets/Knob-Markings.png pedals/assets/Knob-Markings@2x.png pedals/assets/LED-Checked.png pedals/assets/LED-Checked@2x.png pedals/assets/LED.png pedals/assets/LED@2x.png pedals/assets/Pink-Background.png pedals/assets/Screw.png pedals/assets/Screw@2x.png pedals/assets/Switch-Checked.png pedals/assets/Switch-Checked@2x.png pedals/assets/Switch.png pedals/assets/Switch@2x.png pedals/assets/White-Background.png pedals/assets/Yellow-Background.png
        RESOURCES pedals/fonts/NeutronsDemoRegular.ttf
        QML_FILES pedals/ChorusPedal.qml
        RESOURCES pedals/fonts/JuicyFills.ttf
        RESOURCES pedals/fonts/TheAugusta.otf
        RESOURCES pedals/fonts/Varsity.ttf
        RESOURCES pedals/fonts/secrcode.ttf
        QML_FILES pedals/FuzzPedal.qml
        RESOURCES pedals/fonts/TheDukeofPrunes.ttf
        pedals/assets/CustomWhite-Background.png
        pedals/assets/CustomBlue-Background.png
        pedals/assets/MuffKnob.png
        pedals/assets/BluesKnob.png
        pedals/assets/LEDBIG.png
        pedals/assets/LEDBIG-Checked.png
        pedals/assets/Stomp.png
        pedals/assets/Stomp-Checked.png
        QML_FILES pedals/TremoloPedal.qml
        QML_FILES pedals/ReverbPedal.qml
        QML_FILES pedals/AmpPedal.qml
        RESOURCES previews/Amp.png previews/Reverb.png previews/Tremolo.png
        RESOURCES pedals/SwitchImage.qml
        QML_FILES pedals/DeviceSwitch.qml
        QML_FILES pedals/DeviceText.qml
        QML_FILES pedals/DeviceKnob.qml
        QML_FILES pedals/ScrewImage.qml
        QML_FILES pedals/InfoText.qml
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
