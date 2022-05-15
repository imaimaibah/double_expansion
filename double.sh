export FIZZ=imaimaibah
echo ==== 1 ====
"echo \"$(cat example.txt)\"" 
echo === END ===

echo ==== 2 ====
eval echo $(cat example.txt) 
echo === END ===

echo ==== 3 ====
eval "cat <<<\"$(cat example.txt)\""
echo === END ===

echo ==== 4 ====
#eval cat <<<$(cat example.txt)
echo === END ===

echo ==== 5 ====
bash -c "echo \"$(cat example.txt|sed 's/\"/\\\"/g')\"" 
echo === END ===

echo ==== 6 ====
eval "echo \"$(cat example.txt|sed 's/\"/\\\"/g')\""
echo === END ===

echo ==== 7 ====
bash -c "cat <<<\"$(cat example.txt)\""
echo === END ===

echo ==== 8 ====
echo "cat <<<\"$(cat example.txt)\"" |bash -s
echo === END ===

echo ==== 9 ====
echo "echo \"$(cat example.txt)\"" |bash -s
echo === END ===

echo ==== 10 ====
echo $"$(cat example.txt)"
echo === END ===

echo ==== 11 ====
printf "cat <<++EOS\n$(cat example.txt)\n++EOS\n" | sh
echo ==== END ====

echo ==== 12 ====
eval "echo -e \"$(<example2.txt)\"" 
echo ==== END ====

echo ==== 13 ====
eval "cat <<EOF
$(<example2.txt)
EOF"
echo ==== END ====

echo ==== 14 ====
bash -c "cat <<EOF
$(<example2.txt)
EOF" | cat
echo ==== END ====

echo ==== 15 ====
bash -c "cat <<EOF
$(<example.txt)

$(<example2.txt)
EOF"
echo ==== END ====

echo ==== 16 ====
echo example.txt
(echo "cat <<EOF";cat example.txt;echo "EOF") |  sh -s --
echo example2.txt
(echo "cat <<EOF";cat example2.txt;echo "EOF") | sh -s --
echo ==== END ====


echo ==== 17 ====
eval "cat <<EOF
$(<$1)

$(<./example2.txt)
EOF"
echo ==== END ====


echo ==== 18 ====
echo -e "cat <<EOF;\n$(<./example.txt)\n\n\n$(<./example2.txt)\nEOF"|sh -s --
echo ==== END ====
