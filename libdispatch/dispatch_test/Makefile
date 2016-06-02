BUILDOPTS=-Xlinker -L/usr/local/lib -Xcc -fblocks -Xlinker -ldispatch
BUILDCONFIG=debug

SWIFTC=swiftc
SWIFT=swift
ifdef SWIFTPATH
    SWIFTC=$(SWIFTPATH)/bin/swiftc
    SWIFT=$(SWIFTPATH)/bin/swift
endif
OS := $(shell uname)
ifeq ($(OS),Darwin)
    SWIFTC=swiftc -sdk `xcrun --show-sdk-path --sdk macosx` -Xcc -I`xcrun --show-sdk-path --sdk macosx`/usr/include
	BUILDOPTS=-Xlinker -L/usr/local/lib
endif

all: debug
	
release: BUILDCONFIG=release 
release: build-swift;
	
debug: build-swift
	
build-swift:
	$(SWIFT) build --configuration $(BUILDCONFIG) -v $(BUILDOPTS)
		
test: debug
	.build/debug/dispatch_test
	
clean:
	$(SWIFT) build --clean dist
	$(SWIFT) build --clean build

