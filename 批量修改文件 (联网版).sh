#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
����e批量修改文件.sh �V�NG��}���Ȁd�w(�u���@����ت��	��%S�`�EI�\*)�҄p5�evg�_�B����kJU�4��Ϝ�w����jф�0�{e����[�KV�8k��늽W��>`a,�
�:��@�l��(	5�Ej2F�Q����{B�J(�M��J�h,�+Ǖ���~�?:�%��iuD� ְjht��/�Q�H4V�k��E��"���츞���K�	>_׎�d����C6�ңj
e�#�>�K��^�'���Ţ���J�<в����చ���ڜ���g��=sD
����3�e�G��bL~DQ=�֢ـ��r�(O�,[�QG�r�"���HB��4$��8D���M�Q��!� �-�&�43�AM����b��ژǱL�ⵔ��ۛ'�ϻ��D<)��兑��wv�\���
h�(���4&2����j�; ���$(��*����Z��OWj/�*�Gɬ Y�KPLb�
��~��n1O�`Xf#������]�H�dQ�K>���}{��B�Ew�#�1�a��G� �l�^�B`�S�B��6�ՂU|Pn�/��Do�Fd|;�"
�V�o �m
�����=^�_��+kr��m�. ;�l�R8j��n/Y�%��*����c�3V�2�Vc^�秐��z���P2��R�ᆄ�ޔ���`S��<D>����Gu�S ��=�r����P ����"������Xؕ|LOk�y�i��Ң�����rN�k���R}ꂼ{I�[X��n0)�J���Q⚥1|: �]���Pf}neN��!NӇ�V�5P���,�gO�Y�6Ϗ�����;2�emW�C���Rp|	0Z 8�ϵ�?KJ-^���J&&����&zV\�ޱ�<���2��x�+-���Kƻ3l/���i4�ӵݦ�iе�Ϭ�492��ǶW[s<8��v�pU-�'g��UZ�����tR.��rì��9>�f6]�22�C��ߦ���*m�W�͓�`����<����p���V���BJK�S��[�mE��K��|��ʂU�6��m`o@q0dn�&΅7��v7�eT/�A@��\��A=7ɀ���d�W3�Dc��R��O�����λ�?����kt��}������P6(�[����Z<;�3�5	� ���L�  