MAIN_NAME=cheatsheet
OUTPUT_DIR=/experiment/output

all: build-windbg
	echo "[+] Done!"

build-image:
	docker build . -t ${MAIN_NAME}

build:
	docker run -it -m 4g --rm -v .:/experiment -w /experiment ${MAIN_NAME} make

build-windbg: clean-windbg
	pdflatex -output-format pdf -output-dir ${OUTPUT_DIR} 001_windbg/windbg.tex
	pdflatex -output-format pdf -output-dir ${OUTPUT_DIR} 001_windbg/windbg.tex
	rm -rf ${OUTPUT_DIR}/*.aux ${OUTPUT_DIR}/*.log ${OUTPUT_DIR}/*.out

clean-windbg:
	rm -rf ${OUTPUT_DIR}/*.aux ${OUTPUT_DIR}/*.log ${OUTPUT_DIR}/*.out ${OUTPUT_DIR}/windbg.pdf

enter:
	docker run -it -m 4g --rm -v .:/experiment -w /experiment --entrypoint /bin/bash ${MAIN_NAME}

clean:
	rm -rf ${OUTPUT_DIR}/*.aux ${OUTPUT_DIR}/*.log ${OUTPUT_DIR}/*.out ${OUTPUT_DIR}/*.pdf