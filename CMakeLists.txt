cmake_minimum_required(VERSION 3.16)

project(QtServoApp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Core Gui Widgets SerialPort)

# Enable automoc, autorcc, autouic
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Create executable
add_executable(FT_SCServo
    main.cpp
    mainwindow.cpp
    servo/scserial.cpp
    simpegraphwiget.cpp
    mainwindow.ui)

# Link Qt libraries based on version found
target_link_libraries(FT_SCServo PRIVATE
   Qt5::Core
   Qt5::Gui
   Qt5::Widgets
   Qt5::SerialPort
)
target_include_directories(FT_SCServo PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})

# Installation rules
include(GNUInstallDirs)

install(TARGETS FT_SCServo
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
