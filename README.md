# hse21_H3K27me3_ZDNA_human
Финальный проект по курсу биоинформатики
## Часть 1 : Анализ пиков гистоновой метки

Скачиваем данные
```
mkdir data ; cd data
wget https://www.encodeproject.org/files/ENCFF291DHI/@@download/ENCFF291DHI.bed.gz
gunzip ENCFF291DHI.bed.gz
cut -f1-5 ENCFF291DHI.bed > H3K27me3_ZDNA.ENCFF291DHI.hg38.bed
wget https://www.encodeproject.org/files/ENCFF695ETB/@@download/ENCFF695ETB.bed.gz
gunzip ENCFF695ETB.bed.gz
cut -f1-5 ENCFF695ETB.bed > H3K27me3_ZDNA.ENCFF695ETB.hg38.bed
```
Так как версия генома - hg38, то приводим к версии hg19. LiftOver скачан с http://hgdownload.cse.ucsc.edu/admin/exe/macOSX.x86_64/liftOver.
```
cd ..
wget https://hgdownload.cse.ucsc.edu/goldenpath/hg38/liftOver/hg38ToHg19.over.chain.gz; gunzip  hg38ToHg19.over.chain.gz 
cd data
liftOver H3K27me3_ZDNA.ENCFF291DHI.hg38.bed ../hg38ToHg19.over.chain H3K27me3_ZDNA.ENCFF291DHI.hg19.bed H3K27me3_ZDNA.ENCFF291DHI.unmapped.bed
liftOver H3K27me3_ZDNA.ENCFF695ETB.hg38.bed ../hg38ToHg19.over.chain H3K27me3_ZDNA.ENCFF695ETB.hg19.bed H3K27me3_ZDNA.ENCFF695ETB.unmapped.bed
```
Строим гистрограммы: скрипт находится в текущем репозитории, дополнительно создаем директорию для сгенерированных гистрограмм
```
cd .. ; mkdir hists
```
Количество пиков в H3K27me3_ZDNA.ENCFF291DHI
- до конвертации (hg38) : 25268
- после конвертации (hg19) : 25232

Количество пиков в H3K27me3_ZDNA.ENCFF695ETB
- до конвертации (hg38) : 25814
- после конвертации (hg19) : 25775

В качестве порога для фильтрации пиков выбрано значение 1000.
![filter_peaks.H3K27me3_ZDNA.ENCFF291DHI](hists/filter_peaks.H3K27me3_ZDNA.ENCFF291DHI.hg19.filtered.hist.pdf)
![filter_peaks.H3K27me3_ZDNA.ENCFF291DHI](hists/filter_peaks.H3K27me3_ZDNA.ENCFF291DHI.hg19.init.hist.pdf)