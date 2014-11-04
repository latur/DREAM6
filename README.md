# Experimental Design for Parameter Estimation of Gene Regulatory Networks

## Abstract

Генно-регуляторные сети (GRN) активно исследуются для создания адекватного описания поведения клеток. Так как справедливость моделей GRN зависит от выбора заранее неопределённых параметров сети, требуется разработка методов для определения этих параметров по экспериментальным данным. В данной статье представлен наш подход, который был награжден как лучший в выступлении на DREAM6 (Оценка параметров модели задачи). Для быстрой и надежной оценки параметров применялась локальная детерминированная «оптимизация правдоподобия». Мы предоставили стратегию оптимального планирования хода эксперимента и продемонстрировали успешное применение нашего метода на трех  высоко нелинейных динамических моделях. Несмотря на то, что метод разрабатывался для DREAM6, наш подход является общим и применим к большинству типов количественных моделей в системной биологии и других дисциплинах.

## Introduction

В детерминированной структуре, кинетика GRN может быть описана обыкновенным дифференциальным уравнением (ОДУ). Кинетические константы, а также начальные концентрации, как правило, неизвестны и должны быть оценены из экспериментов. Кроме того, точные предсказания поведения систем при заданных возмущениях подтверждают надежность модели. В этой статье мы представляем наши методы и результаты, которые были признаны лучшими на DREAM6. Основные аспекты: расчеты оценок максимального правдоподобия для параметров и определения доверительных интервалов, используя профиль правдоподобия [4], а также изменения в логике проведения опытов, направленные на снижение неопределенности параметров и предсказаний.

## Methods

### Problem Definition

Поиск наиболее информативных экспериментальных условий весьма нетривиальный процесс. В общем, требуется установить, в какие моменты времени выполнять измерения, какие величины наблюдать и при каких возмущениях. Первый шаг: определение целевой функции, цели эксперимента. Например, ожидаемая точность оценок параметров и/или ожидаемая точность предсказаний самой модели. 

В DREAM6, цель в том, чтобы смоделировать эксперимент с подсчётом виртуальных затрат оценку параметров генных регуляторных сетей и уметь экстраполировать поведение систем (aˆJTM), т.е. прогнозировать динамику при возмущенном состоянии. Требуется оценка параметров для трёх GRN (**M1**, **M2** и **M3**) рис.1. Топология моделей, уравнения скорости реакции и начальные условия даны, так что неизвестными остаются только кинетические параметры. Активация и репрессия генов по кинетике Хилла. Продуцирование белка было смоделировано в два этапа — транскрипция и трансляция, это описано в следующем разделе.

В дополнение к экспериментам дикого типа, были рассмотрены три класса возмущений, а именно — делеции в гене, эксперименты c siRNA, изменения в сайтах связывания рибосом. Всевозможным вариациям в эксперименте была назначена виртуальная цена. Подробное описание моделей и дополнительная информация о поставленной задаче, таблицу оценок, описание целевой функции для ранжирования производительности участников можно найти в [3].

### Kinetic Equations

Динамика молекулярных соединений или видов GRN может быть описана ОДУ первого порядка.

![1](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.3.png)

Где `tau` — параметры, `u` — возмущения. Каждый компонент `f` представляет собой сумму скоростей реакций `v` из соответствующего вида. Для активации и репрессии (кинетика Хилла) предполагается, что заданы два параметра для каждой итерации: один коэффициент Хилла `tau_Hill` и Kd уровень `tau_Kd`.

Например, скорость транскрипции гена для белка p3 в модели **M1**:

![2](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.2.png)

Если белок активируется или подавляется более чем одним фактором транскрипции, соответствующие показатели складываются. Переход был смоделирован с помощью линейного ОДУ

![3](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.1.png)

Где параметры синтеза `tao_Syn` можно интерпретировать как силу сайтов связывания рибосом. Уровни деградациии `tao_Deg,p` были предположены равными для всех белков в модели. Следовательно, здесь имеется зависимость только от одного параметра. Уровни деградации мРНК `tau_Deg,mRNA` были изначально установлены равными единице (установлены организаторами) и в дальнейшем не рассматривались. Учитывая все эти описания, сеть, представленная на рис.1 может быть переведена в кинетическую модель. Интересующие нас параметры относятся к следующим категориям: уровни производства и деградации, коэффициенты Хилла, константы Михаэлиса-Ментена `K_d`. Всего требуется оценка 29 параметров для модели **M1**, 35 для **M2** и 49 для **M3**.

Здесь делециям в гене соответствует удаление его самого вместе с его продуктом, т.е. удаление целевой мРНК и белка. Примемр: `tao_Syn,mRNA` = `tao_Syn,p` = 0. Для возмущений siRNA соответствующие темпы деградации были изменены в пять раз, изменения в сайтах связывания рибосом: увеличение фактора `tao_Syn,p` в два раза.

