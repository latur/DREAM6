# DREAM6
Целью данной работы является применение [метода ППРЭ](http://urchin.spbcas.ru/trac/DEEP/wiki) к экспериментальным данным проекта DREAM6. Облатью исследования DREAM6 был поиск оптимальных параметров для генно-регуляторной сети. В качестве критерия качества алгоритмов поиска параметров была использована специальная функция расстояния (доступна в описании DREAM6) между предлагаемыми параметрами и заранее известным ответом. Этот ответ был получен неэкспериментально, а путём моделирования.

Генно-регуляторнуая сеть, при выборе и подстановке параметров, пораждает дифференциальное уравнение. Так как начальные данные определены, решение этого уравнения единственно. Решение — динамика изменений концентраций мРНК и соответствующих им белоков. При фиксированном интервале времени и разбиении решение есть матрица концентраций. В качестве оценки работы ППРЭ используютсядве характеристики: 
 * Расстояние между известной и полученной матрицами концентраций
 * Расстояние между известными и полученными параметрами. 

Важно использовать обе эти хараткеристики, так как матрица концентраций, предосталенная в качестве ответа в DREAM6 была моделирована с зашумлением данных. По этой причине метод ППРЭ может подобрать более оптимальный набор параметров и оценка по расстоянию между матрицами концентраций не будет разумной. 

## Отчёт:
1. [Визуализация численных экспериментов](http://wolframo.tk/nb/1sfh2fi54c22b8462a8f.html).
2. PDF

## Differential Evolution Entirely Parallel Method:
Требования:

    glib-2.0 >= 2.22
    gthread-2.0 >= 2.22
    gio-2.0 >= 2.22

### Стандартная установка

    git clone git://urchin.spbcas.ru:9148/deep
    cd deep
    autoreconf -fi
    ./configure --prefix=/usr/local
    make
    sudo make install

### Установка в Mac OS X:
Необходимые в mac os пакеты (менеджер пакетов [Homebrew](http://brew.sh/))

    brew install automake
    brew install gtk+
    brew install libtool
    brew install intltool

Установка GNU gettext на MAC OS X

    wget http://ftp.gnu.org/pub/gnu/gettext/gettext-0.18.3.1.tar.gz
    tar -zxvf gettext-0.18.3.1.tar.gz
    cd gettext-0.18.3.1
    ./configure
    make
    make install

Установка DEEP

    git clone git://urchin.spbcas.ru:9148/deep
    cd deep
    autoreconf --install
    rm -f po/Makefile.in.in
    ln -s /usr/local/Cellar/intltool/0.50.2/share/intltool/Makefile.in.in po/Makefile.in.in
    ./configure --prefix=/usr/local
    make
    sudo make install


### Запуск
Запускается DEEP командой:

    dpdeepctl --default-name=settings
где `settings` — имя файла параметров. Описание параметров можной найти [здесь](http://urchin.spbcas.ru/trac/DEEP/wiki/ControlParameters). Описание взаимодействия DEEP и фалов/параметров подробно изложено [здесь](http://urchin.spbcas.ru/trac/DEEP/wiki/%D0%A7%D0%B0%D1%81%D1%82%D0%BE%D0%97%D0%B0%D0%B4%D0%B0%D0%B2%D0%B0%D0%B5%D0%BC%D1%8B%D0%B5%D0%92%D0%BE%D0%BF%D1%80%D0%BE%D1%81%D1%8B).

Для удобства использования моего приолжения все настройки находятся в файле `eval.sh`, который создаёт `settings` и запускает DEEP. Реализации моделей в синтаксисе языка R находятся в папках `M1` `M2` `M3`.

    cd r-code
    chmod +x eval.sh parse.sh
    ./eval.sh
