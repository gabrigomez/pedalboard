set(MODULE_NAME Pedals)
set(LIB_NAME ${MODULE_NAME}Lib) # GreatButtonsLib

qt_add_library(${LIB_NAME} STATIC)

set_target_properties(${LIB_NAME} PROPERTIES AUTOMOC ON)
target_link_libraries(${LIB_NAME} PRIVATE Qt6::Quick)

qt_add_qml_module(${LIB_NAME}
    URI ${MODULE_NAME}
    # VERSION 1.0
    RESOURCE_PREFIX /
    QML_FILES
        DelayPedal.qml
        RESOURCES assets/Button-Pedal-Checked.png assets/Button-Pedal-Checked@2x.png assets/Button-Pedal.png assets/Button-Pedal@2x.png assets/Guitar-Pedal-Background.png assets/Guitar-Pedal-Background@2x.png assets/Knob-Dial.png assets/Knob-Dial@2x.png assets/Knob-Markings.png assets/Knob-Markings@2x.png assets/LED-Checked.png assets/LED-Checked@2x.png assets/LED.png assets/LED@2x.png assets/Screw.png assets/Screw@2x.png assets/Switch-Checked.png assets/Switch-Checked@2x.png assets/Switch.png assets/Switch@2x.png
        RESOURCES fonts/OFL.txt fonts/Prisma.ttf fonts/RussoOne-Regular.ttf
)