![рис.1](https://raw.githubusercontent.com/latur/DREAM6/master/img/f1.png) |
---------------------------------------------------------------------------|
**Рисунок 1.** Модели DREAM6. Две стадии транскрипции и трансляции были объединены. Зеленые стрелки — активация, чёрные линии — репрессии. Цифры на краях соответствуют нумерации в кинетики Хилла, используемые организаторами. Белки, отмеченные красной звездочкой должны быть предсказаны в условиях возмущения для оценки точности модели. |
A: (Модель M1) 29 кинетических параметров и 8  коэффициентов Хилла / взаимодействие |
B: (Модель M2) 35 кинетических параметров и 10 коэффициентов Хилла / взаимодействие |
C: (Модель M3) 49 кинетических параметров и 15 коэффициентов Хилла / взаимодействие |

### Parameter Estimation

Параметры `tau` оценены с помощью максимума вероятности `L`: 

![4](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.4.png)

Вероятность `L` является условной вероятностью нормально распределенных измерений `у` соединения `i` в момент времени `t_j` для каждого наблюдения распределенного в соответствии с `ro`. Каждому измерению соответствует ошибка, подсчитываемая по формуле (5): 

![5](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.5.png)

Где абсолютная `e_abs` ~ N(0, `g_abs^2`) и относительная `e_rel`(x) ~ N(0, `g_rel^2`(x)) погрешности  распределены нормально со стандартными отклонениями `e_abs` = 0,1 и `e_rel` = 0.2 x (введено организаторами).

Следующие замечания были сделаны авторами. Сумма `eps_total` = `eps_abs` + `eps_rel` для двух независимых нормальных распределений `eps_abs` и `eps_rel` тоже есть нормальное распределение `eps_total` ~ N(0, `g_total^2`(x)) с дисперсией (6):

![6](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.6.png)

Таким образом, вероятность отсечения отрицательных значений можно записать как (7):

![7](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.7.png)

Где `g_total` = `g_total`(`x_i`(`t_j`, `tao`)) 

С учётом выражения для `y`, отрицательные реализации данных были отброшены с вероятностью `L_cut` (8)

![8](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.8.png)

Где `ro`(`y_ij` | 0) означает вклад одной точки наблюдения к вероятности `L`

В связи со сложностью включения формулы (8), на стадии проектирования эксперимента нами была использована формула для вероятности (7) и только для конечной стадии оценки параметров реализация (8) в с помощью более гибкого MATLAB-кода. Формула вероятности (8) корректна для данной задачи, т.к. она соответствует определённой выше функции ошибок (5). Тем не менее, для реальных биологических данных, как правило, более целесообразно использовать другие модели (функции) ошибок. При вычислении вероятности использовалось её логарифмическое представление, что было обозначено в дальнейшем как `LL`. Итак, профиль вероятности будет иметь вид (9): 

![9](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.9.png)

для параметра `tao_i` учитывая `y` с использованием [4]. В этой формуле оптимизация проводится по всем параметрам, кроме `tao_i`. Доверительные интервалы для оценки одного параметра получаем по формуле (10):

![10](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.10.png)

Здесь `a` это уровень доверия и icdf(`xi^2_1`, 1 `a`) обозначает `a`-квантиль хи-квадрат распределения с одной степенью свободы. `LL*` является максимумом функции правдоподобия (в логарифмической форме) после того, как все параметры оптимизированы. Каждая точка на профиле PL(`tao_i`) представляет собой соответствующий вектор параметров (11):

![11](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.11.png)

содержащий остальные параметры, впоследствии оптимизированные. Профили правдоподобия всех параметров представляют собой множество `TAO` (12)

![12](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.12.png)

`TAO_total` — множество векторов параметров вдоль всех профилей и ниже порога `D`, который используется при планирования эксперимента. Для определения условий эксперимента, например, возмущений, выбирается конкретное конечное подмножество `TAO` множества `TAO_total` и вектор параметров `tao` (элемент `TAO`). Возмущения учтены путем адаптации соответствующих компонентов `tao`. Широкое расхождение (распространение) полученных траекторий указывает на информативный эксперимент (см. рис.2), обеспечивая снижение неопределенности значений параметров [5]. Для формализации понятия «широкое расхождение» вводим т.наз. ранг расхождения R(D) (13):

![13](https://raw.githubusercontent.com/latur/DREAM6/master/img/bio.f.13.png)

Для потенциальных экспериментов вида D, включающих измерения видов {`x_k`} в конечных точках времени {`t_j`} предоставляющих собой временное разрешение эксперимента. Дальнейшие возможности для оценки расхождения приведены, например, путем оценки дисперсии по каждому наблюдению или путем замены максимизации на суммирование (по наблюдениям) в формуле (13). Тем не менее, другие возможные метрики для измерения расхождения дают сопоставимые результаты. Исследуемая система ОДУ даёт, в целом, нелинейные решения по отношению к  параметрам. План эксперимента многократно ограничивает пространство параметров, что согласуется с данными. В «асимптотической постановке», качества и количества данных достаточно, чтобы изменить форму правдоподобия с помощью многомерного нормального распределения. Это равносильно тому, что траектории наблюдения {`x_i`(`t_j`)} в `LL` имеют почти линейную зависимость по отношению к параметрам. Поэтому решение нелинейной системы ОДУ локально ведет себя линейно в области параметров. Тогда, неопределенность может быть представлена как стандартная ошибка или информация Фишера. Тем не менее, в неасимптотических случаях нелинейность влечёт численные эвристические предположения для предсказания параметров неопределенностей.

![рис.2](https://raw.githubusercontent.com/latur/DREAM6/master/img/f2.png) |
---------------------------------------------------------------------------|
**Рисунок 2.** Эксперимент, основанный на анализе профиля вероятностей.    |

