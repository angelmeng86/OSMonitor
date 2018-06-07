LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := stlport
ifeq ($(TARGET_ARCH),arm)
LOCAL_SRC_FILES	    := arm/libstlport_static.a
else ifeq ($(TARGET_ARCH),arm64)
LOCAL_SRC_FILES	    := arm64/libstlport_static.a
endif
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libosmcore
LOCAL_MODULE_TAGS := optional

LOCAL_FORCE_STATIC_EXECUTABLE := true
#LOCAL_CPP_EXTENSION := .cc .cpp

LOCAL_SRC_FILES := \
                   core.cpp \
                   src/core/base.cpp \
                   src/core/os.cpp \
                   src/core/cpu.cpp \
                   src/core/connection.cpp \
                   src/core/network.cpp \
                   src/core/process.cpp \
                   src/core/processor.cpp \
                   src/core/dmesg.cpp \
                   src/core/logcat_v3.cpp \
                   src/core/command.cpp \
                   src/ipc/ipcserver.cpp \
                   src/android/event_tag_map.c

LOCAL_C_INCLUDES := \
                   $(LOCAL_PATH)/src \
                   $(LOCAL_PATH)/include \
                   $(LOCAL_PATH)/include/core \
                   $(LOCAL_PATH)/include/ipc \
                   $(JNI_H_INCLUDE)
                   
LOCAL_LDLIBS := -lz -llog
LOCAL_STATIC_LIBRARIES := stlport

LOCAL_CFLAGS := -D_GLIBCXX_PERMIT_BACKWARD_HASH

# compile executeable binary for test 
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)

LOCAL_MODULE := libosmcore_pie
LOCAL_MODULE_TAGS := optional

LOCAL_FORCE_STATIC_EXECUTABLE := true
#LOCAL_CPP_EXTENSION := .cc .cpp


LOCAL_SRC_FILES := \
                   core.cpp \
                   src/core/base.cpp \
                   src/core/os.cpp \
                   src/core/cpu.cpp \
                   src/core/connection.cpp \
                   src/core/network.cpp \
                   src/core/process.cpp \
                   src/core/processor.cpp \
                   src/core/dmesg.cpp \
                   src/core/logcat_v3.cpp \
                   src/core/command.cpp \
                   src/ipc/ipcserver.cpp \
                   src/android/event_tag_map.c 

LOCAL_C_INCLUDES := \
                   $(LOCAL_PATH)/src \
                   $(LOCAL_PATH)/include \
                   $(LOCAL_PATH)/include/core \
                   $(LOCAL_PATH)/include/ipc \
                   $(JNI_H_INCLUDE)
                   
LOCAL_LDLIBS := -lz -llog
LOCAL_STATIC_LIBRARIES := stlport

LOCAL_CFLAGS := -D_GLIBCXX_PERMIT_BACKWARD_HASH -DSUPPORT_ANDROID_21

# compatiable with L
LOCAL_LDFLAGS += -fPIC -pie

# compile executeable binary for test 
include $(BUILD_EXECUTABLE)
