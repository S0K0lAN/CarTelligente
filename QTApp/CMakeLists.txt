cmake_minimum_required(VERSION 3.24)

project(CarDiagnostics LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 6.7 COMPONENTS 
    Core 
    Gui 
    Qml 
    Quick 
    QuickControls2
    REQUIRED
)

set(PROJECT_SOURCES
    src/main.cpp
    
    src/data/enginedata.h
    src/data/enginedata.cpp
    src/data/batterydata.h
    src/data/batterydata.cpp
    src/data/resourceitem.h
    src/data/resourceitem.cpp
    src/data/resourcedata.h
    src/data/resourcedata.cpp
    src/data/diagnosticcode.h
    src/data/diagnosticcode.cpp
    src/data/anomalyitem.h
    src/data/anomalyitem.cpp
    src/data/dataprovider.h
    src/data/dataprovider.cpp
    
    qml/resources.qrc
)

add_executable(${PROJECT_NAME}
    ${PROJECT_SOURCES}
)

target_link_libraries(${PROJECT_NAME}
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::QuickControls2
)

target_include_directories(${PROJECT_NAME} PRIVATE src/data)

set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE ON
    MACOSX_BUNDLE ON
)
