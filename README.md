# DREAM6
Цель работы — применение и исследование сходимости метода полностью параллельной разностной эволюции (далее [метода ППРЭ](http://urchin.spbcas.ru/trac/DEEP/wiki)) для нахождения параметров моделей по~данным проекта DREAM (испытание 6).

Метод ППРЭ является модификацией стохастического метода оптимизации.

Учитывая, что для решения задачи минимизации произвольной целевой функции не существует универсального алгоритма, разработка и усовершенствование методов их решения остается актуальной задачей.

В ходе выполнения работы были реализованы три модели генных регуляторных сетей на языке R. Были проведены численные эксперименты по подбору параметров генных сетей с помощью метода ППРЭ. Проведён анализ динамики и скорости сходимости метода ППРЭ.

Генные сети важны для моделирования организма, для изучения влияния мутаций на организм, клетку, на саму сеть. Генные сети являются способом дешевой проверки воздействия веществ (лекарств) и других факторов на биосистему.

Генно-регуляторнуая сеть, при выборе и подстановке параметров, пораждает дифференциальное уравнение. Так как начальные данные определены, решение этого уравнения — динамика концентраций мРНК и соответствующих им белоков. При фиксированном интервале времени и разбиении решение есть матрица концентраций. В качестве оценки работы ППРЭ используютсядве характеристики: 
 * Расстояние между известной и полученной матрицами концентраций
 * Расстояние между известными и полученными параметрами. 

## Отчёт:
[PDF](https://github.com/latur/DREAM6/blob/master/tex-report/index.pdf)

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
