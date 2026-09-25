.PHONY: all

all: build/NotoSansKR-VF-distilled.woff2 build/NotoSerifKR-VF-distilled.woff2 build/PretendardKR-VF-distilled.woff2 build/RobotoMono-VF-distilled.woff2 build/LICENSE

build/LICENSE: LICENSE
	mkdir -p build
	cp LICENSE build/LICENSE

build/NotoSansKR-VF-distilled.woff2: build/NotoSansKR-VF-distilled.ttf
	woff2_compress build/NotoSansKR-VF-distilled.ttf

build/NotoSerifKR-VF-distilled.woff2: build/NotoSerifKR-VF-distilled.ttf
	woff2_compress build/NotoSerifKR-VF-distilled.ttf

build/PretendardKR-VF-distilled.woff2: build/PretendardKR-VF-distilled.ttf
	woff2_compress build/PretendardKR-VF-distilled.ttf

build/RobotoMono-VF-distilled.woff2: build/RobotoMono-VF-distilled.ttf
	woff2_compress build/RobotoMono-VF-distilled.ttf

build/NotoSansKR-VF-distilled.ttf: build/glyphs.txt build/NotoSansKR-VF.ttf
	pyftsubset build/NotoSansKR-VF.ttf --text-file=build/glyphs.txt --output-file=build/NotoSansKR-VF-distilled.ttf

build/NotoSerifKR-VF-distilled.ttf: build/glyphs.txt build/NotoSerifKR-VF.ttf
	pyftsubset build/NotoSerifKR-VF.ttf --text-file=build/glyphs.txt --output-file=build/NotoSerifKR-VF-distilled.ttf

build/PretendardKR-VF-distilled.ttf: build/glyphs.txt build/PretendardKR-VF.ttf
	pyftsubset build/PretendardKR-VF.ttf --text-file=build/glyphs.txt --output-file=build/PretendardKR-VF-distilled.ttf

build/RobotoMono-VF-distilled.ttf: build/glyphs.txt build/RobotoMono-VF.ttf
	pyftsubset build/RobotoMono-VF.ttf --text-file=build/glyphs.txt --output-file=build/RobotoMono-VF-distilled.ttf

build/glyphs.txt: generate_glyphs.py
	mkdir -p build
	python generate_glyphs.py > build/glyphs.txt

build/NotoSansKR-VF.ttf:
	wget https://raw.githubusercontent.com/googlefonts/noto-cjk/main/Sans/Variable/TTF/Subset/NotoSansKR-VF.ttf -qO build/NotoSansKR-VF.ttf

build/NotoSerifKR-VF.ttf:
	wget https://raw.githubusercontent.com/googlefonts/noto-cjk/main/Serif/Variable/TTF/Subset/NotoSerifKR-VF.ttf -qO build/NotoSerifKR-VF.ttf

build/PretendardKR-VF.ttf:
	wget https://raw.githubusercontent.com/orioncactus/pretendard/main/packages/pretendard/dist/public/variable/PretendardVariable.ttf -qO build/PretendardKR-VF.ttf

build/RobotoMono-VF.ttf:
	wget https://github.com/googlefonts/RobotoMono/raw/main/fonts/variable/RobotoMono%5Bwght%5D.ttf -qO build/RobotoMono-VF.ttf
