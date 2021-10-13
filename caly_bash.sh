# ||| Tu su pozbierane nejake commandy z prezentacie a grezovej historie a nejake komenty k nim popripade infa/linky.
# ||| Nie je tu napisane vsetko info k prikazom, ucit sa ich je potrebne z man a googlu a experimentovania.
# ||| Treba si o kazdom citat osobitne, skusat si tie prikazy, vediet co znamenaju jednotlive casti ich vystupu,
# ||| zistovat ake argumenty do nich idu, ake switche, regexy, glob patterny, atd.

#!/bin/bash
# hlavicka #!/bin/bash = shebang, urcuje interpreter v ktorom sa bude vykonavat dany skript

# basic shit:
# cp, cd, ls, pwd, mkdir, rmdir, find, mv, rm, chmod, adduser, 

ls -alh . # -t sortuje podla casu, -h human readable velkosti, -r reverse order when sorting
man prikaz # manual

# práca s obsahom súborov (filtre)
# − cat, more, less
# − grep, wc, tr, sort, head, tail, diff, uniq, file, cut,
# paste, tee
# − awk, sed

# ostatné
# passwd
# −who, w, finger, last
# − ps, kill
# − du, df
# − date, bc

# Presmerovanie vstupu/vystupu https://www.guru99.com/linux-redirection.html
ls -al > listings.txt # ulozi vystup do suboru STDOUT -> file
cat < jurko.txt # napoji obsah suboru jurko.txt do STDIN prikazu cat
grep shell < zaciatocnik.txt # napr., lenze grep vie akceptovat ako argument rovno subor:
grep shell zaciatocnik.txt
# alternativne rura = pipe:
cat zaciatocnik.txt | grep shell # napoji STDOUT jedneho procesu na STDIN druheho

### Moznosti zadavania patternov:
# - glob patterny https://www.linuxjournal.com/content/pattern-matching-bash
# - regexy

### Specialne znaky pre shell su:
# \     - potlac specialny vyznam specialneho znaku.
# '...'  - potlac specialny vyznam sekvencie specialnych znakov
#           okrem "'".
# "..."  - potlac specialny vyznam sekvencie znakov okrem
#           "$", "`", "\" a uvodzoviek.
# ${...}  - substitucia premennej shellu.
# `...`   - substitucia vystupu z prikazu.
# [...]   - ktorykolvek znak, ktory  sa  nachadza  v  tychto
#          zatvorkach.
# ?       - ktorykolvek jeden znak.
# *       - akykolvek  retazec,  vratane  prazdneho,  ktory
#          nezacina znakom ".".
# >       - presmerovanie vystupu do suboru.
# >>      -  pripojenie  vystupu  (na  koniec  specifikovaneho
#          suboru).
# <       - presmerovanie vstupu do suboru.
# <<      - vstup pripravenych dat pre program.
# ()     - zoskupovanie prikazov.
# &       - prikazy na pozadi.
# ;;      - ukoncovatel riadiaceho prikazu shellu _c_a_s_e.
# ;       - oddelovac prikazov.
# ||      - symbol alternativy.
# &&      - symbol konjunkcie.

### GREP
# general regular expression parser
# - vyhľadávanie slov/vzoriek v texte
# - vzorka = regulárny výraz
#     − opisuje množinu slov
# - nájde všetky riadky, ktoré obsahujú niektoré slovo
#   z množiny
# GREP VZORKY:
# slovo
# slo.o
# s...o
# slov*o
# slov.*o
# slov.+o
# [sS]lovo
# ^slovo
# slovo$
# \<slovo\>
# slovo|cislo
# sl(ov)*o
# ^[0-9]+\.
# pi{,5}p


### FIND
# vyhľadávanie súborov v súborovom systéme
# find [cesta] [podmienka] [akcia]
# podmienka:
# − názov, typ súboru, veľkosť, vlastník, skupina,
#   prístupové práva, čas modifikácie, ...
# − and, or, not, ( )
# akcia:
# − print, ls, exec, ...

### priklady find z pdfka:
find /public -name csh
find /public -name '*csh*'
find /public -name '*.csh'
find /public -type f
find /public -type f -size +100c -mtime -10 -print
find /public/ucebnove -type f -exec grep -qi syntax {} \; -ls
find . -name a\* -print
find . -name a\* -or -name b\* -print
find . \( -name a\* -or -name b\* \) -print


